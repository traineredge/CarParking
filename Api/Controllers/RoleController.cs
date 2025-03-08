using Business.Services;
using Business;
using Database.Model;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [ApiController]
    [Route("[controller]/[action]")]
    public class RoleController : Controller
    {
        [HttpPost]
        public Result Add(Role role)
        {
            Result result = new RoleService().Add(role);
            return result;
        }
        [HttpPost]
        public Result Update(Role role)
        {
            Result result = new RoleService().Update(role);
            return result;
        }
    }
}
