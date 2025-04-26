using Database.Context;
using Database.Model;

namespace Business.Services
{
    public class ClientCarService
    {
        CarParkingContext carParkingContext = new CarParkingContext();
        public Result Add(ClientCar clientCar)
        {
            //?? validate sl with BRTA
            carParkingContext.ClientCar.Add(clientCar);
            return new Result().DBCommit(carParkingContext, "Save Successfully!", null, clientCar);
        }
        public Result Update(ClientCar clientCar)
        {
            //?? validate sl with BRTA ++
            carParkingContext.ClientCar.Update(clientCar);
            return new Result().DBCommit(carParkingContext, "Updated Successfully!", null, clientCar);
        }
        public Result List(string UserId)
        {
            try
            {
                var list = carParkingContext.ClientCar.Where(x=>x.UserInfoId==UserId).ToList();
                return new Result(true, "Success", list);
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
                var single = carParkingContext.ClientCar.Where(x => x.ClientCarId == Id).FirstOrDefault();
                return new Result(true, "Success", single);
            }
            catch (Exception ex)
            {
                return new Result(false, ex.Message);
            }
        }
    }
}
