package com.frenchvoyage.akademie.user.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.AssertTrue;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

/**
 * Demande d'inscription.
 *
 * <p>Le consentement au traitement des données est explicite et obligatoire :
 * exigence de l'article 7 du RGPD, il ne peut pas être pré-coché côté client.</p>
 */
@Schema(description = "Création d'un compte apprenant")
public record RegisterRequest(

        @NotBlank(message = "L'adresse électronique est obligatoire.")
        @Email(message = "L'adresse électronique n'est pas valide.")
        @Size(max = 190)
        String email,

        @NotBlank(message = "Le mot de passe est obligatoire.")
        @Size(min = 8, max = 72, message = "Le mot de passe doit contenir entre 8 et 72 caractères.")
        @Pattern(regexp = ".*\\p{L}.*", message = "Le mot de passe doit contenir au moins une lettre.")
        @Pattern(regexp = ".*\\d.*", message = "Le mot de passe doit contenir au moins un chiffre.")
        String password,

        @NotBlank(message = "Le nom d'affichage est obligatoire.")
        @Size(min = 2, max = 80)
        String displayName,

        @Schema(description = "Langue d'interface : en ou fr", example = "en")
        String interfaceLocale,

        @AssertTrue(message = "Le consentement à la politique de confidentialité est obligatoire.")
        boolean privacyConsent
) {
}
