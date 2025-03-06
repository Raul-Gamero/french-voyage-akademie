import { useEffect, useState } from "react";

interface Course {
  level: string;
  description: string;
}

export default function DashboardPage() {
  const [user, setUser] = useState<{ name: string; courses: Course[] } | null>(null);

  useEffect(() => {
    // Simulación de una API
    setUser({
      name: "Juan Pérez",
      courses: [
        { level: "A1", description: "Curso básico de francés" },
        { level: "B1", description: "Francés intermedio" }
      ]
    });
  }, []);

  return (
    <div className="container mx-auto p-6">
      <h1 className="text-3xl font-bold">Bienvenido, {user?.name}</h1>
      <h2 className="text-xl mt-4">Tus cursos:</h2>
      <ul className="mt-2">
        {user?.courses.map((course, index) => (
          <li key={index} className="p-2 border rounded my-2">
            {course.level} - {course.description}
          </li>
        ))}
      </ul>
    </div>
  );
}
