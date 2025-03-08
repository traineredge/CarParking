using Database.Context;
using Database.Model;

namespace Business.Services
{
    public class RoleService
    {
        CarParkingContext carParkingContext = new CarParkingContext();
        public Result Add(Role role)
        {
            if (carParkingContext.Role.Any(x => x.Name == role.Name))
                return new Result(false, "Role already exist!");
            carParkingContext.Role.Add(role);
            return new Result().DBCommit(carParkingContext, "Save Successfully!", null, role);
        }
        public Result Update(Role role)
        {
            if (!carParkingContext.Role.Any(x => x.RoleId == role.RoleId))
                return new Result(false, "Role not exist!");
            carParkingContext.Role.Update(role);
            return new Result().DBCommit(carParkingContext, "Updated Successfully!", null, role);
        }
        public Result List()
        {
            try
            {
                var roles = carParkingContext.Role.ToList();
                return new Result(true, "Success", roles);
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
                var role = carParkingContext.Role.Where(x=> x.RoleId==Id).FirstOrDefault();
                return new Result(true, "Success", role);
            }
            catch (Exception ex)
            {
                return new Result(false, ex.Message);
            }
        }
    }
}
