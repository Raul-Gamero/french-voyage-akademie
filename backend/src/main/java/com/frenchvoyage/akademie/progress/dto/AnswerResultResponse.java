package com.frenchvoyage.akademie.progress.dto;

/** Verdict renvoyé après une soumission, accompagné de l'explication pédagogique. */
public record AnswerResultResponse(
        Long exerciseId,
        boolean correct,
        int pointsAwarded,
        String explanation,
        int lessonScore,
        int lessonMaxScore
) {
}
