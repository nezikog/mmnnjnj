using System;

namespace backend.Models
{
    public class UserTestResult
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int TestId { get; set; }
        public string UserAnswer { get; set; }
        public bool IsCorrect { get; set; }
        public DateTime CompletedAt { get; set; }
    }
}