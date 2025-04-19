using Business.Services;
using Business;
using Database.Model;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Authorization;
using Database.ViewModel;

namespace Web.Pages.Admin
{
    [Authorize(Roles = "1,2")]
    public class SlotListModel : PageModel
    {
        public List<SlotListView> List { get; set; } = new();
        public void OnGet()
        {
            Result results = new SlotService().ViewList();
            if (results.Success)
            {
                List = results.Data as List<SlotListView>;
            }
        }
    }
}
