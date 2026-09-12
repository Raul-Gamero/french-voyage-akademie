package com.frenchvoyage.akademie.catalog.entity;

import com.frenchvoyage.akademie.common.TextNormalizer;
import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapKeyColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OrderBy;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Exercice d'évaluation d'une leçon.
 *
 * <p>La correction est portée par l'entité elle-même : la réponse attendue
 * n'est jamais exposée par l'API, seul le verdict et l'explication le sont.</p>
 */
@Entity
@Table(name = "exercises")
@Getter
@Setter
public class Exercise {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "lesson_id", nullable = false)
    private Lesson lesson;

    @Column(nullable = false)
    private Integer position;

    @Enumerated(EnumType.STRING)
    @Column(name = "exercise_type", nullable = false, length = 24)
    private ExerciseType exerciseType;

    @Column(nullable = false)
    private Integer points = 1;

    @ElementCollection(fetch = FetchType.LAZY)
    @CollectionTable(name = "exercise_translations", joinColumns = @JoinColumn(name = "exercise_id"))
    @MapKeyColumn(name = "locale", length = 8)
    private Map<String, ExerciseText> translations = new LinkedHashMap<>();

    @OneToMany(mappedBy = "exercise", fetch = FetchType.LAZY)
    @OrderBy("position ASC")
    private List<ExerciseOption> options = new ArrayList<>();

    @OneToMany(mappedBy = "exercise", fetch = FetchType.LAZY)
    private List<ExerciseAnswer> answers = new ArrayList<>();

    public int getPoints() {
        return points == null ? 1 : points;
    }

    /**
     * Évalue une réponse.
     *
     * <p>Pour un QCM ou un vrai/faux, la réponse soumise est l'identifiant de
     * l'option choisie. Pour un texte à trous, c'est la saisie de l'apprenant,
     * comparée après normalisation (casse, accents et ponctuation ignorés).</p>
     */
    public boolean isCorrect(String submittedAnswer) {
        if (submittedAnswer == null || submittedAnswer.isBlank()) {
            return false;
        }
        return switch (exerciseType) {
            case MULTIPLE_CHOICE, TRUE_FALSE -> options.stream()
                    .filter(ExerciseOption::isCorrect)
                    .anyMatch(option -> String.valueOf(option.getId()).equals(submittedAnswer.trim()));
            case FILL_BLANK -> answers.stream()
                    .anyMatch(answer -> TextNormalizer.matches(submittedAnswer, answer.getNormalizedAnswer()));
        };
    }
}
