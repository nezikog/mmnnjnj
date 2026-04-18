using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("class")]
    public class Class
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("number")]
        public int Number { get; set; }
    }
}