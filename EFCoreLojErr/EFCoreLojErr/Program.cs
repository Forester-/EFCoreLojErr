using System;
using System.Linq;
using Microsoft.EntityFrameworkCore;

namespace EFCoreLojErr
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("--- Started ---");

            try
            {
                using (var db = new DbContext())
                {
                    var qry =
                        from parent in db.ParentEntities.Include(parentRef => parentRef.ChildEntities)
                        let qryChildIds = from child in parent.ChildEntities select child.Id
                        let qryExtensions = from extension in db.ExtensionEntities
                                            where qryChildIds.Contains(extension.ChildEntityId)
                                            select extension
                        from extensions in qryExtensions.DefaultIfEmpty()
                        select new { Parent = parent, Extensions = extensions }
                    ;

                    qry.ToArray();
                }
            }
            catch(Exception ex)
            {
                Console.Error.WriteLine("!!! ERROR !!!");
                Console.Error.WriteLine($"{ex.GetType().FullName}: {ex.Message}");
            }

            Console.WriteLine("--- Finished ---");
        }
    }
}
