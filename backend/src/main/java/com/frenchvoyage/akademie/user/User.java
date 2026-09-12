package com.frenchvoyage.akademie.user;

import com.frenchvoyage.akademie.common.LocaleSupport;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;

/**
 * Compte d'un apprenant.
 *
 * <p>Minimisation RGPD : seules l'adresse électronique (identifiant de
 * connexion), un nom d'affichage choisi librement et la langue d'interface
 * sont conservés. Ni nationalité, ni pays, ni date de naissance, ni statut
 * administratif — la plateforme s'adresse notamment à des personnes en
 * situation administrative fragile.</p>
 */
@Entity
@Table(name = "users")
@Getter
@Setter
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, length = 190)
    private String email;

    @Column(name = "password_hash", nullable = false, length = 100)
    private String passwordHash;

    @Column(name = "display_name", nullable = false, length = 80)
    private String displayName;

    @Column(name = "interface_locale", nullable = false, length = 8)
    private String interfaceLocale = LocaleSupport.DEFAULT_LOCALE;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private Role role = Role.ROLE_STUDENT;

    @Column(nullable = false)
    private boolean enabled = true;

    @Column(name = "privacy_consent_version", length = 20)
    private String privacyConsentVersion;

    @Column(name = "privacy_consent_at")
    private Instant privacyConsentAt;

    @Column(name = "last_login_at")
    private Instant lastLoginAt;

    @Column(name = "created_at", nullable = false, updatable = false)
    private Instant createdAt;

    @Column(name = "updated_at", nullable = false)
    private Instant updatedAt;

    @PrePersist
    void onCreate() {
        Instant now = Instant.now();
        this.createdAt = now;
        this.updatedAt = now;
    }

    @PreUpdate
    void onUpdate() {
        this.updatedAt = Instant.now();
    }
}
