package com.frenchvoyage.akademie.user;

import com.frenchvoyage.akademie.common.ConflictException;
import com.frenchvoyage.akademie.common.LocaleSupport;
import com.frenchvoyage.akademie.common.NotFoundException;
import com.frenchvoyage.akademie.config.AppProperties;
import com.frenchvoyage.akademie.user.dto.ChangePasswordRequest;
import com.frenchvoyage.akademie.user.dto.RegisterRequest;
import com.frenchvoyage.akademie.user.dto.UpdateProfileRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.util.Locale;

/** Cycle de vie du compte apprenant. */
@Service
public class UserService {

    private static final Logger log = LoggerFactory.getLogger(UserService.class);

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final AppProperties properties;

    public UserService(UserRepository userRepository,
                       PasswordEncoder passwordEncoder,
                       AppProperties properties) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.properties = properties;
    }

    @Transactional
    public User register(RegisterRequest request) {
        String email = normalizeEmail(request.email());
        if (userRepository.existsByEmailIgnoreCase(email)) {
            throw new ConflictException("Un compte existe déjà pour cette adresse électronique.");
        }

        User user = new User();
        user.setEmail(email);
        user.setPasswordHash(passwordEncoder.encode(request.password()));
        user.setDisplayName(request.displayName().trim());
        user.setInterfaceLocale(LocaleSupport.normalize(request.interfaceLocale()));
        user.setRole(Role.ROLE_STUDENT);
        user.setEnabled(true);
        user.setPrivacyConsentVersion(properties.privacyPolicyVersion());
        user.setPrivacyConsentAt(Instant.now());

        User saved = userRepository.save(user);
        // Identifiant technique seulement : pas d'adresse électronique dans les journaux.
        log.info("Nouveau compte créé (id={})", saved.getId());
        return saved;
    }

    @Transactional(readOnly = true)
    public User requireByEmail(String email) {
        return userRepository.findByEmailIgnoreCase(normalizeEmail(email))
                .orElseThrow(() -> NotFoundException.of("Utilisateur", email));
    }

    @Transactional(readOnly = true)
    public User requireById(Long id) {
        return userRepository.findById(id)
                .orElseThrow(() -> NotFoundException.of("Utilisateur", id));
    }

    @Transactional
    public User updateProfile(Long userId, UpdateProfileRequest request) {
        User user = requireById(userId);
        user.setDisplayName(request.displayName().trim());
        if (request.interfaceLocale() != null && !request.interfaceLocale().isBlank()) {
            user.setInterfaceLocale(LocaleSupport.normalize(request.interfaceLocale()));
        }
        return userRepository.save(user);
    }

    @Transactional
    public void changePassword(Long userId, ChangePasswordRequest request) {
        User user = requireById(userId);
        if (!passwordEncoder.matches(request.currentPassword(), user.getPasswordHash())) {
            throw new ConflictException("Le mot de passe actuel est incorrect.");
        }
        user.setPasswordHash(passwordEncoder.encode(request.newPassword()));
        userRepository.save(user);
        log.info("Mot de passe modifié (id={})", userId);
    }

    @Transactional
    public void recordLogin(User user) {
        user.setLastLoginAt(Instant.now());
        userRepository.save(user);
    }

    /**
     * Suppression du compte et, par cascade, de toute la progression associée.
     * Met en œuvre le droit à l'effacement (article 17 du RGPD).
     */
    @Transactional
    public void deleteAccount(Long userId) {
        User user = requireById(userId);
        userRepository.delete(user);
        log.info("Compte supprimé à la demande de la personne concernée (id={})", userId);
    }

    private String normalizeEmail(String email) {
        return email == null ? "" : email.trim().toLowerCase(Locale.ROOT);
    }
}
