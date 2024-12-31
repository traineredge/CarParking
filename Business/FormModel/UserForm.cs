using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.FormModel
{
    public class UserForm
    {
        [Required, MaxLength(40)]
        public string? FullName { get; set; }
        [Required]
        public string? Email { get; set; }
        [Required,MinLength(8)]
        public string? Password { get; set; }
        public bool IsActive { get; set; }
        public int RoleId { get; set; }
    }
}
