using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("user_activity")]
    public class UserActivity
    {
        [Key]
        [Column("id")]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]  // 👈 ЭТО ГЛАВНОЕ!
        public int Id { get; set; }
        
        [Column("user_id")]
        public int UserId { get; set; }
        
        [Column("course_id")]
        public int CourseId { get; set; }
        
        [Column("seconds")]
        public int Seconds { get; set; }
        
        [Column("last_update", TypeName = "timestamp with time zone")]
        public DateTime LastUpdate { get; set; }
        
        public virtual User User { get; set; }
        public virtual Course Course { get; set; }
    }
}