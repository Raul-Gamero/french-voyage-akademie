package com.frenchvoyage.akademie.catalog.dto;

import io.swagger.v3.oas.annotations.media.Schema;

/** Niveau CECR tel qu'affiché sur la page d'accueil du catalogue. */
@Schema(description = "Niveau du Cadre européen commun de référence")
public record LevelSummaryResponse(
        String code,
        String name,
        String description,
        boolean published,
        int unitCount,
        int lessonCount
) {
}
