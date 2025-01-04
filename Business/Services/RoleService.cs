using Business.FormModel;
using Database.Context;
using Database.Model;

namespace Business.Services
{
    public class RoleService
    {
        CarParkingContext carParkingContext = new CarParkingContext();
        public Result Add(Role user)
        {
            //logics
            return new Result().DBCommit(carParkingContext, "Save Successfully!", null, user);
        }
        public Result Update(Role user)
        {
            //logics
            return new Result().DBCommit(carParkingContext, "Updated Successfully!", null, user);
        }
        public Result List()
        {
            //logics
            return new Result().DBCommit(carParkingContext, "Updated Successfully!", null);
        }
    }
}
