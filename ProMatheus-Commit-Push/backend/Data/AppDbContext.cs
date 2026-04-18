using Microsoft.EntityFrameworkCore;
using backend.Models;

namespace backend.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<User> Users { get; set; }
        public DbSet<Course> Courses { get; set; }
        public DbSet<Test> Tests { get; set; }
        public DbSet<UserTestResult> UserTestResults { get; set; }
        public DbSet<Class> Classes { get; set; }
        public DbSet<CourseClass> CourseClasses { get; set; }
        public DbSet<UserCourse> UserCourses { get; set; }
        public DbSet<UserActivity> UserActivities { get; set; }
        public DbSet<UserDeadline> UserDeadlines { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // User mapping
            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("user");
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Id).HasColumnName("id");
                entity.Property(e => e.Name).HasColumnName("name");
                entity.Property(e => e.Email).HasColumnName("email");
                entity.Property(e => e.Password).HasColumnName("password");
                entity.Property(e => e.ClassId).HasColumnName("class_id");
                
                entity.HasOne(e => e.Class)
                    .WithMany()
                    .HasForeignKey(e => e.ClassId)
                    .OnDelete(DeleteBehavior.SetNull);
            });
            
            // Course mapping
            modelBuilder.Entity<Course>(entity =>
            {
                entity.ToTable("course");
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Id).HasColumnName("id");
                entity.Property(e => e.Name).HasColumnName("name");
                entity.Property(e => e.Path).HasColumnName("path");
                entity.Property(e => e.Img).HasColumnName("img");
            });
            
            // Test mapping
            modelBuilder.Entity<Test>(entity =>
            {
                entity.ToTable("test");
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Id).HasColumnName("id");
                entity.Property(e => e.CourseId).HasColumnName("course_id");
                entity.Property(e => e.Questions).HasColumnName("questions");
                entity.Property(e => e.Answer).HasColumnName("answer");
                entity.Property(e => e.Difficulty).HasColumnName("difficulty");
            });
            
            // UserCourse mapping - ВАЖНО!
            modelBuilder.Entity<UserCourse>(entity =>
            {
                entity.ToTable("user_course");
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Id).HasColumnName("id");
                entity.Property(e => e.UserId).HasColumnName("user_id");
                entity.Property(e => e.CourseId).HasColumnName("course_id");
            });
            
            // UserActivity mapping
            modelBuilder.Entity<UserActivity>(entity =>
            {
                entity.ToTable("user_activity");
                entity.HasKey(e => e.Id);
               entity.Property(e => e.Id).HasColumnName("id");
                entity.Property(e => e.UserId).HasColumnName("user_id");
                entity.Property(e => e.CourseId).HasColumnName("course_id");
                entity.Property(e => e.Seconds).HasColumnName("seconds");
                entity.Property(e => e.LastUpdate).HasColumnName("last_update");
                
                entity.HasOne(e => e.User)
                    .WithMany(u => u.UserActivities)
                    .HasForeignKey(e => e.UserId)
                    .OnDelete(DeleteBehavior.Cascade);
                
                entity.HasOne(e => e.Course)
                    .WithMany()
                    .HasForeignKey(e => e.CourseId)
                    .OnDelete(DeleteBehavior.Cascade);
            });
            
            // UserDeadline mapping
            modelBuilder.Entity<UserDeadline>(entity =>
            {
                entity.ToTable("user_deadline");
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Id).HasColumnName("id");
                entity.Property(e => e.UserId).HasColumnName("user_id");
                entity.Property(e => e.CourseId).HasColumnName("course_id");
                entity.Property(e => e.DeadlineDate).HasColumnName("deadline_date");
                entity.Property(e => e.Completed).HasColumnName("completed");
                
                entity.HasOne(e => e.User)
                    .WithMany(u => u.UserDeadlines)
                    .HasForeignKey(e => e.UserId)
                    .OnDelete(DeleteBehavior.Cascade);
                
                entity.HasOne(e => e.Course)
                    .WithMany()
                    .HasForeignKey(e => e.CourseId)
                    .OnDelete(DeleteBehavior.Cascade);
            });
            
            // Class mapping
            modelBuilder.Entity<Class>(entity =>
            {
                entity.ToTable("class");
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Id).HasColumnName("id");
                entity.Property(e => e.Number).HasColumnName("number");
            });
            
            // CourseClass mapping
            modelBuilder.Entity<CourseClass>(entity =>
            {
                entity.ToTable("course_class");
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Id).HasColumnName("id");
                entity.Property(e => e.ClassId).HasColumnName("class_id");
                entity.Property(e => e.CourseId).HasColumnName("course_id");
            });
        }
    }
}