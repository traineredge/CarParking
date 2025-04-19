using Business;
using Business.FormModel;
using Business.Services;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Security.Claims;
using Database.Model;

namespace Web.Pages.Account
{
    public class LoginModel : PageModel
    {
        [BindProperty]
        public UserLoginForm loginForm { get; set; }
        public void OnGet()
        {
        }
        public async Task<IActionResult> OnPostAsync()
        {
            Result result = new UserService().Login(loginForm);
            if (result.Success)
            {
                UserInfo user = result.Data as UserInfo;
                var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.NameIdentifier, user.UserInfoId),
                    new Claim(ClaimTypes.Name,user.FullName),
                    new Claim(ClaimTypes.Role,user.RoleId.ToString())
                };

                var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                var principal = new ClaimsPrincipal(identity);
                await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal);

                return RedirectToPage("/Index");
            }
            else return Page();
        }

        public async Task<IActionResult> OnGetLogoutAsync()
        {
            await HttpContext.SignOutAsync();
            return RedirectToPage("/Index");
        }
    }
}
