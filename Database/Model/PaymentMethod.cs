using System.ComponentModel.DataAnnotations;

namespace Database.Model
{
    public class PaymentMethod
    {
        [Key]
        public int PaymentMethodId { get; set; }
        [Required]
        public string PaymentMethodName { get; set; }
        public bool IsActive { get; set; }
    }
}
