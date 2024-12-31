using Business.FormModel;
using Database.Context;
using Database.Model;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Services
{

    public class UserService
    {
        public Result Registration(UserForm user)
        {
            CarParkingContext carParkingContext = new CarParkingContext();
            bool x = carParkingContext.UserInfo.Any(x => x.Email == user.Email);
            if (x) return new Result(false, "Email already registered!");
            UserInfo userInfo = new UserInfo();
            userInfo.FullName = user.FullName;
            userInfo.Email = user.Email;
            userInfo.PasswordHash = new PasswordHasher<object>().HashPassword(user, user.Password);
            userInfo.RoleId = user.RoleId == 0 ? 3 : user.RoleId;
            userInfo.IsActive = true;
            carParkingContext.UserInfo.Add(userInfo);
            try
            {
                carParkingContext.SaveChanges();
                return new Result(true, "Registered Successfully!", user);
            }
            catch (Exception ex)
            {
                return new Result(false, ex.Message);
            }
        }
    }
}
