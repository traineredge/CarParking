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

        public Result SlotAvailable(int ClientCarId, DateTime BookingTime)
        {
            ClientCar clientCar = carParkingContext.ClientCar.Where
                (x => x.ClientCarId == ClientCarId).FirstOrDefault();

            var slots = carParkingContext.Slot.Where(x => x.CarCategoryId == clientCar.CarCategoryId).ToList();
            if (slots.Any(x => !x.IsBooked))
            {
                return new Result(true, "Available!", slots.FirstOrDefault(x => !x.IsBooked));
            }
            return new Result(false, "Not Available", null);
            //List<int> slotIds = slots.Select(x => x.SlotId).ToList();
            //var booked= carParkingContext.SlotBook.Where(x=>slotIds.Contains(x.SlotId) && x.BookingTime.AddMinutes(x.BookingDuration)>=)

            //dynamic mv = null;
            //if (slots.Count(x => x.Slot.IsBooked == false) == 0)
            //{
            //    mv = slots.OrderBy(x => x.SlotBook.ProbableExitTime)?.FirstOrDefault();
            //    if (mv == null) return new Result(false, $"Slot not available", null);
            //    return new Result(false, $"Slot will available after {mv.SlotBook.ProbableExitTime}", null);
            //}
            //else
            //{
            //    return new Result(true, "Success", mv);
            //}
        }
        public Result Book(SlotBook slotBook)
        {
            //?? Payment...
            carParkingContext.SlotBook.Add(slotBook);
            var slot = carParkingContext.Slot.FirstOrDefault(x => x.SlotId == slotBook.SlotId);
            slot.IsBooked = true;
            carParkingContext.Slot.Update(slot);
            return new Result().DBCommit(carParkingContext, "Booked Successfully!", null, slotBook);
        }
    }
}
