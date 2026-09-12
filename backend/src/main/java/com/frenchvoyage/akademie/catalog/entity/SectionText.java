package com.frenchvoyage.akademie.catalog.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/** Contenu d'une section dans une langue donnée. */
@Embeddable
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SectionText {

    @Column(nullable = false, length = 180)
    private String title;

    /** Markdown restreint : titres, listes, gras, tableaux. */
    @Column(columnDefinition = "text")
    private String body;
}
