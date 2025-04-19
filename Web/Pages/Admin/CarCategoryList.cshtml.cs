using Business.Services;
using Business;
using Database.Model;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Authorization;

namespace Web.Pages.Admin
{
    [Authorize(Roles ="1,2")]
    public class CarCategoryListModel : PageModel
    {
        public List<CarCategory> List { get; set; } = new();
        public void OnGet()
        {
            Result results = new CarCategoryService().List();
            if (results.Success)
            {
                List = results.Data as List<CarCategory>;
            }
        }
    }
}
