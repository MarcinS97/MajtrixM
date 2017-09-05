﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRRcp.Controls
{
    public partial class PageTitle : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected override void OnPreRender(EventArgs e)  // tu widzimy juz ustawione zmienne i wykonuje się to tylko w momencie pokazywania kontrolki !!!
        {
            if (String.IsNullOrEmpty(SubText1) && String.IsNullOrEmpty(SubValue1))
                lbTitle.Style.Add("line-height", "30px");  // 32px
            base.OnPreRender(e);
        }

        //---------
        public string Ico
        {
            set { Image1.ImageUrl = value; }
            get { return Image1.ImageUrl; }
        }

        public string IcoRight
        {
            set
            {
                Image2.ImageUrl = value;
                Image2.Visible = !String.IsNullOrEmpty(Image2.ImageUrl);
            }
            get { return Image2.ImageUrl; }
        }

        public string Title
        {
            set { lbTitle.Text = value; }
            get { return lbTitle.Text; }
        }
        //---------
        public string SubText1
        {
            set
            {
                lbSub1.Text = value;
                //sub1.Visible = !String.IsNullOrEmpty(value) || !String.IsNullOrEmpty(SubValue1);
            }
            get { return lbSub1.Text; }
        }

        public string SubText2
        {
            set
            {
                lbSub2.Text = value;
                //sub2.Visible = !String.IsNullOrEmpty(value) || !String.IsNullOrEmpty(SubValue2);
            }
            get { return lbSub2.Text; }
        }

        public string SubText3
        {
            set
            {
                lbSub3.Text = value;
                //sub3.Visible = !String.IsNullOrEmpty(value) || !String.IsNullOrEmpty(SubValue3);
            }
            get { return lbSub3.Text; }
        }
        //--------
        public string SubValue1
        {
            set
            {
                lbValue1.Text = value;
                //sub1.Visible = !String.IsNullOrEmpty(value) || !String.IsNullOrEmpty(SubText1);
            }
            get { return lbValue1.Text; }
        }

        public string SubValue2
        {
            set
            {
                lbValue2.Text = value;
                //sub2.Visible = !String.IsNullOrEmpty(value) || !String.IsNullOrEmpty(SubText2);
            }
            get { return lbValue2.Text; }
        }

        public string SubValue3
        {
            set
            {
                lbValue3.Text = value;
                //sub3.Visible = !String.IsNullOrEmpty(value) || !String.IsNullOrEmpty(SubText3);
            }
            get { return lbValue3.Text; }
        }
    }
}