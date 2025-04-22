using Business;
using Business.FormModel;
using Business.Services;
using Database.Model;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Security.Claims;

namespace Web.Pages.Admin
{
    [Authorize(Roles = "1,2")]
    public class CarCategoryModel : PageModel
    {
        [BindProperty]
        public CarCategory model { get; set; } = new();
        public void OnGet(int? Id = null)
        {
            if (Id != null)
            {
                Result result = new CarCategoryService().Single(Id.Value);
                model = result.Data as CarCategory;
            }
        }
        public IActionResult OnPost()
        {
            model.CreatedBy = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            Result result = null;
            if (model.CarCategoryId == 0)
            {
                result = new CarCategoryService().Add(model);
            }
            else
            {
                result = new CarCategoryService().Update(model);
            }
            if (result.Success)
                return RedirectToPage("/Admin/CarCategoryList");
            else return Page();
        }
    }
}
