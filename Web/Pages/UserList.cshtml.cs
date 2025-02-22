using Business;
using Business.Services;
using Database.Model;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Web.Pages
{
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
