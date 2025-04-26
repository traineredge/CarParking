using Business.Services;
using Business;
using Database.ViewModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Database.Model;
using System.Security.Claims;

namespace Web.Pages.Customer
{
    public class CarListModel : PageModel
    {
        public List<ClientCar> List { get; set; } = new();
        public void OnGet()
        {
            string userId= User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            Result results = new ClientCarService().List(userId);
            if (results.Success)
            {
                List = results.Data as List<ClientCar>;
            }
        }
    }
}
