using Database.Context;
using Database.Model;
using Microsoft.EntityFrameworkCore;

namespace Business.Services
{
    public class CarCategoryService
    {
        CarParkingContext carParkingContext = new CarParkingContext();
        public Result Add(CarCategory carCategory)
        {
            if (carParkingContext.CarCategory.Any(x => x.Name == carCategory.Name))
                return new Result(false, "Category already exist!");
            carParkingContext.CarCategory.Add(carCategory);
            return new Result().DBCommit(carParkingContext, "Save Successfully!", null, carCategory);
        }
        public Result Update(CarCategory carCategory)
        {
            if (!carParkingContext.CarCategory.Any(x => x.CarCategoryId == carCategory.CarCategoryId))
                return new Result(false, "Category not exist!");
            carParkingContext.CarCategory.Update(carCategory);
            return new Result().DBCommit(carParkingContext, "Updated Successfully!", null, carCategory);
        }
        public Result List()
        {
            try
            {
                var categories = carParkingContext.CarCategory.ToList();
                return new Result(true, "Success", categories);
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
                var category = carParkingContext.CarCategory.Where(x => x.CarCategoryId == Id).FirstOrDefault();
                return new Result(true, "Success", category);
            }
            catch (Exception ex)
            {
                return new Result(false, ex.Message);
            }
        }
    }
}
