﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Database.Model
{
    public class BaseModel
    {
        public DateTime CreatedDate { get; set; } = DateTime.Now;
        public string? CreatedBy { get; set; }
        public DateTime UpdatedDate { get; set; } = DateTime.Now;
        public string? UpdatedBy { get; set; }
    }
}