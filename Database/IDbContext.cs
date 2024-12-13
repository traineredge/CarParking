using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Database
{
    internal interface ICalculator
    {
        public int Add(int a, int b);
        public int Substruct(int a, int b);
    }
    internal interface ICalculator2
    {
        public int Division(int a, int b);
        public int Multiplication(int a, int b);
    }
}
