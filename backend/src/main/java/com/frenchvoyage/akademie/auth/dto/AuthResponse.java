package com.frenchvoyage.akademie.auth.dto;

import com.frenchvoyage.akademie.user.dto.UserProfileResponse;
import io.swagger.v3.oas.annotations.media.Schema;

/** Jeton d'accès et profil, renvoyés ensemble pour éviter un aller-retour. */
@Schema(description = "Résultat d'une inscription ou d'une connexion")
public record AuthResponse(

        @Schema(description = "Jeton JWT à placer dans l'en-tête Authorization")
        String accessToken,

        @Schema(example = "Bearer")
        String tokenType,

        @Schema(description = "Durée de validité du jeton, en secondes")
        long expiresIn,

        UserProfileResponse user
) {
    public static AuthResponse of(String token, long expiresIn, UserProfileResponse user) {
        return new AuthResponse(token, "Bearer", expiresIn, user);
    }
}
