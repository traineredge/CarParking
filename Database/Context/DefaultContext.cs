using Database.Model;
using Microsoft.EntityFrameworkCore;

namespace Database.Context
{
    public class DefaultContext : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Server=.;Database=CarParking;Trusted_Connection=True;ConnectRetryCount=0");
        }
        public DbSet<UserInfo> UserInfo { get; set; }
        public DbSet<Role> Role{ get; set; }
    }
}





