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
import jakarta.persistence.OneToMany;
import jakarta.persistence.OrderBy;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Unité d'un niveau : dix leçons regroupées autour d'un fil thématique. */
@Entity
@Table(name = "units")
@Getter
@Setter
public class Unit {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "level_id", nullable = false)
    private Level level;

    @Column(nullable = false, unique = true, length = 90)
    private String slug;

    @Column(nullable = false)
    private Integer position;

    @Column(nullable = false)
    private boolean published;

    @ElementCollection(fetch = FetchType.LAZY)
    @CollectionTable(name = "unit_translations", joinColumns = @JoinColumn(name = "unit_id"))
    @MapKeyColumn(name = "locale", length = 8)
    private Map<String, UnitText> translations = new LinkedHashMap<>();

    @OneToMany(mappedBy = "unit", fetch = FetchType.LAZY)
    @OrderBy("position ASC")
    private List<Lesson> lessons = new ArrayList<>();
}
