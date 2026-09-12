package com.frenchvoyage.akademie.config;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Positive;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.validation.annotation.Validated;

import java.util.List;

/**
 * Configuration propre à l'application, alimentée par les variables
 * d'environnement (voir {@code .env.example}). Aucune valeur secrète
 * n'est codée en dur : l'absence de {@code FVA_JWT_SECRET} empêche
 * le démarrage, ce qui est voulu.
 */
@Validated
@ConfigurationProperties(prefix = "fva")
public record AppProperties(
        @NotBlank String jwtSecret,
        @Positive long jwtExpirationMinutes,
        List<String> corsAllowedOrigins,
        String privacyPolicyVersion,
        Admin admin
) {
    public record Admin(String email, String password) {
    }
}
