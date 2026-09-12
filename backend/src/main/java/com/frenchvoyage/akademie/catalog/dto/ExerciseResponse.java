package com.frenchvoyage.akademie.catalog.dto;

import java.util.List;

/** Exercice présenté à l'apprenant, sans sa correction. */
public record ExerciseResponse(
        Long id,
        int position,
        String type,
        String prompt,
        int points,
        List<ExerciseOptionResponse> options
) {
}
