using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("user")]
    public class User
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }
        
        [Column("name")]
        public string Name { get; set; }
        
        [Column("email")]
        public string Email { get; set; }
        
        [Column("password")]
        public string Password { get; set; }
        
        [Column("class_id")]
        public int? ClassId { get; set; }
        
        // Навигационные свойства
        public virtual Class Class { get; set; }
        public virtual ICollection<UserActivity> UserActivities { get; set; }
        public virtual ICollection<UserDeadline> UserDeadlines { get; set; }
    }
}