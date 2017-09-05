﻿using HRRcp.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRRcp.Portal.Wnioski.PracaZdalna
{
    public partial class Acc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (HasFormAccess)
                {
                    Tools.SetNoCache();
                    //----------------------
                }
                else
                    App.ShowNoAccess();
            }
        }

        public static bool HasFormAccess
        {
            get
            {

                return App.User.HasRight(AppUser.rWnioskiZdalnaAcc);
            }
        }
    }
}