using Business;
using Business.FormModel;
using Business.Services;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [ApiController]
    [Route("[controller]/[action]")]
    public class UserController : ControllerBase
    {
        public UserController()
        {

        }

        [HttpPost]
        public Result Registration(UserForm userForm)
        {
            Result result = new UserService().Registration(userForm);
            return result;
        }
        [HttpPost]
        public Result Login(UserLoginForm userForm)
        {
            Result result = new UserService().Login(userForm);
            return result;
        }
        [HttpGet]
        public Result List()
        {
            Result result = new UserService().List();
            return result;
        }
        [HttpGet]
        public Result Single(string Id)
        {
            Result result = new UserService().Single(Id);
            return result;
        }
    }
}
