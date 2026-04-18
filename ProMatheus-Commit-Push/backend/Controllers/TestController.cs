using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using backend.Data;
using backend.Models;

namespace backend.Controllers
{
    [Route("api/test")]
    [ApiController]
    public class TestController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public TestController(ApplicationDbContext context)
        {
            _context = context;
        }
        
        // =====================================================
        // ПОЛУЧИТЬ ВСЕ ТЕСТЫ ПО ПРЕДМЕТУ И КЛАССУ
        // GET: api/test/{subjectName}/{classNumber}
        // Пример: api/test/Алгебра/9
        // =====================================================
        [HttpGet("{subjectName}/{classNumber}")]
        public async Task<IActionResult> GetTestsBySubjectAndClass(string subjectName, int classNumber)
        {
            try
            {
                Console.WriteLine($"=== GetTestsBySubjectAndClass ===");
                Console.WriteLine($"SubjectName: {subjectName}");
                Console.WriteLine($"ClassNumber: {classNumber}");
                
                // 1. Находим курс по названию предмета
                var course = await _context.Courses
                    .FirstOrDefaultAsync(c => c.Name == subjectName);
                
                if (course == null)
                {
                    return NotFound(new { error = $"Предмет '{subjectName}' не найден" });
                }
                
                // 2. Находим класс по номеру
                var classEntity = await _context.Classes
                    .FirstOrDefaultAsync(c => c.Number == classNumber);
                
                if (classEntity == null)
                {
                    return NotFound(new { error = $"Класс {classNumber} не найден" });
                }
                
                // 3. Получаем ВСЕ тесты для этого предмета и класса
                var tests = await _context.Tests
                    .Where(t => t.CourseId == course.Id && t.ClassId == classEntity.Id)
                    .Select(t => new
                    {
                        t.Id,
                        t.CourseId,
                        t.Questions,
                        t.Answer,
                        t.Difficulty,
                        t.ClassId,
                        t.Subject
                    })
                    .ToListAsync();
                
                if (tests.Count == 0)
                {
                    return NotFound(new { error = $"Нет тестов для предмета '{subjectName}' и {classNumber} класса" });
                }
                
                // 4. Формируем ответ
                var result = new
                {
                    subject = course.Name,
                    className = classEntity.Number,
                    tests = tests,
                    totalTests = tests.Count
                };
                
                Console.WriteLine($"Найдено тестов: {tests.Count}");
                
                return Ok(result);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
                return StatusCode(500, new { error = ex.Message });
            }
        }
        
        // =====================================================
        // ПОЛУЧИТЬ ВСЕ ТЕСТЫ ТОЛЬКО ПО ПРЕДМЕТУ
        // GET: api/test/subject/{subjectName}
        // =====================================================
        [HttpGet("subject/{subjectName}")]
        public async Task<IActionResult> GetTestsBySubject(string subjectName)
        {
            try
            {
                var course = await _context.Courses
                    .FirstOrDefaultAsync(c => c.Name == subjectName);
                
                if (course == null)
                {
                    return NotFound(new { error = $"Предмет '{subjectName}' не найден" });
                }
                
                var tests = await _context.Tests
                    .Where(t => t.CourseId == course.Id)
                    .Select(t => new
                    {
                        t.Id,
                        t.CourseId,
                        t.Questions,
                        t.Answer,
                        t.Difficulty,
                        t.ClassId,
                        t.Subject
                    })
                    .ToListAsync();
                
                return Ok(new
                {
                    subject = course.Name,
                    tests = tests,
                    totalTests = tests.Count
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { error = ex.Message });
            }
        }
        
        // =====================================================
        // ПОЛУЧИТЬ ВСЕ ТЕСТЫ ТОЛЬКО ПО КЛАССУ
        // GET: api/test/class/{classNumber}
        // =====================================================
        [HttpGet("class/{classNumber}")]
        public async Task<IActionResult> GetTestsByClass(int classNumber)
        {
            try
            {
                var classEntity = await _context.Classes
                    .FirstOrDefaultAsync(c => c.Number == classNumber);
                
                if (classEntity == null)
                {
                    return NotFound(new { error = $"Класс {classNumber} не найден" });
                }
                
                var tests = await _context.Tests
                    .Where(t => t.ClassId == classEntity.Id)
                    .Select(t => new
                    {
                        t.Id,
                        t.CourseId,
                        t.Questions,
                        t.Answer,
                        t.Difficulty,
                        t.ClassId,
                        t.Subject
                    })
                    .ToListAsync();
                
                // Добавляем название предмета к каждому тесту
                var testsWithSubject = new List<object>();
                foreach (var test in tests)
                {
                    var course = await _context.Courses.FindAsync(test.CourseId);
                    testsWithSubject.Add(new
                    {
                        test.Id,
                        test.CourseId,
                        CourseName = course?.Name,
                        test.Questions,
                        test.Answer,
                        test.Difficulty,
                        test.ClassId,
                        test.Subject
                    });
                }
                
                return Ok(new
                {
                    className = classEntity.Number,
                    tests = testsWithSubject,
                    totalTests = tests.Count
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { error = ex.Message });
            }
        }
        
        // =====================================================
        // ПОЛУЧИТЬ ОДИН ТЕСТ ПО ID
        // GET: api/test/{id}
        // =====================================================
        [HttpGet("{id:int}")]
        public async Task<IActionResult> GetTestById(int id)
        {
            try
            {
                var test = await _context.Tests
                    .Where(t => t.Id == id)
                    .Select(t => new
                    {
                        t.Id,
                        t.CourseId,
                        t.Questions,
                        t.Answer,
                        t.Difficulty,
                        t.ClassId,
                        t.Subject
                    })
                    .FirstOrDefaultAsync();
                
                if (test == null)
                {
                    return NotFound(new { error = $"Тест с id {id} не найден" });
                }
                
                return Ok(test);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { error = ex.Message });
            }
        }
    }
}