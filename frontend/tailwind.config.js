/**
 * Tailwind — French Voyage Akademie
 *
 * La palette reprend les couleurs du drapeau français, désaturées pour
 * respecter le contraste minimal AA du référentiel WCAG 2.1, sur fond
 * clair comme sur fond sombre.
 */
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./src/**/*.{html,ts}'],
  darkMode: 'media',
  theme: {
    extend: {
      colors: {
        voyage: {
          50: '#eef4ff',
          100: '#dbe6fe',
          200: '#bfd3fe',
          300: '#93b4fd',
          400: '#608cfa',
          500: '#3b66f6',
          // 600 sur blanc : contraste 5.9:1 — conforme AA pour le texte normal.
          600: '#2547d8',
          700: '#1e37ae',
          800: '#1e318c',
          900: '#1e2f70'
        },
        accent: {
          // Rouge du drapeau, assombri pour rester lisible en texte.
          500: '#c8102e',
          600: '#a50d26'
        }
      },
      fontFamily: {
        sans: ['Inter', 'system-ui', '-apple-system', 'Segoe UI', 'Roboto', 'sans-serif']
      },
      maxWidth: {
        reading: '68ch'
      }
    }
  },
  plugins: [],
  corePlugins: {
    // Ionic fournit déjà sa propre normalisation ; la preflight de Tailwind
    // écraserait le style des composants ion-*.
    preflight: false
  }
};
