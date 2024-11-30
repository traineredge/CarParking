using System.ComponentModel.DataAnnotations;

namespace Database.Model
{
    public class User: BaseModel
    {
        [Key]
        public string UserId { get; set; } = Guid.NewGuid().ToString();
        [Required]
        public string? Name { get; set; }
        [Required]
        public string? Email { get; set; }
        [Required]
        public string? PasswordHash { get; set; }
        public bool IsActive { get; set; }
    }
}
