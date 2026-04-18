using Microsoft.AspNetCore.Mvc;
using backend.Data;
using Microsoft.EntityFrameworkCore;
using backend.Models;

namespace backend.Controllers
{
    [Route("api/user")]
    [ApiController]
    public class CourseController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        
        public CourseController(ApplicationDbContext context)
        {
            _context = context;
        }
        
        [HttpGet("get-courses")]
        public async Task<IActionResult> GetCourses()
        {
            try
            {
                var courses = await _context.Courses
                    .Select(c => new { 
                        Id = c.Id,
                        Name = c.Name,
                        Path = c.Path,
                        Img = c.Img
                    })
                    .ToListAsync();
                    
                return Ok(courses);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
                return StatusCode(500, new { error = ex.Message });
            }
        }
        
        [HttpPost("setup")]
        public async Task<IActionResult> SetupUser([FromBody] SetupModel model)
        {
            try
            {
                Console.WriteLine("=== START SETUP ===");
                Console.WriteLine($"UserId: {model?.UserId}");
                Console.WriteLine($"CourseId: {model?.CourseId}");
                Console.WriteLine($"ClassNumber: {model?.ClassNumber}");
                Console.WriteLine($"ActivityTime: {model?.ActivityTime}");
                Console.WriteLine($"Deadline: {model?.Deadline}");
                
                if (model == null)
                {
                    return BadRequest(new { error = "Model is null" });
                }
                
                // 1. Проверяем пользователя
                var user = await _context.Users.FindAsync(model.UserId);
                if (user == null)
                {
                    return NotFound(new { error = $"User {model.UserId} not found" });
                }
                Console.WriteLine($"User found: {user.Name}");
                
                // 2. Находим класс по номеру (исправлено: используем ClassNumber)
                var classEntity = await _context.Classes
                    .FirstOrDefaultAsync(c => c.Number == model.ClassNumber);
                
                if (classEntity == null)
                {
                    return BadRequest(new { error = $"Class {model.ClassNumber} not found" });
                }
                Console.WriteLine($"Class found: {classEntity.Number} (ID: {classEntity.Id})");
                
                // 3. Обновляем класс пользователя
                user.ClassId = classEntity.Id;
                
                // 4. Добавляем связь пользователь-курс
                var userCourse = new UserCourse
                {
                    UserId = model.UserId,
                    CourseId = model.CourseId
                };
                _context.UserCourses.Add(userCourse);
                Console.WriteLine("UserCourse added");
                
                // 5. Добавляем активное время
                var userActivity = new UserActivity
                {
                    UserId = model.UserId,
                    CourseId = model.CourseId,
                    Seconds = model.ActivityTime,
                    LastUpdate = DateTime.UtcNow
                };
                _context.UserActivities.Add(userActivity);
                Console.WriteLine("UserActivity added");
                
                // 6. Добавляем дедлайн (конвертация в UTC)
                DateTime deadlineDate;
                if (!DateTime.TryParse(model.Deadline, out deadlineDate))
                {
                    deadlineDate = DateTime.UtcNow.AddMonths(1);
                }
                
                if (deadlineDate.Kind != DateTimeKind.Utc)
                {
                    deadlineDate = deadlineDate.ToUniversalTime();
                }
                
                var userDeadline = new UserDeadline
                {
                    UserId = model.UserId,
                    CourseId = model.CourseId,
                    DeadlineDate = deadlineDate,
                    Completed = false
                };
                _context.UserDeadlines.Add(userDeadline);
                Console.WriteLine("UserDeadline added");
                
                // Сохраняем все изменения
                await _context.SaveChangesAsync();
                Console.WriteLine("SaveChanges completed!");
                
                return Ok(new { success = true, message = "Setup completed successfully" });
            }
            catch (Exception ex)
            {
                Console.WriteLine($"ERROR: {ex.Message}");
                Console.WriteLine($"STACK: {ex.StackTrace}");
                
                if (ex.InnerException != null)
                {
                    Console.WriteLine($"INNER ERROR: {ex.InnerException.Message}");
                }
                
                return StatusCode(500, new { 
                    error = ex.Message,
                    innerError = ex.InnerException?.Message
                });
            }
        }
    }
    
    public class SetupModel
    {
        public int UserId { get; set; }
        public int CourseId { get; set; }
        public int ActivityTime { get; set; }
        public int ClassNumber { get; set; }
        public string Deadline { get; set; }
    }
}