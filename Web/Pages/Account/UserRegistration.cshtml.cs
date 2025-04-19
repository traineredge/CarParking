using Business.FormModel;
using Business.Services;
using Business;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Database.Model;
using Microsoft.AspNetCore.Authorization;

namespace Web.Pages.Account
{
    [Authorize(Roles = "1")]
    public class UserRegistrationModel : PageModel
    {
        string LoggedInuserId = "123";
        [BindProperty]
        public UserForm userForm { get; set; } = new();

        public void OnGet(string? Id = null)
        {
            if (Id != null)
            {
                Result result = new UserService().Single(Id);
                UserInfo user = result.Data as UserInfo;
                userForm.FullName = user.FullName;
                userForm.Email = user.Email;
                userForm.RoleId = user.RoleId;
            }
        }
        public IActionResult OnPost()
        {
            userForm.CreatedBy = LoggedInuserId;
            Result result = new UserService().Registration(userForm);
            if (result.Success)
                return RedirectToPage("/Index");
            else return Page();
        }
    }
}
