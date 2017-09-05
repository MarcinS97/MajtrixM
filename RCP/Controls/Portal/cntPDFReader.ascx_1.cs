﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using HRRcp.App_Code;
using System.Web.Configuration;
using System.IO;
using System.Collections;
using System.Drawing;
using System.Drawing.Imaging;
using System.Text.RegularExpressions;

namespace HRRcp.Controls
{
    public partial class cntPDFReader : System.Web.UI.UserControl
    {
        string _PDFPath;
        public string PDFPath
        {
            get { return _PDFPath; }
            set { _PDFPath = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) FirstLoad();
        }

        void FirstLoad()
        {
            string docId = (string)Session["DocID"];
            if (string.IsNullOrEmpty(docId)) Response.Redirect("../default.aspx");
            SqlConnection con = db.Connect(db.PORTAL);
            DataRow dr = db.getDataRow(con, "select * from SqlMenu where Id = " + docId);


            string mime = db.getValue(dr, "Par1");
            string cmd = db.getValue(dr, "Command");
            if (db.getValue(dr, "Grupa") != "GAZETKA")
            {
                string parent = db.getValue(dr, "ParentId");
                DataRow dr2 = db.getDataRow(con, "select MenuText from SqlMenu where Id = " + parent);
                DocGTitle.Text = db.getValue(dr2, "MenuText");
                DocTitle.Text = db.getValue(dr, "MenuText");
                Literal1.Text = ((mime == "application/pdf") ? (Func<DataRow, string>)GetHTMLForPDF : GetHTMLForIMG)(dr);
            }
            else
            {
                DocGTitle.Text = "Gazetka";
                DocTitle.Text = "";
                Literal1.Text = GetHTMLForPDF(dr);
            }

            
            db.Disconnect(con);
        }

        private string GetHTMLForPDF_OLD(DataRow dr)
        {
            string file = db.getValue(dr, "Command");
            if (file.StartsWith("~"))
                file = "Pliki/" + Path.GetFileName(file.Substring(1));
            else
                file = "Pliki/" + Path.GetFileName(file);
            return String.Format("<embed src=\"{0}#toolbar=0\" class=\"pdfviewer\" >", file);
        }

        private string GetHTMLForIMG(DataRow dr)
        {
            string file = db.getValue(dr, "Command");
            if (file.StartsWith("~"))
                file = "Pliki/" + Path.GetFileName(file.Substring(1));
            else
                file = "Pliki/" + Path.GetFileName(file);
            if (db.getValue(dr, "Par2") == "1")
            {
                DocGTitle.CssClass += "prBv";
                PrintButton.Visible = true;
            }
            return String.Format("<div class=\"PDFViewerScroller\"><img src=\"{0}\" class=\"viewerIMG\" ></div>", file);
        }


        private string GetHTMLForPDF(DataRow dr)
        {
            if (!App.User.IsKiosk)
                return GetHTMLForPDF_OLD(dr);
            string file = Path.GetFileName(db.getValue(dr, "Command"));
            if (db.getValue(dr, "Par2") == "1")
            {
                DocGTitle.CssClass += "prBv";
                PrintButton.Visible = true;
            }

            var files = GetIMGFiles(file);

            string[] HTMLCode = files
                .Select(a => string.Format("<img src=\"{0}\" class=\"viewerIMG\">", a))
                .ToArray();

            if(HTMLCode.Length == 0)
                return GetHTMLForPDF_OLD(dr);

            return "<div class=\"PDFViewerScroller\">" + string.Join("<br />\n", HTMLCode) + "</div>";
        }

        private IEnumerable<string> GetIMGFiles(string file)
        {
            string fileName = Path.GetFileNameWithoutExtension(file);
            var basePath = Server.MapPath(@"~/portal/pliki/");

            return Directory.GetFiles(basePath, fileName + "_*.png")
                .Select(a => "Pliki\\" + Path.GetFileName(a))
                .OrderBy(a => Tools.GetPageNum(a));
        }

        protected void PrintButton_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("~/Portal/PrePrint.aspx"));
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("~/Portal/Pliki.aspx"));
        }
    }
}