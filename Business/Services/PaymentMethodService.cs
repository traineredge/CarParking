using Database.Context;
using Database.Model;

namespace Business.Services
{
    public class PaymentMethodService
    {
        CarParkingContext carParkingContext = new CarParkingContext();
        public Result Add(PaymentMethod paymentMethod)
        {
            if (carParkingContext.PaymentMethod.Any(x => x.PaymentMethodName == paymentMethod.PaymentMethodName))
                return new Result(false, "Payment Method already exist!");
            carParkingContext.PaymentMethod.Add(paymentMethod);
            return new Result().DBCommit(carParkingContext, "Save Successfully!", null, paymentMethod);
        }
        public Result Update(PaymentMethod paymentMethod)
        {
            if (!carParkingContext.PaymentMethod.Any(x => x.PaymentMethodId== paymentMethod.PaymentMethodId))
                return new Result(false, "Payment Method not exist!");
            carParkingContext.PaymentMethod.Update(paymentMethod);
            return new Result().DBCommit(carParkingContext, "Updated Successfully!", null, paymentMethod);
        }
        public Result List()
        {
            try
            {
                var paymentMethods = carParkingContext.PaymentMethod.ToList();
                return new Result(true, "Success", paymentMethods);
            }
            catch (Exception ex)
            {
                return new Result(false, ex.Message);
            }
        }
        public Result Single(int Id)
        {
            try
            {
                var paymentMethod = carParkingContext.PaymentMethod.Where(x => x.PaymentMethodId == Id).FirstOrDefault();
                return new Result(true, "Success", paymentMethod);
            }
            catch (Exception ex)
            {
                return new Result(false, ex.Message);
            }
        }
    }
}
