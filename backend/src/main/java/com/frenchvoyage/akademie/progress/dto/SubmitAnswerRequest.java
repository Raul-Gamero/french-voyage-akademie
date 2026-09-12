package com.frenchvoyage.akademie.progress.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

/** Réponse soumise par l'apprenant pour un exercice. */
@Schema(description = "Soumission d'une réponse")
public record SubmitAnswerRequest(

        @NotNull(message = "L'identifiant de l'exercice est obligatoire.")
        Long exerciseId,

        @Schema(description = "Identifiant de l'option choisie (QCM) ou texte saisi (texte à trous)")
        @Size(max = 500)
        String answer
) {
}
