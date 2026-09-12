package com.frenchvoyage.akademie.user;

/** Rôles de la plateforme. Le rôle est stocké tel quel en base. */
public enum Role {

    /** Apprenant : consulte le contenu publié et enregistre sa progression. */
    ROLE_STUDENT,

    /** Administration du contenu académique. */
    ROLE_ADMIN;

    /** Autorité Spring Security correspondante, sans le préfixe redondant. */
    public String authority() {
        return name();
    }
}
