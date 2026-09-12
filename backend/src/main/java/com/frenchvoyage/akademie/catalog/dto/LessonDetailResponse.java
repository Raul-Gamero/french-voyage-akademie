package com.frenchvoyage.akademie.catalog.dto;

import java.util.List;

/** Leçon complète : tout ce dont le client a besoin pour l'afficher hors connexion. */
public record LessonDetailResponse(
        Long id,
        String slug,
        int position,
        String title,
        String summary,
        String objective,
        int estimatedMinutes,
        String unitSlug,
        String unitTitle,
        String levelCode,
        int maxScore,
        List<SectionResponse> sections,
        List<VocabularyResponse> vocabulary,
        List<ExerciseResponse> exercises
) {
}
