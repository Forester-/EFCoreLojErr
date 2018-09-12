using Microsoft.EntityFrameworkCore;

namespace EFCoreLojErr
{
    class DbContext : Microsoft.EntityFrameworkCore.DbContext
    {
        public DbSet<ParentEntity> ParentEntities => Set<ParentEntity>();
        public DbSet<ExtensionEntity> ExtensionEntities => Set<ExtensionEntity>();

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ChildEntity>();

            base.OnModelCreating(modelBuilder);
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            base.OnConfiguring(optionsBuilder);

            optionsBuilder.UseSqlServer("Server=sql2012;Database=EFCoreLojErr;Integrated Security=SSPI;");
        }
    }
}
