package com.frenchvoyage.akademie.catalog.dto;

/** Bloc de contenu d'une leçon. Le corps est du Markdown restreint. */
public record SectionResponse(
        Long id,
        int position,
        String type,
        String title,
        String body,
        String mediaUrl,
        String mediaType
) {
}
