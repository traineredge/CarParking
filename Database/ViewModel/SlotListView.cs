using Database.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Database.ViewModel
{
    public class SlotListView:BaseModel
    {
        [Key]
        public int SlotId { get; set; }
        [Required]
        public string? Name { get; set; }
        [Required]
        public int CarCategoryId { get; set; }
        [Required]
        public double LatestPrice { get; set; }
        [Required]
        public bool IsBooked { get; set; }
        public string CarCategoryName { get; set; }
    }
}
