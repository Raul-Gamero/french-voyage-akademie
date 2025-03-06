export default function LoginPage() {
    return (
      <div className="container mx-auto p-6">
        <h1 className="text-3xl font-bold">Iniciar Sesión</h1>
        <form className="mt-6 space-y-4">
          <input type="email" placeholder="Correo electrónico" className="w-full p-2 border rounded" />
          <input type="password" placeholder="Contraseña" className="w-full p-2 border rounded" />
          <button type="submit" className="bg-blue-600 text-white p-2 rounded w-full">Ingresar</button>
        </form>
        <p className="mt-4">¿No tienes cuenta? <a href="/register" className="text-blue-600">Regístrate aquí</a></p>
      </div>
    );
  }
  