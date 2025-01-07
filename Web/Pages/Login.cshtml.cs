using Business;
using Business.FormModel;
using Business.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Web.Pages
{
    public class LoginModel : PageModel
    {
        [BindProperty]
        public UserLoginForm loginForm {  get; set; }
        public void OnGet()
        {
        }
        public IActionResult OnPost()
        {
            Result result = new UserService().Login(loginForm);
            if (result.Success)
               return RedirectToPage("/Index");
            else return Page();
        }
    }
}
