﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PR30
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class Pr_29Entities : DbContext
    {
        public Pr_29Entities()
            : base("name=Pr_29Entities")
        {
        }
        private static Pr_29Entities _context;
        public static Pr_29Entities GetContext()
        {
            if (_context == null)
            {
                _context = new Pr_29Entities();
            }
            return _context;
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Announcement> Announcement { get; set; }
        public virtual DbSet<Categories> Categories { get; set; }
        public virtual DbSet<Sellers> Sellers { get; set; }
    }
}
