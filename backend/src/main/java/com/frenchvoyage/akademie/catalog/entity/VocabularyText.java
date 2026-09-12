package com.frenchvoyage.akademie.catalog.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Glose d'un terme dans une langue donnée. En français, il s'agit d'une
 * définition monolingue plutôt que d'une traduction.
 */
@Embeddable
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class VocabularyText {

    @Column(nullable = false, length = 220)
    private String translation;

    @Column(columnDefinition = "text")
    private String note;
}
