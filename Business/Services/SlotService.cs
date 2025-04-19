using Database.Context;
using Database.Model;

namespace Business.Services
{
    public class SlotService
    {
        CarParkingContext carParkingContext = new CarParkingContext();
        public Result Add(Slot slot)
        {
            if (carParkingContext.Slot.Any(x => x.Name == slot.Name))
                return new Result(false, "Slot already exist!");
            carParkingContext.Slot.Add(slot);
            return new Result().DBCommit(carParkingContext, "Save Successfully!", null, slot);
        }
        public Result Update(Slot slot)
        {
            if (!carParkingContext.Slot.Any(x => x.SlotId == slot.SlotId))
                return new Result(false, "Slot not exist!");
            carParkingContext.Slot.Update(slot);
            return new Result().DBCommit(carParkingContext, "Updated Successfully!", null, slot);
        }
        public Result List()
        {
            try
            {
                var slots = carParkingContext.Slot.ToList();
                return new Result(true, "Success", slots);
            }
            catch (Exception ex)
            {
                return new Result(false, ex.Message);
            }
        }
        public Result ViewList()
        {
            try
            {
                var slots = carParkingContext.SlotListView.ToList();
                return new Result(true, "Success", slots);
            }
            catch (Exception ex)
            {
                return new Result(false, ex.Message);
            }
        }
        public Result Single(int Id)
        {
            try
            {
                var slot = carParkingContext.Slot.Where(x => x.SlotId == Id).FirstOrDefault();
                return new Result(true, "Success", slot);
            }
            catch (Exception ex)
            {
                return new Result(false, ex.Message);
            }
        }
    }
}
