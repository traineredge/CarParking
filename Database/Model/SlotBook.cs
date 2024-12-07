using System.ComponentModel.DataAnnotations;

namespace Database.Model
{
    public class SlotBook:BaseModel
    {
        [Key]
        public string SlotBookId { get; set; } = Guid.NewGuid().ToString();
        [Required]
        public int SlotId { get; set; }
        [Required]
        public int Duration { get; set; }
        [Required]
        public string? RegNo { get; set; }
        public bool IsExitRequested { get; set; }
    }
}
