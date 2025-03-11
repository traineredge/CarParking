using Database.Context;
using Database.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Services
{
    public class SlotBookService
    {
        CarParkingContext carParkingContext = new CarParkingContext();

        public Result SlotAvailable(string ClientCarId)
        {
            //At first we need to find out the car reg no. and then
            //we need find out the car category based on that reg no.

            ClientCar clientCar = carParkingContext.ClientCar.Where
                (x => x.ClientCarId == ClientCarId).FirstOrDefault();

            List<Slot> AvailableSlots = carParkingContext.Slot.Where
                (x => x.CarCategoryId == clientCar.CarCategoryId 
                && x.IsBooked == false).ToList();
            if(AvailableSlots.Count==0)
            {
                return new Result(false, "Slot not available", null);
            }
            else
            {
                return new Result(true, "Success", AvailableSlots);
            }
            
      
        }
        //public Result Book(SlotBook slotBook)
        //{

            
        //}
    }
}
