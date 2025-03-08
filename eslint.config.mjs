import { FlatCompat } from "@eslint/eslintrc";

const compat = new FlatCompat();

const eslintConfig = [
  ...compat.extends("next/core-web-vitals", "next/typescript"),
  {
    ignores: ["out/", ".next/", "node_modules/"], // ⬅️ ESLint ahora ignorará estas carpetas
  },
];

export default eslintConfig;
