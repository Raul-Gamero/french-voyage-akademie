package com.frenchvoyage.akademie.common;

import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * Langues d'interface prises en charge.
 *
 * <p>L'ajout de l'espagnol ou de l'allemand se limite à étendre
 * {@link #SUPPORTED} : ni le schéma de base de données ni les entités
 * ne changent, conformément à l'objectif de scalabilité du projet.</p>
 */
public final class LocaleSupport {

    /** Langue de repli : l'anglais est la langue véhiculaire de la plateforme. */
    public static final String DEFAULT_LOCALE = "en";

    public static final Set<String> SUPPORTED = Set.of("en", "fr");

    private LocaleSupport() {
    }

    /** Normalise une langue demandée ; renvoie {@link #DEFAULT_LOCALE} si elle n'est pas gérée. */
    public static String normalize(String requested) {
        if (requested == null || requested.isBlank()) {
            return DEFAULT_LOCALE;
        }
        String candidate = requested.trim().toLowerCase(Locale.ROOT);
        int separator = candidate.indexOf('-');
        if (separator > 0) {
            candidate = candidate.substring(0, separator);
        }
        return SUPPORTED.contains(candidate) ? candidate : DEFAULT_LOCALE;
    }

    /**
     * Choisit la traduction à afficher : la langue demandée si elle existe,
     * sinon l'anglais, sinon n'importe quelle traduction disponible.
     * Une leçon incomplètement traduite reste ainsi lisible.
     */
    public static <T> T resolve(Map<String, T> translations, String locale) {
        if (translations == null || translations.isEmpty()) {
            return null;
        }
        for (String candidate : List.of(normalize(locale), DEFAULT_LOCALE)) {
            T value = translations.get(candidate);
            if (value != null) {
                return value;
            }
        }
        return translations.values().iterator().next();
    }
}
