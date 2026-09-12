package com.frenchvoyage.akademie.catalog.dto;

/** Entrée de vocabulaire, glosée dans la langue demandée. */
public record VocabularyResponse(
        Long id,
        int position,
        String term,
        String phonetic,
        String translation,
        String note,
        String exampleSentence,
        String audioUrl
) {
}
