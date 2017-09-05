﻿using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using HRRcp.App_Code;


//UWAGA - do testów zmienić kontrolkę na TimeEdit2 i typy w kodzie


namespace HRRcp.Controls
{
    public partial class MPK4 : System.Web.UI.UserControl
    {
        const string wgPrzEnabledFrom = "2016-02-01";

        public static bool wgPrzEnabled(DateTime dt)
        {
            return dt >= DateTime.Parse(wgPrzEnabledFrom);  // musza byc poprawne
        }

        public static bool wgPrzEnabled(string dt)
        {
            try
            {
                return wgPrzEnabled(DateTime.Parse(dt));
            }
            catch
            {
                return false;
            }
        }
        //-----
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (App.User.HasRight(AppUser.rTester))
                //    btWgPrzypisania.Visible = true;
            }
        }

        public bool Prepare(string planId, string pracId, string data, int? czasZmPP, int? nadgDPP, int? nadgNPP, int? nocnePP, bool noedit, DataSet ds)
        {
            _PlanId = planId;
            PracId = pracId;
            Data = data;
            wgPrzVisible = wgPrzEnabled(data);
            CzasZmPP = czasZmPP == -1 ? 0 : czasZmPP;
            NadgDPP = nadgDPP;
            NadgNPP = nadgNPP;
            NocnePP = nocnePP;
            ReadOnly = noedit;
            lvMPK.InsertItemPosition = noedit ? InsertItemPosition.None : InsertItemPosition.LastItem;

            CzasZm = CzasZmPP;
            NadgD = NadgDPP;
            NadgN = NadgNPP;
            Nocne = NocnePP;

            DateTime? dod = null;
            DateTime? ddo = null;

            DateTime? pod = null;
            DateTime? pdo = null;

            DateTime? nod = null;
            DateTime? ndo = null;

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                try
                {
                    DateTime Od = (DateTime)dr[2];
                    DateTime Do = (DateTime)dr[3];

                    if (!dod.HasValue || Od < dod) dod = Od;
                    if (!ddo.HasValue || Do > ddo) ddo = Do;

                    if ((int)dr[0] == 0)
                    {
                        pod = Od;
                        pdo = Do;
                    }

                    if ((int)dr[0] == 2)
                    {
                        nod = Od;
                        ndo = Do;
                    }
                }
                catch { }
            }

            /*cntReport2.SQL = cntReport2.SQL.Replace("@_pid", pracId.ToString()).Replace("@_dod", db.ToSqlValue(dod)).Replace("@_ddo", db.ToSqlValue(ddo)).Replace("@_pod", db.ToSqlValue(pod)).Replace("@_pdo", db.ToSqlValue(pdo)).Replace("@_nod", db.ToSqlValue(nod)).Replace("@_ndo", db.ToSqlValue(ndo));*/
            /*cntReport2.DataBind();*/

            cntReport2.SQL1 = hidSQL1.Value = pracId.ToString();
            /*cntReport2.SQL2 = (db.ToSqlValue(dod) + "|" + db.ToSqlValue(ddo) + "|" + db.ToSqlValue(pod) + "|" + db.ToSqlValue(pdo) + "|" + db.ToSqlValue(nod) + "|" + db.ToSqlValue(ndo)).Replace("'", "");*/

            cntReport2.SQL2 = hidSQL2.Value =
                ((dod.HasValue) ? Tools.DateTimeToStr(dod) : "NULL") + "|" +
                ((dod.HasValue) ? Tools.DateTimeToStr(ddo) : "NULL") + "|" +
                ((dod.HasValue) ? Tools.DateTimeToStr(pod) : "NULL") + "|" +
                ((dod.HasValue) ? Tools.DateTimeToStr(pdo) : "NULL") + "|" +
                ((dod.HasValue) ? Tools.DateTimeToStr(nod) : "NULL") + "|" +
                ((dod.HasValue) ? Tools.DateTimeToStr(ndo) : "NULL");

            cntReport2.Prepare();

            /*dsFill.SelectCommand = dsFill.SelectCommand.Replace("@SQL1", pracId.ToString()).Replace("@SQL2", cntReport2.SQL2);*/

            lvMPK.DataBind();
            return lvMPK.Items.Count > 0;
        }

        public bool Prepare(string planId, string pracId, string data, int? czasZmPP, int? nadgDPP, int? nadgNPP, int? nocnePP, bool noedit)
        {
            _PlanId = planId;
            PracId = pracId;
            Data = data;
            //wgPrzVisible = (DateTime)Tools.StrToDateTime(data) >= (DateTime)Tools.StrToDateTime(wgPrzEnabledFrom);
            wgPrzVisible = wgPrzEnabled(data);  
            CzasZmPP = czasZmPP == -1 ? 0 : czasZmPP;
            NadgDPP = nadgDPP;
            NadgNPP = nadgNPP;
            NocnePP = nocnePP;
            ReadOnly = noedit;
            lvMPK.InsertItemPosition = noedit ? InsertItemPosition.None : InsertItemPosition.LastItem;

            CzasZm = CzasZmPP;
            NadgD = NadgDPP;
            NadgN = NadgNPP;
            Nocne = NocnePP;
            
            lvMPK.DataBind();
            return lvMPK.Items.Count > 0;
        }

        public void Prepare(int? czasZm, int? nadgD, int? nadgN, int? nocne)
        {
            bool b = CzasZm != czasZm || NadgD != nadgD || NadgN != nadgN || Nocne != nocne;
            CzasZm = czasZm;
            NadgD = nadgD;
            NadgN = nadgN;
            Nocne = nocne;
            ShowCzasPracy();
            if (b) lvMPK.DataBind();
        }

        public void PrepareReadOnly()
        {
            CzasZm = CzasZmPP;
            NadgD = NadgDPP;
            NadgN = NadgNPP;
            Nocne = NocnePP;
            ShowCzasPracy();
        }

        public void Update()
        {
            lvMPK.DataBind();
        }

        /*
        public void Prepare(string czasZm, string nadgD, string nadgN, string nocne)
        {
            SetCzasPracy(czasZm, nadgD, nadgN, nocne);
        }
        */
        //-------------------------------------
        public void InitItem(ListView lv, ListViewItemEventArgs e, bool create)
        {
            bool select, edit, insert;
            int lim = Tools.GetListItemMode(e, lv, out select, out edit, out insert);
            if (create)  // item create
            {
                switch (lim)
                {
                    case Tools.limSelect:
                        if (ReadOnly)
                        {
                            Tools.SetControlVisible(e.Item, "tdControl", false);
                            HtmlTableCell td = (HtmlTableCell)e.Item.FindControl("tdLastCol");
                            Tools.AddClass(td, "lastcol");
                        }
                        else
                        {
                            Tools.MakeConfirmDeleteRecordButton(e.Item, "DeleteButton");
                            Tools.SetButton(e.Item, "EditButton", "Edytuj");
                            Tools.SetButton(e.Item, "DeleteButton", "Usuń");
                            //SetControlVisible(e.Item, "DeleteButton", false);
                            //Tools.MakeConfirmDeleteRecordButton(e.Item, "DeleteButton");
                        }
                        break;
                    case Tools.limEdit:
                        Button bt = Tools.SetButton(e.Item, "UpdateButton", "Zapisz");
                        if (bt != null)
                            bt.ValidationGroup = "vge";
                        Tools.SetButton(e.Item, "CancelButton", "Anuluj");
                        Tools.SetButton(e.Item, "DeleteButton", "Usuń");
                        Tools.MakeConfirmDeleteRecordButton(e.Item, "DeleteButton");
                        break;
                    case Tools.limInsert:
                        bt = Tools.SetButton(e.Item, "InsertButton", "Dodaj");
                        if (bt != null)
                            bt.ValidationGroup = "vgi";
                        Tools.SetButton(e.Item, "CancelButton", "Czyść");
                        Tools.SetControlVisible(e.Item, "CancelButton", false);
                        break;
                }
            }
            else
            {
                switch (lim)
                {
                    case Tools.limEdit:
                        ListViewDataItem dataItem = (ListViewDataItem)e.Item;
                        DataRowView drv = (DataRowView)dataItem.DataItem;
                        Tools.SelectItem(e.Item, "ddlMPK", drv["IdMPK"]);
                        break;
                }
            }
        }

        protected void lvMPK_LayoutCreated(object sender, EventArgs e)
        {
        }

        protected void lvMPK_ItemCreated(object sender, ListViewItemEventArgs e)
        {
            InitItem(lvMPK, e, true);
        }

        protected void lvMPK_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            InitItem(lvMPK, e, false);
            //-----------------
            DataRowView drv = Tools.GetDataRowView(e);
            int idcc = (int)drv["IdMPK"];

            sumZm    += db.getInt(drv["CzasZm"], 0);
            sumNadgD += db.getInt(drv["NadgodzinyDzien"], 0);
            sumNadgN += db.getInt(drv["NadgodzinyNoc"], 0);
            sumNoc   += db.getInt(drv["Nocne"], 0);
        }

        int sumZm = 0;
        int sumNadgD = 0;
        int sumNadgN = 0;
        int sumNoc = 0;

        protected void lvMPK_DataBinding(object sender, EventArgs e)
        {
            sumZm = 0;
            sumNadgD = 0;
            sumNadgN = 0;
            sumNoc = 0;
        }

        private void SolveWgPodzialu(out int zm, out int nd, out int nn, out int noc)
        {
            int zm1 = db.getInt(CzasZm, 0);
            int nd1 = db.getInt(NadgD, 0);
            int nn1 = db.getInt(NadgN, 0);
            int noc1 = db.getInt(Nocne, 0);
            int nlimit = noc1 > sumNoc ? noc1 - sumNoc : 0;

            zm = zm1 > sumZm ? zm1 - sumZm : 0;
            nd = nd1 > sumNadgD ? nd1 - sumNadgD : 0;
            nn = nn1 > sumNadgN ? nn1 - sumNadgN : 0;
            noc = nn > nlimit ? nlimit : nn;
        }

        protected void lvMPK_DataBound(object sender, EventArgs e)
        {
            bool ro = ReadOnly;
            Tools.SetControlVisible(lvMPK, "thControl", !ro);
            Tools.SetControlVisible(lvMPK, "thControl1", !ro);
            HtmlTableCell th = (HtmlTableCell)lvMPK.FindControl("thLastCol");
            HtmlTableCell th1 = (HtmlTableCell)lvMPK.FindControl("thLastCol1");
            if (th != null && th1 != null)
                if (ro)
                {
                    Tools.AddClass(th, "lastcol");
                    Tools.AddClass(th1, "lastcol");
                }
                else
                {
                    Tools.RemoveClass(th, "lastcol");
                    Tools.RemoveClass(th1, "lastcol");
                }
            Tools.SetText(lvMPK, "lbNocneOdDo", App.GetNocneOdDo);
            //-----------------
            bool zero = false;
            if (wgPrzVisible)
            {
                int zm, nd, nn, noc;
                SolveWgPodzialu(out zm, out nd, out nn, out noc);
                zero = nd == 0 && nn == 0 && noc == 0;
                Control item = ro ? lvMPK : (Control)lvMPK.InsertItem;
                //Tools.SetText(item, "lbCzasZmPrz", zm == 0 ? null : Worktime.SecToTime(zm, 1));
                Tools.SetText(item, "lbCzasZmPrz", null);
                //Tools.SetText(item, "lbNadgDPrz", nd == 0 ? null : Worktime.SecToTime(nd, 1));
                //Tools.SetText(item, "lbNadgNPrz", nn == 0 ? null : Worktime.SecToTime(nn, 1));
                //Tools.SetText(item, "lbNocnePrz", noc == 0 ? null : Worktime.SecToTime(noc, 1));
                Tools.SetText(item, "lbNadgDPrz", Worktime.SecToTime(nd, 1));
                Tools.SetText(item, "lbNadgNPrz", Worktime.SecToTime(nn, 1));
                Tools.SetText(item, "lbNocnePrz", Worktime.SecToTime(noc, 1));
            }
            Tools.SetControlVisible(lvMPK, "trSum", ro && wgPrzVisible && !zero);
            if (!ro) Tools.SetControlVisible(lvMPK.InsertItem, "trSumI", wgPrzVisible && !zero);
        }
        //-----------------------
        private bool UpdateItem(EventArgs ea, ListViewItem item, IOrderedDictionary oldValues, IOrderedDictionary values)
        {
            values["IdMPK"] = Tools.GetDdlSelectedValueInt(item, "ddlMPK");
            return true;
        }

        protected void lvMPK_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            e.Cancel = !UpdateItem(e, e.Item, null, e.Values);
        }

        protected void lvMPK_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            e.Cancel = !UpdateItem(e, lvMPK.EditItem, e.OldValues, e.NewValues);
        }

        protected void lvMPK_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            //lvMPK.InsertItemPosition = InsertItemPosition.None;
        }

        protected void lvMPK_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
        {
            //lvMPK.InsertItemPosition = InsertItemPosition.LastItem;
        }

        protected void lvMPK_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            //lvMPK.InsertItemPosition = InsertItemPosition.LastItem;
        }
        //-------------
        private void ShowCzasPracy()
        {
            Ustawienia settings = Ustawienia.CreateOrGetSession();
            Tools.SetText(lvMPK, "lbCzasZm", CzasZm == null ? null : Worktime.SecToTime((int)CzasZm, /*settings.Zaokr*/0));
            Tools.SetText(lvMPK, "lbNadgD", NadgD == null ? null : Worktime.SecToTime((int)NadgD,    /*settings.Zaokr*/0)); 
            Tools.SetText(lvMPK, "lbNadgN", NadgN == null ? null : Worktime.SecToTime((int)NadgN,    /*settings.Zaokr*/0));
            Tools.SetText(lvMPK, "lbNocne", Nocne == null ? null : Worktime.SecToTime((int)Nocne,    /*settings.Zaokr*/0));
            hidCzasZm3.Value = CzasZm == null ? null : ((int)CzasZm).ToString();
            hidNadgD3.Value = NadgD == null ? null : ((int)NadgD).ToString();
            hidNadgN3.Value = NadgN == null ? null : ((int)NadgN).ToString();
            hidNocne3.Value = Nocne == null ? null : ((int)Nocne).ToString();
        }

        /*
        private void SetCzasPracy(string czasZm, string nadgD, string nadgN, string nocne)
        {
            Tools.SetText(lvMPK, "lbCzasZm", String.IsNullOrEmpty(czasZm) ? hidCzasZm.Value : czasZm);
            Tools.SetText(lvMPK, "lbNadgD", String.IsNullOrEmpty(nadgD) ? hidNadgD.Value : nadgD);
            Tools.SetText(lvMPK, "lbNadgN", String.IsNullOrEmpty(nadgN) ? hidNadgN.Value : nadgN);
            Tools.SetText(lvMPK, "lbNocne", String.IsNullOrEmpty(nocne) ? hidNocne.Value : nocne);
        }

        private void InitCzasPracy(int? czasZm, int? nadgD, int? nadgN, int? nocne)
        {
            Ustawienia settings = Ustawienia.CreateOrGetSession();
            //wartości startowe
            hidCzasZm.Value = czasZm == null ? null : Worktime.SecToTime((int)czasZm, settings.Zaokr);
            hidNadgD.Value = nadgD == null ? null : Worktime.SecToTime((int)nadgD, settings.Zaokr);
            hidNadgN.Value = nadgN == null ? null : Worktime.SecToTime((int)nadgN, settings.Zaokr);
            hidNocne.Value = nocne == null ? null : Worktime.SecToTime((int)nocne, settings.Zaokr);
            SetCzasPracy(null, null, null, null);
        }
        */
        //---------------------
        /*
        public bool IsValid(string excludeId, IOrderedDictionary values)
        {
            if (String.IsNullOrEmpty(PlanId)) return false;
            {
                string excl = String.IsNullOrEmpty(excludeId) ? "" : " and Id <> " + excludeId;
                DataRow dr = db.getDataRow(String.Format(
                    //      0                     1                                 2                               3 
                    "select sum(CzasZm) as SumZm, sum(NadgodzinyDzien) as SumNadgD, sum(NadgodzinyNoc) as SumNadgN, sum(Nocne) as Nocne " +
                    "from PodzialKosztow where IdPlanPracy = {0}{1}",
                    PlanId, excl));
                int zm = db.getInt(dr, 0, 0) + (values == null ? 0 : db.ISNULL(values["CzasZm"], 0));
                int nd = db.getInt(dr, 1, 0) + (values == null ? 0 : db.ISNULL(values["NadgodzinyDzien"], 0));
                int nn = db.getInt(dr, 2, 0) + (values == null ? 0 : db.ISNULL(values["NadgodzinyNoc"], 0));
                int noc = db.getInt(dr, 3, 0) + (values == null ? 0 : db.ISNULL(values["Nocne"], 0));
                bool c1 = zm <= CzasZm;
                bool c2 = nd <= NadgD;
                bool c3 = nn <= NadgN;
                bool c4 = noc <= Nocne;
                bool c5 = nn <= noc;

                if (c1 && c2 && c3 && c4 && c5) return true;
                else
                {
                    string pp = null;
                    if (!c1) pp += "\\n- czas na zmianie";
                    if (!c2) pp += "\\n- nadgodziny w dzień";
                    if (!c3) pp += "\\n- nadgodziny w nocy";
                    if (!c4) pp += "\\n- czas pracy w nocy";
                    if (!c5) pp += "\\n- nadgodziny w nocy większe od czasu pracy w nocy";
                    Tools.ShowMessage("Przekroczony czas pracy:{0}", pp);
                    return false;
                }
            }
        }
        */

        public static int IsValid(string pracId, string data, string excludeId,     // exclude - którą pozycje pominąć przy sumowaniu, null jak wszystkie wziąć
                                  int kCzasZm, int kNadgD, int kNadgN, int kNocne,  // wartości rcp lub skorygowane przez kierownik
                                  int? czasZm, int? nadgD, int? nadgN, int? nocne)  // wartość wprowadzane
        {
            string excl = String.IsNullOrEmpty(excludeId) ? "" : " and Id <> " + excludeId;
            DataRow dr = db.getDataRow(String.Format(
                //      0                     1                                 2                               3 
                "select sum(CzasZm) as SumZm, sum(NadgodzinyDzien) as SumNadgD, sum(NadgodzinyNoc) as SumNadgN, sum(Nocne) as Nocne " +
                "from PodzialKosztow where IdPracownika={0} and Data='{1}'{2}",
                pracId, data, excl));
            int zm = db.getInt(dr, 0, 0) + (czasZm == null ? 0 : (int)czasZm);
            int nd = db.getInt(dr, 1, 0) + (nadgD == null ? 0 : (int)nadgD);
            int nn = db.getInt(dr, 2, 0) + (nadgN == null ? 0 : (int)nadgN);
            int noc = db.getInt(dr, 3, 0) + (nocne == null ? 0 : (int)nocne); 
            bool c1 = zm <= kCzasZm;
            bool c2 = nd <= kNadgD;
            bool c3 = nn <= kNadgN;
            bool c4 = noc <= kNocne;
            bool c5 = nn <= noc;  
            int ret = 0;
            if (!c1) ret |= 0x0001;
            if (!c2) ret |= 0x0002;
            if (!c3) ret |= 0x0004;
            if (!c4) ret |= 0x0008;
            if (!c5) ret |= 0x0010;
            return ret;
        }

        public int IsValid(string excludeId, int? czasZm, int? nadgD, int? nadgN, int? nocne)
        {
            return IsValid(PracId, Data, excludeId, 
                           db.ISNULL(CzasZm, 0), db.ISNULL(NadgD, 0), db.ISNULL(NadgN, 0), db.ISNULL(Nocne, 0), 
                           czasZm, nadgD, nadgN, nocne);
        }

        /*
        public static int IsValid(string pracId, string data, string excludeId, 
                                  int kCzasZm, int kNadgD, int kNadgN, int kNonce,
                                  int? czasZm, int? nadgD, int? nadgN, int? nocne)
        {
            string excl = String.IsNullOrEmpty(excludeId) ? "" : " and Id <> " + excludeId;
            DataRow dr = db.getDataRow(String.Format(
                //      0                     1                                 2                               3 
                "select sum(CzasZm) as SumZm, sum(NadgodzinyDzien) as SumNadgD, sum(NadgodzinyNoc) as SumNadgN, sum(Nocne) as Nocne " +
                "from PodzialKosztow where IdPracownika={0} and Data='{1}'{2}",
                PracId, Data, excl));
            int zm = db.getInt(dr, 0, 0) + (czasZm == null ? 0 : (int)czasZm);
            int nd = db.getInt(dr, 1, 0) + (nadgD == null ? 0 : (int)nadgD);
            int nn = db.getInt(dr, 2, 0) + (nadgN == null ? 0 : (int)nadgN);
            int noc = db.getInt(dr, 3, 0) + (nocne == null ? 0 : (int)nocne); 
            bool c1 = zm <= CzasZm;
            bool c2 = nd <= NadgD;
            bool c3 = nn <= NadgN;
            bool c4 = noc <= Nocne;
            bool c5 = nn <= noc;  
            int ret = 0;
            if (!c1) ret |= 0x0001;
            if (!c2) ret |= 0x0002;
            if (!c3) ret |= 0x0004;
            if (!c4) ret |= 0x0008;
            if (!c5) ret |= 0x0010;
            return ret;
        }
         */

        private bool kRound(TimeEdit2 te, ref bool rounded)
        {
            if (te.IsEntered && te.Seconds != null)
            {
                int ss = (int)te.Seconds;
                int s = Worktime.RoundSec(ss, /*3*/0, 2);
                if (s != ss) rounded = true;
                te.Seconds = s;
                return true;
            }
            else 
                return false;
        }

        private bool kRound(TimeEdit te, bool round, ref bool rounded)
        {
            if (te.IsEntered && te.Seconds != null)
            {
                if (round)
                {
                    int ss = (int)te.Seconds;
                    int s = Worktime.RoundSec(ss, /*3*/0, 2);
                    if (s != ss) rounded = true;
                    te.Seconds = s;
                }
                return true;
            }
            else
                return false;
        }

        private bool IsValid(ListViewItem item, string id)
        {
            bool c0;
            string ccid = Tools.GetText(item, "hidMPK");
            string cc = Tools.GetDdlSelectedValue(item, "ddlMPK");
            if (!String.IsNullOrEmpty(id) && ccid == cc) 
                c0 = true;
            else
            {       
                DataRow dr = db.getDataRow(String.Format(
                    "select Id from PodzialKosztow where IdPracownika={0} and Data='{1}' and IdMPK={2}",
                    PracId, Data, cc));
                c0 = dr == null;   // nie jest już wybrane
            }
            /*
            TimeEdit2 te1 = (TimeEdit2)item.FindControl("teCzasZm");
            TimeEdit2 te2 = (TimeEdit2)item.FindControl("teNadgD");
            TimeEdit2 te3 = (TimeEdit2)item.FindControl("teNadgN");
            TimeEdit2 te4 = (TimeEdit2)item.FindControl("teNocne");
            /**/
            /**/
            TimeEdit te1 = (TimeEdit)item.FindControl("teCzasZm");
            TimeEdit te2 = (TimeEdit)item.FindControl("teNadgD");
            TimeEdit te3 = (TimeEdit)item.FindControl("teNadgN");
            TimeEdit te4 = (TimeEdit)item.FindControl("teNocne");
            /**/
            bool r = false;
            //bool c1 = kRound(te1, ref r);   // IsEntered, ref rounded
            //bool c2 = kRound(te2, ref r);
            //bool c3 = kRound(te3, ref r);
            //bool c4 = kRound(te4, ref r);

            bool round = ccid != "0";   // 20160214 czasy wg podziału - bez zaokrągleń
            bool c1 = kRound(te1, round, ref r);   // IsEntered, ref rounded
            bool c2 = kRound(te2, round, ref r);
            bool c3 = kRound(te3, round, ref r);
            bool c4 = kRound(te4, round, ref r);
            bool c = !c1 && !c2 && !c3 && !c4;
            int err = 0;
            //----- weryfikacja - jak są dane -----
            if (Tools.StrToDateTime(Data, DateTime.MaxValue) <= DateTime.Today)  // jak błędna konwersja to ma byc weryfikacja
                err = IsValid(id, (int?)te1.Seconds, (int?)te2.Seconds, (int?)te3.Seconds, (int?)te4.Seconds);
            bool v1 = te1.Validate();
            bool v2 = te2.Validate();
            bool v3 = te3.Validate();
            bool v4 = te4.Validate(); 
            if (v1 && v2 && v3 && v4)
                if (c)
                {
                    te1.SetError(true, "Błąd");
                    te2.SetError(true, "Błąd");
                    te3.SetError(true, "Błąd");
                    te4.SetError(true, "Błąd");
                }
                else
                {
                    te1.SetError((err & 0x0001) > 0, "Przekroczenie");
                    te2.SetError((err & 0x0002) > 0, "Przekroczenie");
                    te3.SetError((err & 0x0004) > 0, "Przekroczenie");
                    if ((err & 0x0008) > 0)      te4.SetError(true, "Przekroczenie");
                    else if ((err & 0x0010) > 0) te4.SetError((err & 0x0018) > 0, "Brak");
                    else                         te4.SetError(false, null);
                }
            CustomValidator cv = (CustomValidator)item.FindControl("cvMPK");
            if (!c0) cv.ErrorMessage = "Powtórzone CC";
            else cv.ErrorMessage = null;
            return c0 && !c && err == 0;
        }

        protected void ddlMPK_ValidateInsert(object source, ServerValidateEventArgs args)
        {
            args.IsValid = IsValid(lvMPK.InsertItem, null);
        }

        protected void ddlMPK_ValidateEdit(object source, ServerValidateEventArgs args)
        {
            args.IsValid = IsValid(lvMPK.EditItem, lvMPK.DataKeys[lvMPK.EditIndex].Value.ToString());
        }
        //---------------------
        public bool ReadOnly
        {
            get { return Tools.GetViewStateBool(ViewState["readonly"], true); }
            set { ViewState["readonly"] = value; }
        }

        public bool InEditMode
        {
            get { return lvMPK.EditIndex != -1; }
            set 
            {
                if (value)
                    lvMPK.EditIndex = lvMPK.SelectedIndex;
                else
                    lvMPK.EditIndex = -1;
            }  
        }
        
        public string _PlanId
        {
            get { return hidPlanId.Value; }
            set { hidPlanId.Value = value; }
        }

        public string PracId
        {
            get { return hidPracId.Value; }
            set { hidPracId.Value = value; }
        }

        public string Data
        {
            get { return hidData.Value; }
            set { hidData.Value = value; }
        }
        //-----
        public int? CzasZmPP
        {
            get { return (int?)ViewState["czaszmpp"]; }
            set { ViewState["czaszmpp"] = value; }
        }

        public int? NadgDPP
        {
            get { return (int?)ViewState["nadgdpp"]; }
            set { ViewState["nadgdpp"] = value; }
        }

        public int? NadgNPP
        {
            get { return (int?)ViewState["nadgnpp"]; }
            set { ViewState["nadgnpp"] = value; }
        }

        public int? NocnePP
        {
            get { return (int?)ViewState["nocnepp"]; }
            set { ViewState["nocnepp"] = value; }
        }
        //-----
        public int? CzasZm
        {
            get { return ViewState["czaszm"] != null ? (int?)ViewState["czaszm"] : CzasZmPP; }
            set { ViewState["czaszm"] = value; }
        }

        public int? NadgD
        {
            get { return ViewState["nadgd"] != null ? (int?)ViewState["nadgd"] : NadgDPP; }
            set { ViewState["nadgd"] = value; }
        }

        public int? NadgN
        {
            get { return ViewState["nadgn"] != null ? (int?)ViewState["nadgn"] : NadgNPP; }
            set { ViewState["nadgn"] = value; }
        }

        public int? Nocne
        {
            get { return ViewState["nocne"] != null ? (int?)ViewState["nocne"] : NocnePP; }
            set { ViewState["nocne"] = value; }
        }
        //-----------------
        protected void btWgPrzypisania_Click(object sender, EventArgs e)
        {
            dsWgPrzypisania.Update();
            lvMPK.DataBind();
        }

        public bool wgPrzVisible
        {
            get { return Tools.GetBool(ViewState["przVis"], false); }
            set { ViewState["przVis"] = value; }
        }

        protected void btnFillConfirm_Click(object sender, EventArgs e)
        {
            if (lvMPK.Items.Count > 0) Tools.ShowConfirm(dsFill.UpdateCommand, btnFill);
            else MPKFill();
        }

        protected void btnFill_Click(object sender, EventArgs e)
        {
            MPKClear();
            MPKFill();
        }

        void MPKFill()
        {
            db.Execute(dsFill.SelectCommand.Replace("@SQL1", hidSQL1.Value).Replace("@SQL2", hidSQL2.Value));
            lvMPK.DataBind();
        }

        void MPKClear()
        {
            db.Execute(dsFill.DeleteCommand.Replace("@pracId", hidSQL1.Value).Replace("@data", hidSQL2.Value.Split('|')[0]));
        }

        protected void btnDeleteAllConfirm_Click(object sender, EventArgs e)
        {
            if (lvMPK.Items.Count > 0) Tools.ShowConfirm(dsFill.InsertCommand.Split('|')[0], btnDeleteAll);
            else Tools.ShowMessage(dsFill.InsertCommand.Split('|')[1]);
        }

        protected void btnDeleteAll_Click(object sender, EventArgs e)
        {
            MPKClear();
            lvMPK.DataBind();
        }
    }
}