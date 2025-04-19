using Business;
using Business.Services;
using Database.Model;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Web.Pages.Account
{
    [Authorize(Roles = "1,2")]
    public class UserListModel : PageModel
    {
        public List<UserInfo> List { get; set; } = new();
        public void OnGet()
        {
            Result results = new UserService().List();
            if (results.Success)
            {
                List = results.Data as List<UserInfo>;
            }
        }
    }
}
