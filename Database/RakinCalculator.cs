using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Database
{
    public class RakinCalculator:ICalculator
    {
        public int Add(int a, int b)
        {
            return a + b;
        }

        public int Substruct(int a, int b)
        {
            return a - b;
        }
    }
}
