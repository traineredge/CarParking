using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Database.Model
{
    public class ClientCar
    {
        [Key]
        public int ClientCarId { get; set; }
        public string CarRegistrationNo { get; set; }
        public string CarName { get; set; }
        public string UserInfoId { get; set; }
        public int CarCategoryId { get; set; }
    }
}
