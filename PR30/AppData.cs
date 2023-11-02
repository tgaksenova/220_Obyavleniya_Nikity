using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PR30
{
    public class AppData : DbContext
    {
        public static Pr_29Entities db = new Pr_29Entities();
        public DbSet<Sellers> Sellers { get; set; }
        public AppData() : base("Pr_29Entities") { }
    }
}
