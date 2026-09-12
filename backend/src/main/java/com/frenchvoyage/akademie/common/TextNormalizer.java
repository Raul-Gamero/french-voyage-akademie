package com.frenchvoyage.akademie.common;

import java.text.Normalizer;
import java.util.Locale;

/**
 * Normalisation des réponses libres avant comparaison.
 *
 * <p>Choix pédagogique assumé : au niveau A1, un apprenant tape souvent
 * « ecole » sans accent, avec une majuscule ou un point final. La faute
 * d'accent n'est pas comptée comme une erreur de compréhension ; elle est
 * signalée dans l'explication renvoyée par l'API.</p>
 */
public final class TextNormalizer {

    private TextNormalizer() {
    }

    public static String normalize(String value) {
        if (value == null) {
            return "";
        }
        String withoutAccents = Normalizer.normalize(value, Normalizer.Form.NFD)
                .replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
        return withoutAccents
                .toLowerCase(Locale.ROOT)
                // Apostrophe typographique et guillemets fran\u00E7ais inclus : l'apprenant
                // les obtient souvent par correction automatique sur t\u00E9l\u00E9phone.
                .replaceAll("[\\p{Punct}\u2019\u00AB\u00BB]", " ")
                .replaceAll("\\s+", " ")
                .trim();
    }

    /** Vrai si les deux textes sont équivalents une fois normalisés. */
    public static boolean matches(String submitted, String expected) {
        return !normalize(expected).isEmpty() && normalize(submitted).equals(normalize(expected));
    }
}
