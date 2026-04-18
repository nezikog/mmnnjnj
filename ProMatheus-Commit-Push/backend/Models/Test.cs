using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("test")]
    public class Test
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }
        
        [Column("course_id")]
        public int CourseId { get; set; }  // 👈 ИСПРАВЛЕНО: было string, стало int
        
        [Column("questions")]
        public string Questions { get; set; }
        
        [Column("answer")]
        public string Answer { get; set; }
        
        [Column("difficulty")]
        public int Difficulty { get; set; }
        
        [Column("class_id")]
        public int ClassId { get; set; }
        
        [Column("subject")]
        public string Subject { get; set; }
        
        public virtual Course Course { get; set; }
        public virtual Class Class { get; set; }
    }
}