package com.frenchvoyage.akademie.common;

/** Règle métier violée : adresse déjà enregistrée, doublon, etc. */
public class ConflictException extends RuntimeException {

    public ConflictException(String message) {
        super(message);
    }
}
