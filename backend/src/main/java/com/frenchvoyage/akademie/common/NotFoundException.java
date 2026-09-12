package com.frenchvoyage.akademie.common;

/** Ressource demandée inexistante ou non publiée. */
public class NotFoundException extends RuntimeException {

    public NotFoundException(String message) {
        super(message);
    }

    public static NotFoundException of(String resource, Object identifier) {
        return new NotFoundException("%s introuvable : %s".formatted(resource, identifier));
    }
}
