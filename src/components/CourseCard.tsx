interface CourseCardProps {
    level: string;
    description: string;
  }
  
  export default function CourseCard({ level, description }: CourseCardProps) {
    return (
      <div className="border rounded p-4 shadow-md">
        <h2 className="text-xl font-bold">{level}</h2>
        <p className="text-gray-600">{description}</p>
        <button className="mt-2 bg-blue-600 text-white p-2 rounded">Inscribirse</button>
      </div>
    );
  }
  