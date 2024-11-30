using System.ComponentModel.DataAnnotations;

namespace Database.Model
{
    public class Slot : BaseModel
    {
        [Key]
        public int SlotId { get; set; }
        [Required]
        public string? Name { get; set; }
        [Required]
        public int CarCategoryId { get; set; }
        [Required]
        public double LetestPrice { get; set; }
        [Required]
        public bool IsBooked { get; set; }
    }
}
