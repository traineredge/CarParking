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
        public List<ClientCar> carList { get; set; } = new();
        [BindProperty]
        public int selectedClientCarId { get; set; }
        string userId;
        public Result SlotCheckResult = new();
        public void OnGet(int? Id = null)
        {
            userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            carList = new ClientCarService().List(userId).Data as List<ClientCar>;
            CheckSlot();
        }
        public IActionResult OnPost()
        {
            model.CreatedBy = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            Result result = null;
            CheckSlot();
            model.RegNo = (new ClientCarService().Single(selectedClientCarId).Data as ClientCar).CarRegistrationNo;
            model.SlotId = (SlotCheckResult.Data as Slot).SlotId;
            result = new SlotBookService().Book(model);
            if (result.Success)
                return RedirectToPage("/Admin/CarCategoryList");
            else return Page();
        }
        public void CheckSlot()
        {
            selectedClientCarId = selectedClientCarId == 0 ? carList.FirstOrDefault().ClientCarId : selectedClientCarId;
            SlotCheckResult = new SlotBookService().SlotAvailable(selectedClientCarId, model.BookingTime);
        }
    }
}
