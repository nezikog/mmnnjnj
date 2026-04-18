using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using backend.Data;
using backend.Models;
using System.Security.Cryptography;
using System.Text;

namespace backend.Controllers
{
    [Route("api/auth")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        
        public AuthController(ApplicationDbContext context)
        {
            _context = context;
        }
        
        private string HashPassword(string password)
        {
            using (var sha256 = SHA256.Create())
            {
                var hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                return Convert.ToBase64String(hashedBytes);
            }
        }
        
        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] RegisterModel model)
        {
            try
            {
                Console.WriteLine($"Register: {model?.Name}, {model?.Email}");
                
                if (model == null)
                    return BadRequest(new { error = "Model is null" });
                
                var existingUser = await _context.Users
                    .FirstOrDefaultAsync(u => u.Email == model.Email);
                    
                if (existingUser != null)
                    return BadRequest(new { error = "Email already exists" });
                
                string hashedPassword = HashPassword(model.Password);
                
                var user = new User
                {
                    Name = model.Name,
                    Email = model.Email,
                    Password = hashedPassword
                };
                
                _context.Users.Add(user);
                await _context.SaveChangesAsync();
                
                return Ok(new 
                { 
                    success = true, 
                    message = "Registration successful",
                    user = new { id = user.Id, name = user.Name, email = user.Email }
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { error = ex.Message });
            }
        }
        
        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginRequest model)
        {
            try
            {
                Console.WriteLine($"Login: {model?.Email}");
                
                if (model == null)
                    return BadRequest(new { error = "Model is null" });
                
                var user = await _context.Users
                    .FirstOrDefaultAsync(u => u.Email == model.Email);
                    
                if (user == null)
                    return Unauthorized(new { error = "User not found" });
                
                string hashedInputPassword = HashPassword(model.Password);
                bool validPassword = user.Password == hashedInputPassword;
                
                if (!validPassword)
                    return Unauthorized(new { error = "Invalid password" });
                
                return Ok(new 
                { 
                    success = true, 
                    message = "Login successful",
                    user = new { id = user.Id, name = user.Name, email = user.Email }
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { error = ex.Message });
            }
        }
    }
    
    public class RegisterModel
    {
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
    }
    
    public class LoginRequest
    {
        public string Email { get; set; }
        public string Password { get; set; }
    }
}