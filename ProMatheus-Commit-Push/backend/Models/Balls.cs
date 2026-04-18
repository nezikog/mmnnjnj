using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models;

[Table("balls")]
public class Ball
{
    [Key]
    [Column("id")]
    public int Id { get; set; }

    [Column("balls")]
    public int Balls { get; set; }
}