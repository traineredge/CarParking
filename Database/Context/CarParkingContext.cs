using Database.Model;
using Microsoft.EntityFrameworkCore;

namespace Database.Context
{
    public class CarParkingContext : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            //optionsBuilder.UseSqlServer(@"Server=DESKTOP-POOH2AD\SQLEXPRESS;Database=CarParking;Trusted_Connection=True;TrustServerCertificate=True;ConnectRetryCount=0");
            optionsBuilder.UseSqlServer(@"Server=.;Database=CarParking;Trusted_Connection=True;TrustServerCertificate=True;ConnectRetryCount=0");
        }
        public DbSet<UserInfo> UserInfo { get; set; }
        public DbSet<Role> Role{ get; set; }
        public DbSet<CarCategory> CarCategory { get; set; }
        public DbSet<Slot> Slot { get; set; }
        public DbSet<SlotBook> SlotBook { get; set; }
        public DbSet<PaymentMethod> PaymentMethod { get; set; }
        public DbSet<Payment> Payment { get; set; }


        public DbSet<UserRoleInfo> UserRoleInfo { get; set; }
    }
}





