using Business;
using Business.FormModel;
using Business.Services;

namespace BusinessTest
{
    internal class Program
    {
        static void Main(string[] args)
        {
            UserForm userForm = new UserForm();
            userForm.FullName = Console.ReadLine();
            userForm.Email = Console.ReadLine();
            userForm.Password = Console.ReadLine();
            Result result = new UserService().Registration(userForm);
            Console.WriteLine("Hello, World!");
        }
    }
}
