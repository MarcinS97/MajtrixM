namespace HRRcp.Areas.ME.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("VCertyfikatyUprawnienie")]
    public partial class VCertyfikatyUprawnienie
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        public int? IdUprawnienia { get; set; }

        public int? IdPracownika { get; set; }

        [StringLength(200)]
        public string Numer { get; set; }

        public DateTime? DataWaznosci { get; set; }

        [StringLength(200)]
        public string Kategoria { get; set; }

        public DateTime? DataZdobyciaUprawnien { get; set; }

        public DateTime? DataWaznosciPsychotestow { get; set; }

        public DateTime? DataWaznosciBadanLekarskich { get; set; }

        public DateTime? DataWaznosciUmowy { get; set; }

        [Key]
        [Column(Order = 1)]
        public bool UmowaLojalnosciowa { get; set; }

        public int? ImportId { get; set; }

        [Key]
        [Column(Order = 2)]
        public bool DataZdobyciaUprawnienOk { get; set; }

        [Key]
        [Column(Order = 3)]
        public bool DataWaznosciPsychotestowOk { get; set; }

        [Key]
        [Column(Order = 4)]
        public bool DataWaznosciBadanLekarskichOk { get; set; }

        [Key]
        [Column(Order = 5)]
        public bool UmowaLojalnosciowaOk { get; set; }

        [Key]
        [Column(Order = 6)]
        public bool DataWaznosciSet { get; set; }

        [Key]
        [Column(Order = 7)]
        public bool Aktualny { get; set; }

        [StringLength(500)]
        public string Uwagi { get; set; }

        public int? UprId { get; set; }

        public int? Typ { get; set; }

        public int? KwalifikacjeId { get; set; }

        public int? PoziomId { get; set; }

        public int? PoziomPoziom { get; set; }

        [StringLength(200)]
        public string Symbol { get; set; }

        [StringLength(200)]
        public string Nazwa { get; set; }

        [StringLength(200)]
        public string NazwaEN { get; set; }

        [StringLength(200)]
        public string Poziom { get; set; }

        [StringLength(200)]
        public string PoziomEN { get; set; }

        [StringLength(200)]
        public string Opis { get; set; }

        [StringLength(200)]
        public string Pola { get; set; }

        public bool? Aktywne { get; set; }

        public int? Kolejnosc { get; set; }
    }
}
