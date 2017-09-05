namespace HRRcp.Areas.ME.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MNarzedzia")]
    public partial class MNarzedzia
    {
        public int Id { get; set; }

        [StringLength(255)]
        public string Nazwa { get; set; }

        [StringLength(255)]
        public string NazwaEN { get; set; }

        public int? IdParent { get; set; }

        [StringLength(500)]
        public string IdParents { get; set; }

        [StringLength(500)]
        public string IdParents2 { get; set; }
    }
}
