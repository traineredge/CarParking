using Business.FormModel;
using Database.Context;
using Database.Model;
using Microsoft.AspNetCore.Identity;

namespace Business.Services
{
    public class UserService
    {
        CarParkingContext carParkingContext = new CarParkingContext();
        public Result Registration(UserForm user)
        {
            bool x = carParkingContext.UserInfo.Any(x => x.Email == user.Email);
            if (x) return new Result(false, "Email already registered!");
            UserInfo userInfo = new UserInfo();
            userInfo.FullName = user.FullName;
            userInfo.Email = user.Email;
            userInfo.PasswordHash = new PasswordHasher<UserInfo>().HashPassword(userInfo, user.Password);
            userInfo.RoleId = user.RoleId == 0 ? 3 : user.RoleId;
            userInfo.IsActive = true;
            carParkingContext.UserInfo.Add(userInfo);
            return new Result().DBCommit(carParkingContext, "Registered Successfully!", null, user);
        }

        public Result Login(UserLoginForm user)
        {
            UserInfo? userInfo = carParkingContext.UserInfo.Where(x => x.Email == user.Email).FirstOrDefault();
            if (userInfo == null) return new Result(false, "Register First!");

            PasswordVerificationResult HashResult = new PasswordHasher<UserInfo>().VerifyHashedPassword(userInfo, userInfo.PasswordHash, user.Password);
            if (HashResult != PasswordVerificationResult.Failed)
            {
                return new Result(true, $"{userInfo.FullName} successfully logged in!");
            }
            else
            {
                return new Result(false, "Incorrect Password");
            }
        }

        public Result Update(UserForm user)
        {
            //logics
            return new Result().DBCommit(carParkingContext, "Updated Successfully!", null, user);
        }
        public Result List()
        {
            //logics
            try
            {
                var Users = carParkingContext.UserInfo.ToList();
                return new Result(true, "Success", Users);
            }
            catch (Exception ex)
            {
                return new Result(false,ex.Message);
            }
        }
        public Result Single(string Id)
        {
            //logics
            try
            {
                var User = carParkingContext.UserInfo.Where(x=>x.UserInfoId==Id).FirstOrDefault();
                return new Result(true, "Success", User);
            }
            catch (Exception ex)
            {
                return new Result(false,ex.Message);
            }
        }
    }
}
