package com.frenchvoyage.akademie.security;

import com.frenchvoyage.akademie.config.AppProperties;
import com.frenchvoyage.akademie.user.Role;
import com.frenchvoyage.akademie.user.User;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

@DisplayName("Émission et vérification des jetons d'accès")
class JwtServiceTest {

    private static final String SECRET = "secret-de-test-suffisamment-long-pour-hmac-256";

    @Test
    @DisplayName("le jeton émis porte l'adresse, l'identifiant et le rôle")
    void issuedTokenCarriesIdentity() {
        JwtService service = serviceWith(SECRET, 60);

        String token = service.issueToken(new AuthenticatedUser(user()));

        var claims = service.parse(token).orElseThrow();
        assertThat(claims.getSubject()).isEqualTo("marie@example.org");
        assertThat(claims.get("uid", Integer.class)).isEqualTo(7);
        assertThat(claims.get("role", String.class)).isEqualTo("ROLE_STUDENT");
        assertThat(claims.getExpiration()).isAfter(claims.getIssuedAt());
    }

    @Test
    @DisplayName("un jeton signé avec une autre clé est rejeté")
    void tokenSignedWithAnotherKeyIsRejected() {
        String foreignToken = serviceWith("une-toute-autre-cle-de-signature-32car", 60)
                .issueToken(new AuthenticatedUser(user()));

        assertThat(serviceWith(SECRET, 60).parse(foreignToken)).isEmpty();
    }

    @Test
    @DisplayName("un jeton dont la charge utile a été modifiée est rejeté")
    void tamperedTokenIsRejected() {
        JwtService service = serviceWith(SECRET, 60);
        String token = service.issueToken(new AuthenticatedUser(user()));

        assertThat(service.parse(token)).isPresent();
        assertThat(service.parse(token + "falsifie")).isEmpty();
    }

    @Test
    @DisplayName("du texte qui n'est pas un jeton est rejeté sans exception")
    void garbageIsRejected() {
        JwtService service = serviceWith(SECRET, 60);

        assertThat(service.parse("pas-un-jeton")).isEmpty();
        assertThat(service.parse("")).isEmpty();
    }

    @Test
    @DisplayName("une clé trop courte empêche le démarrage")
    void shortSecretIsRefused() {
        assertThatThrownBy(() -> serviceWith("trop-court", 60))
                .isInstanceOf(IllegalStateException.class)
                .hasMessageContaining("32");
    }

    @Test
    @DisplayName("la durée de validité annoncée correspond à la configuration")
    void validityMatchesConfiguration() {
        assertThat(serviceWith(SECRET, 120).validitySeconds()).isEqualTo(7200);
    }

    private JwtService serviceWith(String secret, long minutes) {
        return new JwtService(new AppProperties(secret, minutes, List.of(), "2026-09-01", null));
    }

    private User user() {
        User user = new User();
        user.setId(7L);
        user.setEmail("marie@example.org");
        user.setPasswordHash("empreinte");
        user.setDisplayName("Marie");
        user.setRole(Role.ROLE_STUDENT);
        user.setEnabled(true);
        return user;
    }
}
