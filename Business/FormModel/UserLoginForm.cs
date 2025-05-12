using System.ComponentModel.DataAnnotations;

namespace Business.FormModel
{
    public class UserLoginForm
    {
        [Required]
        public string? Email { get; set; }
        [Required]
        public string? Password { get; set; }
    }
}
