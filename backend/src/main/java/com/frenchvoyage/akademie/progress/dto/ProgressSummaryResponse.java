package com.frenchvoyage.akademie.progress.dto;

import java.util.List;

/** Tableau de bord de l'apprenant. */
public record ProgressSummaryResponse(
        long lessonsCompleted,
        long lessonsInProgress,
        long lessonsAvailable,
        int totalScore,
        int completionPercentage,
        List<LessonProgressResponse> lessons
) {
}
