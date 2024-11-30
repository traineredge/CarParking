using System.ComponentModel.DataAnnotations;

namespace Database.Model
{
    public class CarCategory : BaseModel
    {
        [Key]
        public int CarCategoryId { get; set; }
        [Required]
        public string? Name { get; set; }//16 siter bus
    }
}
