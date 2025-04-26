using Business.Services;
using Business;
using Database.Model;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Security.Claims;

namespace Web.Pages.Customer
{
    public class CarRegistrationModel : PageModel
    {
        [BindProperty]
        public ClientCar model { get; set; } = new();
        public List<CarCategory> carCategories { get; set; } = new();
        public void OnGet(int? Id = null)
        {
            if (Id != null)
            {
                Result result = new ClientCarService().Single(Id.Value);
                model = result.Data as ClientCar;
            }
            carCategories = new CarCategoryService().List().Data as List<CarCategory>;
        }
        public IActionResult OnPost()
        {
            model.UserInfoId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            Result result = null;
            if (model.CarCategoryId == 0)
            {
                result = new ClientCarService().Add(model);
            }
            else
            {
                result = new ClientCarService().Update(model);
            }
            if (result.Success)
                return RedirectToPage("/Customer/CarList");
            else return Page();
        }
    }
}
