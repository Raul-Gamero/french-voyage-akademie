package com.frenchvoyage.akademie.catalog.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/** Textes d'une leçon dans une langue donnée. */
@Embeddable
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class LessonText {

    @Column(nullable = false, length = 180)
    private String title;

    @Column(columnDefinition = "text")
    private String summary;

    /** Objectif d'apprentissage, formulé d'après un descripteur A1 du CECR. */
    @Column(columnDefinition = "text")
    private String objective;
}
