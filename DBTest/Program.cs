using Database.Context;
using Database.Model;
using System.Data;
namespace DBTest
{
    internal class Program
    {
        static void Main(string[] args)
        {
            CarParkingContext db = new CarParkingContext();

            var AllUser = db.UserRoleInfo.ToList();

            
            //Console.WriteLine($"Name:{MyUser.FullName}--Email:{MyUser.Email}");
            //db.UserInfo.Remove(MyUser);
            //db.SaveChanges();
        }
    }

    class DBInsertTest
    {
        public DBInsertTest()
        {
            var db = new CarParkingContext();
            Console.WriteLine(DateTime.Now);

            UserInfo myUser= new UserInfo();
            myUser.FullName = null;
            myUser.Email = "admin@admin.admin";
            myUser.PasswordHash = "Hash";
            myUser.IsActive = true;
            myUser.RoleId = 1;

            db.UserInfo.Add(myUser);
            int row=db.SaveChanges();



            //for (int i = 0; i < 10; i++)
            //{
            //    db.UserInfo.Add(new UserInfo
            //    {
            //        FullName = "Manager-" + i,
            //        Email = "manager" + i + "@manager.manager",
            //        PasswordHash = "Hash" + i,
            //        IsActive = i % 2 == 0,
            //        RoleId = 2
            //    });
            //}
            //for (int i = 0; i < 1000; i++)
            //{
            //    db.UserInfo.Add(new UserInfo
            //    {
            //        FullName = "Client-" + i,
            //        Email = "client" + i + "@client.client",
            //        PasswordHash = "Hash" + i,
            //        IsActive = i % 2 == 0,
            //        RoleId = 3
            //    });
            //}
            //db.SaveChanges();
            Console.WriteLine(DateTime.Now);
        }
    }

    class DBReadTest
    {
        public DBReadTest()
        {
            var db = new CarParkingContext();
            List<Role> roles = db.Role.ToList();
            foreach (Role role in roles) { 
                Console.WriteLine(role.Name);
            }
            Console.WriteLine("---------------------------------");
            List<UserInfo> users = db.UserInfo.ToList();
            List<UserInfo> Admin = users.Where(x => x.RoleId == 1).ToList();
            List<UserInfo> Manager = users.Where(x => x.RoleId == 2).ToList();
            List<UserInfo> Client = users.Where(x => x.RoleId == 3).ToList();
            Admin.ForEach(x =>
            {
                Console.WriteLine(x.FullName);
            });
            Console.WriteLine("---------------------------------");
            Manager.OrderBy(x=> Convert.ToInt32(x.FullName.Split(",").LastOrDefault())).ToList()
            .ForEach(x =>
            {
                Console.WriteLine(x.FullName);
            });
            Console.WriteLine("---------------------------------");
            Client.OrderBy(x=> Convert.ToInt32(x.FullName.Split("-").LastOrDefault())).ToList()
            .ForEach(x =>
            {
                Console.WriteLine(x.FullName);
            });
        }
    }
}
