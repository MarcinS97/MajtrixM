﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using HRRcp.App_Code;
using HRRcp.Controls.Reports;

namespace HRRcp.Controls.Portal
{
    public partial class cntSqlContent : System.Web.UI.UserControl
    {
        public event EventHandler SelectTab;

        public const int moLines    = 1;
        public const int moScreen   = 2;
        public const int moMDLines  = 3;    // master lines - details lines  <<< rozwój :)
        public const int moMDScreen = 4;    // master lines - details lines


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string grupa = Grupa;
                if (!String.IsNullOrEmpty(grupa))
                    LoadTabs();
            }
        }

        public void Prepare(string grupa)
        {
            Grupa = grupa;
            LoadTabs();
        }

        public void LoadTabs()
        {
            const string item = "<div class=\"tabCaption\"><div class=\"tabLeft\"><div class=\"tabRight\">{0}</div></div></div>";

            DataSet ds = db.getDataSet(String.Format("select * from {0}..SqlContent where Grupa = '{1}' and Aktywny = 1 order by Kolejnosc, MenuText", App.dbPORTAL ,Grupa));
            tabContent.Items.Clear();
            foreach (DataRow dr in db.getRows(ds))
                tabContent.Items.Add(new MenuItem(String.Format(item, db.getValue(dr, "MenuText")), db.getValue(dr, "Id")));
            if (tabContent.Items.Count > 0)
            {
                tabContent.Items[0].Selected = true;
                DoSelectTab();
            }
        }

        private void TriggerSelectTab()
        {
            if (SelectTab != null)
                SelectTab(this, EventArgs.Empty);
        }

        //---- parametry do OnSelectTab
        public int Typ = -1;

        private void DoSelectTab()
        {
            string id = tabContent.SelectedValue;
            DataRow dr = db.getDataRow(String.Format("select * from {0}..SqlContent where Id = {1}", App.dbPORTAL, id));
            string constr = db.getValue(dr, "ConStr");
            string sql = db.getValue(dr, "Sql");
            int typ = db.getInt(dr, "Typ", moLines);
            Typ = typ;
            cntMasterLines.Visible = false;
            cntMasterScreen.Visible = false;
            switch (typ)
            {
                default:
                case moLines:
                    cntMasterLines.Visible = true;
                    cntMasterLines.SQL = sql;
                    if (!String.IsNullOrEmpty(constr))
                        cntMasterLines.ConStr = constr;
                    TriggerSelectTab();
                    cntMasterLines.Prepare();
                    break;
                case moScreen:
                    cntMasterScreen.Visible = true;
                    cntMasterScreen.SQL = sql;
                    if (!String.IsNullOrEmpty(constr))
                        cntMasterScreen.ConStr = constr;
                    TriggerSelectTab();
                    cntMasterScreen.Prepare();
                    break;
            }
        }

        protected void tabContent_MenuItemClick(object sender, MenuEventArgs e)
        {
            DoSelectTab();
        }

        public void ReloadCurrent()
        {
            DoSelectTab();
        }
        //------------------------------------------
        public string Grupa
        {
            set { ViewState["grupa"] = value; }
            get { return Tools.GetStr(ViewState["grupa"]); }
        }

        public cntReport cntLine
        {
            get { return cntMasterLines; }
        }

        public cntDetails cntScreen
        {
            get { return cntMasterScreen; }
        }
    }
}