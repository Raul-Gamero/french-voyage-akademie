package com.frenchvoyage.akademie.catalog.dto;

/**
 * Option proposée à l'apprenant.
 *
 * <p>Le caractère correct de l'option n'apparaît volontairement pas :
 * la réponse attendue ne quitte jamais le serveur.</p>
 */
public record ExerciseOptionResponse(
        Long id,
        int position,
        String label
) {
}
