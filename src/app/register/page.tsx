export default function RegisterPage() {
    return (
      <div className="container mx-auto p-6">
        <h1 className="text-3xl font-bold">Registro</h1>
        <form className="mt-6 space-y-4">
          <input type="text" placeholder="Nombre" className="w-full p-2 border rounded" />
          <input type="text" placeholder="Apellido" className="w-full p-2 border rounded" />
          <input type="email" placeholder="Correo electrónico" className="w-full p-2 border rounded" />
          <input type="password" placeholder="Contraseña" className="w-full p-2 border rounded" />
          <button type="submit" className="bg-blue-600 text-white p-2 rounded w-full">Registrarse</button>
        </form>
        <p className="mt-4">¿Ya tienes cuenta? <a href="/login" className="text-blue-600">Inicia sesión aquí</a></p>
      </div>
    );
  }
  