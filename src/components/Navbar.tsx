import Link from 'next/link';

export default function Navbar() {
  return (
    <nav className="bg-blue-600 text-white p-4 flex justify-between">
      <h1 className="text-xl font-bold">French Voyage Akademie</h1>
      <div className="flex space-x-4">
        <Link href="/">Inicio</Link>
        <Link href="/about">Acerca de</Link>
        <Link href="/courses">Cursos</Link>
        <Link href="/contact">Contacto</Link>
        <Link href="/login">Iniciar Sesión</Link>
        <Link href="/register">Registrarse</Link>
      </div>
    </nav>
  );
}
