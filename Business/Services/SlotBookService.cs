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

        public Result SlotAvailable(int ClientCarId)
        {
            ClientCar clientCar = carParkingContext.ClientCar.Where
                (x => x.ClientCarId == ClientCarId).FirstOrDefault();

            var slots = carParkingContext.Slot
                .Join(carParkingContext.SlotBook,
                  slot => slot.SlotId,          // Key from the Slot collection
                  slotBook => slotBook.SlotId,  // Key from the SlotBook collection
                  (slot, slotBook) => new   // Select data to return
                  {
                      Slot = slot,
                      SlotBook = slotBook
                  }).Where(x => x.Slot.CarCategoryId == clientCar.CarCategoryId).ToList();

            dynamic mv=null;
            if (slots.Count(x=>x.Slot.IsBooked==false)==0)
            {
                mv= slots.OrderBy(x=>x.SlotBook.ProbableExitTime).FirstOrDefault();
                return new Result(false, $"Slot will available after {mv.SlotBook.ProbableExitTime}", null);
            }
            else
            {
                return new Result(true, "Success", mv);
            }
        }
        public Result Book(SlotBook slotBook)
        {
            //?? Payment...
            carParkingContext.SlotBook.Add(slotBook);
            return new Result().DBCommit(carParkingContext, "Booked Successfully!", null, slotBook);
        }
    }
}
