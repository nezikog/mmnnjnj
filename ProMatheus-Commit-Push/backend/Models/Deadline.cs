using System;
using backend.Models;

namespace backend.Models
{
    public class Dedline
    {
        public int Id { get; set; }
        public DateTime DeadlineDate { get; set; }
        public int UserId { get; set; }
        public User User { get; set; }
    }
}