using Business;
using Business.FormModel;
using Business.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Web.Pages.Account
{
    public class RegistrationModel : PageModel
    {
        [BindProperty]
        public UserForm userForm { get; set; }
        public void OnGet()
        {
        }
        public IActionResult OnPost()
        {
            Result result = new UserService().Registration(userForm);
            if (result.Success)
                return RedirectToPage("/Index");
            else return Page();
        }
    }
}
