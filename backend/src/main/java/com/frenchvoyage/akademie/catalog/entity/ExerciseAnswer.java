package com.frenchvoyage.akademie.catalog.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

/**
 * Réponse acceptée pour un exercice à saisie libre. Un même exercice peut
 * en accepter plusieurs : « je suis » et « je suis étudiant », par exemple.
 */
@Entity
@Table(name = "exercise_answers")
@Getter
@Setter
public class ExerciseAnswer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "exercise_id", nullable = false)
    private Exercise exercise;

    @Column(name = "normalized_answer", nullable = false, length = 220)
    private String normalizedAnswer;
}
