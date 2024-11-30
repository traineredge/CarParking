namespace Database.Model
{
    public class Payment : BaseModel
    {
        public string PaymentId { get; set; } = Guid.NewGuid().ToString();
        public string? SlotBookId { get; set; }
        public double Amount { get; set; }
        public int PaymentMethodId { get; set; }
    }
}
