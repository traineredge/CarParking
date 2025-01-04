using Database.Context;

namespace Business
{
    public class Result
    {
        public bool Success { get; set; }
        public string Message { get; set; } = "Successful";
        public object? Data { get; set; }
        public Result()
        { }
        public Result(bool Success, string Message, object? Data = null)
        {
            this.Success = Success;
            this.Message = Message;
            this.Data = Data;
        }
        public Result DBCommit(CarParkingContext carParkingContext, string Message, string? FailedMessage = null, object? Data = null)
        {
            try
            {
                carParkingContext.SaveChanges();
                return new Result(true, Message, Data);
            }
            catch (Exception ex)
            {
                return new Result(false, FailedMessage ?? ex.Message);
            }
        }

    }
}
