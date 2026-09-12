package com.frenchvoyage.akademie.auth.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

public record LoginRequest(

        @NotBlank(message = "L'adresse électronique est obligatoire.")
        @Email(message = "L'adresse électronique n'est pas valide.")
        String email,

        @NotBlank(message = "Le mot de passe est obligatoire.")
        String password
) {
}
