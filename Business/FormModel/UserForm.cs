using Database.Model;
using System.ComponentModel.DataAnnotations;

namespace Business.FormModel
{
    public class UserForm : BaseModel
    {
        [Required, MaxLength(40)]
        public string? FullName { get; set; }
        [Required]
        public string? Email { get; set; }
        [Required, MinLength(8)]
        public string? Password { get; set; }
        public bool IsActive { get; set; }
        public int RoleId { get; set; }
    }
}
