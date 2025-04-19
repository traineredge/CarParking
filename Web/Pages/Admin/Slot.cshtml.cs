using Business.Services;
using Business;
using Database.Model;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;

namespace Web.Pages.Admin
{
    [Authorize(Roles ="1,2")]
    public class SlotModel : PageModel
    {
        [BindProperty]
        public Slot model { get; set; } = new();
        public List<CarCategory>carCategories{ get; set; } = new();
        public void OnGet(int? Id = null)
        {
            if (Id != null)
            {
                Result result = new SlotService().Single(Id.Value);
                model = result.Data as Slot;
            }
            carCategories = new CarCategoryService().List().Data as List<CarCategory>;
        }
        public IActionResult OnPost()
        {
            model.CreatedBy = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            Result result = new SlotService().Add(model);
            if (result.Success)
                return RedirectToPage("/Admin/SlotList");
            else return Page();
        }
    }
}
