package com.frenchvoyage.akademie.user;

import com.frenchvoyage.akademie.common.ConflictException;
import com.frenchvoyage.akademie.common.NotFoundException;
import com.frenchvoyage.akademie.config.AppProperties;
import com.frenchvoyage.akademie.user.dto.ChangePasswordRequest;
import com.frenchvoyage.akademie.user.dto.RegisterRequest;
import com.frenchvoyage.akademie.user.dto.UpdateProfileRequest;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
@DisplayName("Cycle de vie du compte apprenant")
class UserServiceTest {

    @Mock
    private UserRepository userRepository;

    @Mock
    private PasswordEncoder passwordEncoder;

    private UserService userService;

    @BeforeEach
    void setUp() {
        AppProperties properties = new AppProperties(
                "un-secret-de-test-suffisamment-long-1234",
                120,
                List.of("http://localhost:8100"),
                "2026-09-01",
                new AppProperties.Admin(null, null));
        userService = new UserService(userRepository, passwordEncoder, properties);
    }

    @Test
    @DisplayName("l'inscription chiffre le mot de passe et horodate le consentement")
    void registerHashesPasswordAndRecordsConsent() {
        when(userRepository.existsByEmailIgnoreCase("marie@example.org")).thenReturn(false);
        when(passwordEncoder.encode("motdepasse1")).thenReturn("$2a$12$empreinte");
        when(userRepository.save(any(User.class))).thenAnswer(invocation -> invocation.getArgument(0));

        User created = userService.register(new RegisterRequest(
                "  Marie@Example.org ", "motdepasse1", " Marie ", "fr", true));

        ArgumentCaptor<User> captor = ArgumentCaptor.forClass(User.class);
        verify(userRepository).save(captor.capture());
        User saved = captor.getValue();

        assertThat(saved.getEmail()).isEqualTo("marie@example.org");
        assertThat(saved.getPasswordHash()).isEqualTo("$2a$12$empreinte");
        assertThat(saved.getDisplayName()).isEqualTo("Marie");
        assertThat(saved.getInterfaceLocale()).isEqualTo("fr");
        assertThat(saved.getRole()).isEqualTo(Role.ROLE_STUDENT);
        assertThat(saved.getPrivacyConsentVersion()).isEqualTo("2026-09-01");
        assertThat(saved.getPrivacyConsentAt()).isNotNull();
        assertThat(created).isSameAs(saved);
    }

    @Test
    @DisplayName("une inscription sur une adresse déjà connue est refusée")
    void registerRejectsDuplicateEmail() {
        when(userRepository.existsByEmailIgnoreCase("marie@example.org")).thenReturn(true);

        assertThatThrownBy(() -> userService.register(new RegisterRequest(
                "marie@example.org", "motdepasse1", "Marie", "en", true)))
                .isInstanceOf(ConflictException.class);

        verify(userRepository, never()).save(any());
    }

    @Test
    @DisplayName("une langue non gérée retombe sur l'anglais")
    void registerFallsBackToDefaultLocale() {
        when(userRepository.existsByEmailIgnoreCase(anyString())).thenReturn(false);
        when(passwordEncoder.encode(anyString())).thenReturn("empreinte");
        when(userRepository.save(any(User.class))).thenAnswer(invocation -> invocation.getArgument(0));

        User created = userService.register(new RegisterRequest(
                "ana@example.org", "motdepasse1", "Ana", "de", true));

        assertThat(created.getInterfaceLocale()).isEqualTo("en");
    }

    @Test
    @DisplayName("le changement de mot de passe exige le mot de passe actuel")
    void changePasswordRequiresCurrentPassword() {
        User user = existingUser();
        when(userRepository.findById(1L)).thenReturn(Optional.of(user));
        when(passwordEncoder.matches("mauvais", "empreinte-actuelle")).thenReturn(false);

        assertThatThrownBy(() -> userService.changePassword(1L,
                new ChangePasswordRequest("mauvais", "nouveaumdp1")))
                .isInstanceOf(ConflictException.class);

        verify(userRepository, never()).save(any());
    }

    @Test
    @DisplayName("le nouveau mot de passe remplace l'empreinte stockée")
    void changePasswordStoresNewHash() {
        User user = existingUser();
        when(userRepository.findById(1L)).thenReturn(Optional.of(user));
        when(passwordEncoder.matches("actuel1", "empreinte-actuelle")).thenReturn(true);
        when(passwordEncoder.encode("nouveaumdp1")).thenReturn("nouvelle-empreinte");
        when(userRepository.save(any(User.class))).thenAnswer(invocation -> invocation.getArgument(0));

        userService.changePassword(1L, new ChangePasswordRequest("actuel1", "nouveaumdp1"));

        assertThat(user.getPasswordHash()).isEqualTo("nouvelle-empreinte");
    }

    @Test
    @DisplayName("la mise à jour du profil laisse la langue inchangée si elle n'est pas fournie")
    void updateProfileKeepsLocaleWhenAbsent() {
        User user = existingUser();
        when(userRepository.findById(1L)).thenReturn(Optional.of(user));
        when(userRepository.save(any(User.class))).thenAnswer(invocation -> invocation.getArgument(0));

        User updated = userService.updateProfile(1L, new UpdateProfileRequest(" Marie D. ", null));

        assertThat(updated.getDisplayName()).isEqualTo("Marie D.");
        assertThat(updated.getInterfaceLocale()).isEqualTo("fr");
    }

    @Test
    @DisplayName("la suppression du compte délègue l'effacement au dépôt")
    void deleteAccountRemovesUser() {
        User user = existingUser();
        when(userRepository.findById(1L)).thenReturn(Optional.of(user));

        userService.deleteAccount(1L);

        verify(userRepository).delete(user);
    }

    @Test
    @DisplayName("un identifiant inconnu lève une erreur explicite")
    void requireByIdFailsOnUnknownUser() {
        when(userRepository.findById(99L)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> userService.requireById(99L))
                .isInstanceOf(NotFoundException.class);
    }

    private User existingUser() {
        User user = new User();
        user.setId(1L);
        user.setEmail("marie@example.org");
        user.setPasswordHash("empreinte-actuelle");
        user.setDisplayName("Marie");
        user.setInterfaceLocale("fr");
        user.setRole(Role.ROLE_STUDENT);
        user.setEnabled(true);
        return user;
    }
}
