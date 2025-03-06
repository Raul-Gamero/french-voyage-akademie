import CourseCard from '@/components/CourseCard';

const courses = [
  { level: "A1", description: "Curso básico de francés para principiantes." },
  { level: "A2", description: "Curso de nivel elemental para continuar aprendiendo." },
  { level: "B1", description: "Francés intermedio para mejorar habilidades comunicativas." },
  { level: "B2", description: "Nivel avanzado para alcanzar fluidez." }
];

export default function CoursesPage() {
  return (
    <div className="container mx-auto p-6">
      <h1 className="text-3xl font-bold text-center">Nuestros Cursos</h1>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 gap-6 mt-6">
        {courses.map((course, index) => (
          <CourseCard key={index} level={course.level} description={course.description} />
        ))}
      </div>
    </div>
  );
}
