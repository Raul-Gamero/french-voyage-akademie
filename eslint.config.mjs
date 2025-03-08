import { FlatCompat } from "@eslint/eslintrc";

const compat = new FlatCompat();

export default [
  ...compat.extends("next/core-web-vitals", "next/typescript"),
  {
    ignores: [
      "node_modules/",
      ".next/",
      "out/",
      "public/",
      "dist/",
      "functions/", // Ignora las funciones de Firebase si las usas
    ],
    rules: {
      "@typescript-eslint/no-unused-vars": "off", // Desactiva error de variables no usadas
      "react/react-in-jsx-scope": "off", // Next.js ya importa React automáticamente
      "no-console": "warn", // Muestra advertencia si usas console.log
    },
  },
];
