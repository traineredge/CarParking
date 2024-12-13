using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Database
{
    public class Hi
    {
        public Hi()
        {
           var x= new MashCalc();
            var sum = x.Add(2, 2.5);
            var sum2 = x.Add(2.3, 2.8);
            var subs = x.Substruct(2, 2);
        }
    }
}
