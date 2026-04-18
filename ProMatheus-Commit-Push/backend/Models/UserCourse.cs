using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("user_course")]
    public class UserCourse
    {
        [Key]
        [Column("id")]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]  // 👈 ДОБАВЬ
        public int Id { get; set; }
        
        [Column("user_id")]
        public int UserId { get; set; }
        
        [Column("course_id")]
        public int CourseId { get; set; }
        
        [Column("class_id")]
        public int ClassId { get; set; }

        public virtual User User { get; set; }
        public virtual Course Course { get; set; }
        public virtual Class Class { get; set; }
    }
}