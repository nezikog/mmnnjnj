using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("user_deadline")]
    public class UserDeadline
    {
        [Key]
        [Column("id")]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]  // 👈 ЭТО ГЛАВНОЕ!
        public int Id { get; set; }
        
        [Column("user_id")]
        public int UserId { get; set; }
        
        [Column("course_id")]
        public int CourseId { get; set; }
        
        [Column("deadline_date", TypeName = "timestamp with time zone")]
        public DateTime DeadlineDate { get; set; }
        
        [Column("completed")]
        public bool Completed { get; set; }
        
        public virtual User User { get; set; }
        public virtual Course Course { get; set; }
    }
}