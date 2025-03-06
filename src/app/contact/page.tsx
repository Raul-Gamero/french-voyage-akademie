export default function ContactPage() {
    return (
      <div className="container mx-auto p-6">
        <h1 className="text-3xl font-bold">Contáctanos</h1>
        <p className="mt-4">Si tienes alguna pregunta, no dudes en escribirnos.</p>
        <form className="mt-6 space-y-4">
          <input type="text" placeholder="Nombre" className="w-full p-2 border rounded" />
          <input type="email" placeholder="Correo electrónico" className="w-full p-2 border rounded" />
          <textarea placeholder="Mensaje" className="w-full p-2 border rounded"></textarea>
          <button type="submit" className="bg-blue-600 text-white p-2 rounded">Enviar</button>
        </form>
      </div>
    );
  }
  