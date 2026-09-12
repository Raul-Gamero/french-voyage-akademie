package com.frenchvoyage.akademie.progress.entity;

import com.frenchvoyage.akademie.catalog.entity.Exercise;
import com.frenchvoyage.akademie.user.User;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;

/**
 * Trace d'une tentative de réponse.
 *
 * <p>Conservée pour que l'apprenant revoie son parcours et pour mesurer,
 * lors de la phase pilote, quels points de grammaire résistent le plus.</p>
 */
@Entity
@Table(name = "exercise_attempts")
@Getter
@Setter
public class ExerciseAttempt {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "exercise_id", nullable = false)
    private Exercise exercise;

    @Column(name = "submitted_answer", columnDefinition = "text")
    private String submittedAnswer;

    @Column(nullable = false)
    private boolean correct;

    @Column(name = "points_awarded", nullable = false)
    private Integer pointsAwarded = 0;

    @Column(name = "attempted_at", nullable = false)
    private Instant attemptedAt;

    @PrePersist
    void onCreate() {
        attemptedAt = Instant.now();
    }
}
