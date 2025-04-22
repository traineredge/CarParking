using System.ComponentModel.DataAnnotations;

namespace Database.Model
{
    public class CarCategory : BaseModel
    {
        [Key]
        public int CarCategoryId { get; set; }
        [Required]
        public string? Name { get; set; }
        [Required]
        public double LatestPrice { get; set; }
    }
}
