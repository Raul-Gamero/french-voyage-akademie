package com.frenchvoyage.akademie.user.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

public record ChangePasswordRequest(

        @NotBlank(message = "Le mot de passe actuel est obligatoire.")
        String currentPassword,

        @NotBlank(message = "Le nouveau mot de passe est obligatoire.")
        @Size(min = 8, max = 72, message = "Le mot de passe doit contenir entre 8 et 72 caractères.")
        @Pattern(regexp = ".*\\p{L}.*", message = "Le mot de passe doit contenir au moins une lettre.")
        @Pattern(regexp = ".*\\d.*", message = "Le mot de passe doit contenir au moins un chiffre.")
        String newPassword
) {
}
