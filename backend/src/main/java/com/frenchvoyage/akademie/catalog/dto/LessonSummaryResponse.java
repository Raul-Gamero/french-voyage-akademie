package com.frenchvoyage.akademie.catalog.dto;

/** Leçon telle qu'affichée dans la liste d'une unité. */
public record LessonSummaryResponse(
        Long id,
        String slug,
        int position,
        String title,
        String summary,
        int estimatedMinutes,
        int exerciseCount
) {
}
