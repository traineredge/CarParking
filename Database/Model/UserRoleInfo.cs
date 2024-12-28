using System.ComponentModel.DataAnnotations;

namespace Database.Model
{
    public class UserRoleInfo
    {
        [Key]
        public string UserInfoId { get; set; } = Guid.NewGuid().ToString();
        [Required, MaxLength(40)]
        public string? FullName { get; set; }
        [Required]
        public string? Email { get; set; }
        [Required]
        public string? PasswordHash { get; set; }
        public bool IsActive { get; set; }
        public int RoleId { get; set; }
        public string RoleName { get; set; }
        public string CreatedByName { get; set; }
        public string? UpdatedByName { get; set; }
    }
}
