﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HRRcp.App_Code;

namespace HRRcp.Reports
{
    public partial class RepCCNadminuty: System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                App.CheckccPrawa(cntReport1);
        }
    }
}
