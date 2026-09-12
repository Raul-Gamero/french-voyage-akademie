package com.frenchvoyage.akademie.progress.dto;

import java.time.Instant;

/** Avancement de l'apprenant sur une leçon. */
public record LessonProgressResponse(
        Long lessonId,
        String lessonSlug,
        String lessonTitle,
        String unitSlug,
        String status,
        int score,
        int maxScore,
        int percentage,
        Instant startedAt,
        Instant completedAt
) {
}
