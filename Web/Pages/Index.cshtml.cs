using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Web.Pages
{
    [Authorize]
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;

        public List<string> roles { get; set; }
        public IndexModel(ILogger<IndexModel> logger)
        {
           
                _logger = logger;
        }

        public void OnGet()
        {
            roles = new List<string>()
            { "1","2","3" };
        }
    }
}
