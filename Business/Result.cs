using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    public class Result
    {
        public bool Success { get; set; }
        public string Message { get; set; } = "Successful";
        public object? Data { get; set; }
        public Result(bool Success, string Message, object? Data = null)
        {
            this.Success = Success;
            this.Message = Message;
            this.Data = Data;
        }
       
    }
}
