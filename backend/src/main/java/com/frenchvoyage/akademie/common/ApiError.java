package com.frenchvoyage.akademie.common;

import java.time.Instant;
import java.util.Map;

/**
 * Corps de réponse unique pour toutes les erreurs de l'API.
 *
 * @param timestamp instant de l'erreur
 * @param status    code HTTP
 * @param error     libellé court, stable, exploitable par le client
 * @param message   message lisible par un humain
 * @param path      chemin de la requête
 * @param details   erreurs de validation, champ par champ (facultatif)
 */
public record ApiError(
        Instant timestamp,
        int status,
        String error,
        String message,
        String path,
        Map<String, String> details
) {
    public static ApiError of(int status, String error, String message, String path) {
        return new ApiError(Instant.now(), status, error, message, path, null);
    }
}
