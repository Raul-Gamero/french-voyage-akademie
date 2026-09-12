package com.frenchvoyage.akademie.catalog.entity;

import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapKeyColumn;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Option proposée par un QCM ou un vrai/faux.
 *
 * <p>{@code label} contient le texte français par défaut. Lorsque l'option
 * doit apparaître dans la langue de l'interface — par exemple « Choisissez
 * la bonne traduction » —, une surcharge par langue est possible.</p>
 */
@Entity
@Table(name = "exercise_options")
@Getter
@Setter
public class ExerciseOption {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "exercise_id", nullable = false)
    private Exercise exercise;

    @Column(nullable = false)
    private Integer position;

    @Column(nullable = false, length = 220)
    private String label;

    @Column(nullable = false)
    private boolean correct;

    @ElementCollection(fetch = FetchType.LAZY)
    @CollectionTable(name = "exercise_option_translations", joinColumns = @JoinColumn(name = "option_id"))
    @MapKeyColumn(name = "locale", length = 8)
    @Column(name = "label", length = 220)
    private Map<String, String> translations = new LinkedHashMap<>();
}
