package com.frenchvoyage.akademie.catalog.dto;

import java.util.List;

/** Unité et la liste ordonnée de ses leçons publiées. */
public record UnitSummaryResponse(
        Long id,
        String slug,
        int position,
        String title,
        String description,
        List<LessonSummaryResponse> lessons
) {
}
