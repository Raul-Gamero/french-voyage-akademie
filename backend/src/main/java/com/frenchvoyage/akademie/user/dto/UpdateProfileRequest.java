package com.frenchvoyage.akademie.user.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record UpdateProfileRequest(

        @NotBlank(message = "Le nom d'affichage est obligatoire.")
        @Size(min = 2, max = 80)
        String displayName,

        String interfaceLocale
) {
}
