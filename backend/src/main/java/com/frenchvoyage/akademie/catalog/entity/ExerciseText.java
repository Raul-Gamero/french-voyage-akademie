package com.frenchvoyage.akademie.catalog.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/** Consigne et explication d'un exercice dans une langue donnée. */
@Embeddable
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ExerciseText {

    @Column(nullable = false, columnDefinition = "text")
    private String prompt;

    /** Affichée après la réponse, correcte ou non : l'erreur doit enseigner. */
    @Column(columnDefinition = "text")
    private String explanation;
}
