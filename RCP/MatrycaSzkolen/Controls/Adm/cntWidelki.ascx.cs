﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HRRcp.App_Code;
using HRRcp.Controls;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Collections.Specialized;
using System.Globalization;

namespace HRRcp.MatrycaSzkolen.Controls.Adm
{
    public partial class cntWidelki : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_Init(object sender, EventArgs e)
        {
            Tools.PrepareDicListView(lvOther, 1337);
            Tools.PrepareSorting2(lvOther, 2, 10);
        }

        public void Prepare(String ScorecardTypeId, String TL)
        {
            this.ScorecardTypeId = ScorecardTypeId;
            this.TL = TL;
            lvOther.DataBind();
        }

        protected void lvOther_LayoutCreated(object sender, EventArgs e)
        {
            HtmlTableCell Th1 = lvOther.FindControl("Th1") as HtmlTableCell;
            //Th1.InnerText = String.Format("Od {0}", String.IsNullOrEmpty(Unit) ? "" : String.Format("({0})", Unit));

            HtmlTableCell Th2 = lvOther.FindControl("Th2") as HtmlTableCell;
            //Th2.InnerText = String.Format("Do {0}", String.IsNullOrEmpty(Unit) ? "" : String.Format("({0})", Unit));

            //HtmlTableCell Header2 = lvOther.FindControl("Th2") as HtmlTableCell;
            //Header2.InnerText = String.IsNullOrEmpty(Parametr2Label) ? "Pracownik" : Parametr2Label;

            //Tools.SetControlVisible(lvOther, "Th2", IsParametr2());

            //HtmlTableCell Th2 = lvOther.FindControl("Th2") as HtmlTableCell;
            //if (Th2 != null) Th2.Visible = IsParametr2();



        }

