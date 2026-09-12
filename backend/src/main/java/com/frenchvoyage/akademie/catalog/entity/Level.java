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
 * Niveau du Cadre européen commun de référence (A1 … C2).
 *
 * <p>Les six niveaux existent en base dès la première version ; seul A1 est
 * publié. Ouvrir A2 consistera à insérer des unités et à basculer
 * {@code published}, sans migration de schéma.</p>
 */
@Entity
@Table(name = "levels")
@Getter
@Setter
public class Level {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, length = 8)
    private String code;

    @Column(nullable = false)
    private Integer position;

    @Column(nullable = false)
    private boolean published;

    @ElementCollection(fetch = FetchType.LAZY)
    @CollectionTable(name = "level_translations", joinColumns = @JoinColumn(name = "level_id"))
    @MapKeyColumn(name = "locale", length = 8)
    private Map<String, LevelText> translations = new LinkedHashMap<>();

    @OneToMany(mappedBy = "level", fetch = FetchType.LAZY)
    @OrderBy("position ASC")
    private List<Unit> units = new ArrayList<>();
}
