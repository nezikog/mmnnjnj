import { useEffect, useState } from "react";

// type Course = {
//   id: number;
//   name: string;
//   path: string;
//   img?: string;
// };

// type ClassItem = {
//   id: number;
//   number: number;
// };

// export default function App() {
//   const [courses, setCourses] = useState<Course[]>([]);
//   const [classes, setClasses] = useState<ClassItem[]>([]);

//   const [loading, setLoading] = useState(true);

//   useEffect(() => {
//     Promise.all([
//       fetch("http://localhost:5279/courses").then(r => r.json()),
//       fetch("http://localhost:5279/classes").then(r => r.json())
//     ])
//       .then(([coursesData, classesData]) => {
//         setCourses(coursesData);
//         setClasses(classesData);
//       })
//       .catch(err => {
//         console.error("Ошибка загрузки:", err);
//       })
//       .finally(() => setLoading(false));
//   }, []);

//   if (loading) {
//     return <h2>Загрузка...</h2>;
//   }

//   return (
//     <div style={{ padding: 20 }}>
//       <h1>Панель</h1>

//       {/* COURSES */}
//       <section style={{ marginBottom: 40 }}>
//         <h2>Курсы</h2>

//         {courses.length === 0 ? (
//           <p>Нет данных</p>
//         ) : (
//           <ul>
//             {courses.map(course => (
//               <li key={course.id}>
//                 <b>{course.name}</b> — {course.path}
//               </li>
//             ))}
//           </ul>
//         )}
//       </section>

//       {/* CLASSES */}
//       <section>
//         <h2>Классы</h2>

//         {classes.length === 0 ? (
//           <p>Нет данных</p>
//         ) : (
//           <ul>
//             {classes.map(cls => (
//               <li key={cls.id}>
//                 Класс: {cls.number}
//               </li>
//             ))}
//           </ul>
//         )}
//       </section>
//     </div>
//   );
// }