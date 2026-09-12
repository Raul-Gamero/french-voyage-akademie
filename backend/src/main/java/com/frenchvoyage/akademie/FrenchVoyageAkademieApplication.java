package com.frenchvoyage.akademie;

import com.frenchvoyage.akademie.config.AppProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

/**
 * Point d'entrée de l'API de French Voyage Akademie.
 *
 * <p>Plateforme gratuite d'apprentissage du français — projet de service social,
 * Universidad Da Vinci. Code publié sous licence MIT.</p>
 */
@SpringBootApplication
@EnableConfigurationProperties(AppProperties.class)
public class FrenchVoyageAkademieApplication {

    public static void main(String[] args) {
        SpringApplication.run(FrenchVoyageAkademieApplication.class, args);
    }
}
