package com.frenchvoyage.akademie.user.dto;

import com.frenchvoyage.akademie.user.User;

import java.time.Instant;

/** Profil renvoyé au client. Ne contient jamais l'empreinte du mot de passe. */
public record UserProfileResponse(
        Long id,
        String email,
        String displayName,
        String interfaceLocale,
        String role,
        Instant createdAt,
        Instant lastLoginAt
) {
    public static UserProfileResponse from(User user) {
        return new UserProfileResponse(
                user.getId(),
                user.getEmail(),
                user.getDisplayName(),
                user.getInterfaceLocale(),
                user.getRole().name(),
                user.getCreatedAt(),
                user.getLastLoginAt());
    }
}
