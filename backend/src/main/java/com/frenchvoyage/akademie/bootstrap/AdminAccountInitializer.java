package com.frenchvoyage.akademie.bootstrap;

import com.frenchvoyage.akademie.config.AppProperties;
import com.frenchvoyage.akademie.user.Role;
import com.frenchvoyage.akademie.user.User;
import com.frenchvoyage.akademie.user.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.time.Instant;
import java.util.Locale;

/**
 * Crée le compte d'administration au premier démarrage, si — et seulement si —
 * les variables {@code FVA_ADMIN_EMAIL} et {@code FVA_ADMIN_PASSWORD} sont
 * renseignées.
 *
 * <p>En production ces variables restent vides : l'administrateur est promu
 * une seule fois, manuellement, en base. Aucun identifiant par défaut n'existe
 * donc dans une installation publique.</p>
 */
@Component
public class AdminAccountInitializer implements ApplicationRunner {

    private static final Logger log = LoggerFactory.getLogger(AdminAccountInitializer.class);

    private final AppProperties properties;
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public AdminAccountInitializer(AppProperties properties,
                                   UserRepository userRepository,
                                   PasswordEncoder passwordEncoder) {
        this.properties = properties;
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void run(ApplicationArguments args) {
        AppProperties.Admin admin = properties.admin();
        if (admin == null || isBlank(admin.email()) || isBlank(admin.password())) {
            return;
        }

        String email = admin.email().trim().toLowerCase(Locale.ROOT);
        if (userRepository.existsByEmailIgnoreCase(email)) {
            return;
        }

        User user = new User();
        user.setEmail(email);
        user.setPasswordHash(passwordEncoder.encode(admin.password()));
        user.setDisplayName("Administration");
        user.setRole(Role.ROLE_ADMIN);
        user.setEnabled(true);
        user.setPrivacyConsentVersion(properties.privacyPolicyVersion());
        user.setPrivacyConsentAt(Instant.now());
        userRepository.save(user);

        log.warn("Compte d'administration initialisé. Changez ce mot de passe avant toute mise en ligne.");
    }

    private boolean isBlank(String value) {
        return value == null || value.isBlank();
    }
}
