using System.ComponentModel.DataAnnotations;

namespace Database.Model
{
    public class SlotBook : BaseModel
    {
        [Key]
        public string SlotBookId { get; set; } = Guid.NewGuid().ToString();
        [Required]
        public int SlotId { get; set; }
        [Required]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-ddTHH:mm}")]
        public DateTime BookingTime { get; set; } = DateTime.Now;
        [Required]
        public int BookingDuration { get; set; } = 60;
        [Required]
        public string? RegNo { get; set; }
        public bool IsExitRequested { get; set; }

        public DateTime ProbableExitTime => BookingTime.AddMinutes(BookingDuration);
    }
}