        protected void lvOther_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            DataRowView drv = null;
            int li = Tools.GetListItemMode(e, lvOther, out drv);
            if (li == Tools.limEdit)
            {
                RequiredFieldValidator tbOdValidator = e.Item.FindControl("tbOdValidator") as RequiredFieldValidator;
                RequiredFieldValidator tbDoValidator = e.Item.FindControl("tbDoValidator") as RequiredFieldValidator;
                RequiredFieldValidator tbWynikValidator = e.Item.FindControl("tbWynikValidator") as RequiredFieldValidator;

                RequiredFieldValidator ddlLinieValidator = e.Item.FindControl("ddlLinieValidator") as RequiredFieldValidator;
                RequiredFieldValidator ddlCustomValidator = e.Item.FindControl("ddlCustomValidator") as RequiredFieldValidator;
                DateEdit deFrom = e.Item.FindControl("deFrom") as DateEdit;
                Button SaveButton = e.Item.FindControl("SaveButton") as Button;

                String ValidationGroup = GetValidationGroup("evg");

                if (tbOdValidator != null) tbOdValidator.ValidationGroup = ValidationGroup;
                if (tbDoValidator != null) tbDoValidator.ValidationGroup = ValidationGroup;
                if (tbWynikValidator != null) tbWynikValidator.ValidationGroup = ValidationGroup;

                if (deFrom != null) deFrom.ValidationGroup = ValidationGroup;
                if (SaveButton != null) SaveButton.ValidationGroup = ValidationGroup;

                if (ddlLinieValidator != null) ddlLinieValidator.ValidationGroup = ValidationGroup;

                //if (Employee && drv != null)
                //    Tools.SelectItem(e.Item, "ddlEmployees", drv["Parametr2"]);

                //if (!String.IsNullOrEmpty(DropDownListQuery))
                //{
                //    PrepareCustomDDL(e.Item);
                //    Tools.SelectItem(e.Item, "ddlCustom", drv["Parametr2Edit"]);
                //}

                //if (IsCustomDDL())
                //    ddlCustomValidator.ValidationGroup = ValidationGroup;
                //else
                //    ddlCustomValidator.ValidationGroup = "hehe";
            }
        }

        protected void lvOther_ItemCreated(object sender, ListViewItemEventArgs e)
        {
            int li = Tools.GetListItemMode(e, lvOther);
            if (li == Tools.limInsert)
            {
                RequiredFieldValidator tbOdValidator = e.Item.FindControl("tbOdValidator") as RequiredFieldValidator;
                RequiredFieldValidator tbDoValidator = e.Item.FindControl("tbDoValidator") as RequiredFieldValidator;
                RequiredFieldValidator tbWynikValidator = e.Item.FindControl("tbWynikValidator") as RequiredFieldValidator;

                RequiredFieldValidator ddlLinieValidator = e.Item.FindControl("ddlLinieValidator") as RequiredFieldValidator;
                RequiredFieldValidator ddlCustomValidator = e.Item.FindControl("ddlCustomValidator") as RequiredFieldValidator;

                DateEdit deFrom = e.Item.FindControl("deFrom") as DateEdit;
                Button InsertButton = e.Item.FindControl("InsertButton") as Button;

                String ValidationGroup = GetValidationGroup("ivg");

                if (tbOdValidator != null) tbOdValidator.ValidationGroup = ValidationGroup;
                if (tbDoValidator != null) tbDoValidator.ValidationGroup = ValidationGroup;
                if (tbWynikValidator != null) tbWynikValidator.ValidationGroup = ValidationGroup;

                if (deFrom != null) deFrom.ValidationGroup = ValidationGroup;
                if (InsertButton != null) InsertButton.ValidationGroup = ValidationGroup;

                if (ddlLinieValidator != null) ddlLinieValidator.ValidationGroup = ValidationGroup;

                //HtmlTableCell Td2 = e.Item.FindControl("Td2") as HtmlTableCell;
                //if (Td2 != null) Td2.Visible = IsParametr2();

                //if (!IsCustomDDL())
                //{
                //    ddlEmployeesValidator.ValidationGroup = ValidationGroup;
                //    ddlCustomValidator.ValidationGroup = "hehe";
                //}
                //else
                //{
                //    ddlEmployeesValidator.ValidationGroup = "hehe";
                //    ddlCustomValidator.ValidationGroup = ValidationGroup;
                //}
                //Tools.SetControlVisible(e.Item, "ddlEmployees", Employee);
                Tools.SetControlVisible(e.Item, "ddlCustom", IsCustomDDL());

                if (!String.IsNullOrEmpty(DropDownListQuery)) PrepareCustomDDL(e.Item);
            }
        }

        protected void lvOther_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            e.Cancel = !UpdateItem(lvOther.EditItem, e.OldValues, e.NewValues, e);
        }

        protected void lvOther_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            e.Cancel = !UpdateItem(e.Item, null, e.Values, e);
        }

        private bool UpdateItem(ListViewItem Item, IOrderedDictionary OldValues, IOrderedDictionary Values, EventArgs e)
        {
            Values["Od"] = Double.Parse(Tools.GetText(Item, "tbOd").Replace(',', '.'), CultureInfo.InvariantCulture) / (Percent == "1" ? 100 : 1);
            Values["Do"] = Double.Parse(Tools.GetText(Item, "tbDo").Replace(',', '.'), CultureInfo.InvariantCulture) / (Percent == "1" ? 100 : 1);
            Values["IdLinii"] = Tools.GetDdlSelectedValue(Item, "ddlLinie");
            

            //if (Employee) Values["Parametr2"] = Tools.GetDdlSelectedValue(Item, "ddlEmployees");
            //else if (IsCustomDDL()) Values["Parametr2"] = Tools.GetDdlSelectedValue(Item, "ddlCustom");
            return true;
        }

        void PrepareCustomDDL(ListViewItem Item)
        {
            DropDownList ddlCustom = Item.FindControl("ddlCustom") as DropDownList;

            ddlCustom.DataSource = db.Select.Table(DropDownListQuery);
            ddlCustom.DataValueField = "Id";
            ddlCustom.DataTextField = "Name";
            ddlCustom.DataBind();
        }

        public String GetUnit()
        {
            return Unit;
        }

        public String Type
        {
            get { return hidType.Value; }
            set { hidType.Value = value; }
        }

        public String ScorecardTypeId
        {
            get { return hidScorecardTypeId.Value; }
            set { hidScorecardTypeId.Value = value; }
        }

        public String Title
        {
            set { lblTitle.Text = value; }
        }

        public String Subtitle
        {
            set { lblSubtitle.Text = value; }
        }

        public String GetValidationGroup(String Mode)
        {
            return Mode + ValidationGroup;
        }

        public String ValidationGroup
        {
            get { return ViewState["vValidGroup"] as String; }
            set { ViewState["vValidGroup"] = value; }
        }

        public String DropDownListQuery
        {
            get { return ViewState["vDropDownListQuery"] as String; }
            set { ViewState["vDropDownListQuery"] = value; }
        }

        public String Parametr2Label
        {
            get { return ViewState["vParametr2Label"] as String; }
            set { ViewState["vParametr2Label"] = value; }
        }

        //public Boolean Employee
        //{
        //    get { return (Boolean)ViewState["vEmployee"]; }
        //    set { ViewState["vEmployee"] = value; }
        //}

        //public Boolean IsParametr2()
        //{
        //    return IsCustomDDL() || IsEmployee();
        //}

        public Boolean IsCustomDDL()
        {
            return !String.IsNullOrEmpty(DropDownListQuery);
        }

        //public Boolean IsEmployee()
        //{
        //    return Employee;
        //}

        public String TL
        {
            get { return hidTL.Value; }
            set { hidTL.Value = value; }
        }

        //public String Parametr2Query
        //{
        //    get { return hidParametr2Query.Value; }
        //    set { hidParametr2Query.Value = value; }
        //}

        public String Percent
        {
            get { return hidPercent.Value; }
            set { hidPercent.Value = value; }
        }

        public String Unit
        {
            get { return hidUnit.Value; }
            set { hidUnit.Value = value; }
        }

        protected void deFilter_DateChanged(object sender, EventArgs e)
        {
            hidDateFilter.Value = deFilter.DateStr;
            //lvOther.DataBind();
        }
    }
}