using Business.Services;
using Business;
using Database.Model;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Security.Claims;

namespace Web.Pages.Customer
{
    public class BookModel : PageModel
    {
        [BindProperty]
        public SlotBook model { get; set; } = new();
        public void OnGet(int? Id = null)
        {
            //if (Id != null)
            //{
            //    Result result = new SlotBookService().Single(Id.Value);
            //    model = result.Data as CarCategory;
            //}
        }
        public IActionResult OnPost()
        {
            model.CreatedBy = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            Result result = null;
            result = new SlotBookService().Book(model);
            if (result.Success)
                return RedirectToPage("/Admin/CarCategoryList");
            else return Page();
        }
    }
}
