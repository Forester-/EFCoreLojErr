using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace EFCoreLojErr
{
    [Table("ChildEntity")]
    class ChildEntity
    {
        [Key]
        public int Id { get; set; }
        public string Value { get; set; }

        public int ParentEntityId { get; set; }
        [ForeignKey(nameof(ParentEntityId))]
        public ParentEntity ParentEntity { get; set; }
    }
    [Table("ParentEntity")]
    class ParentEntity
    {
        [Key]
        public int Id { get; set; }
        public string Value { get; set; }

        [InverseProperty(nameof(ChildEntity.ParentEntity))]
        public List<ChildEntity> ChildEntities { get; set; }
    }
    [Table("ExtensionEntity")]
    class ExtensionEntity
    {
        [Key]
        public int ChildEntityId { get; set; }
        [ForeignKey(nameof(ChildEntityId))]
        public ChildEntity ChildEntity { get; set; }
        public string Value { get; set; }
    }
}
