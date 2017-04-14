using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class combo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Title = "Combo Tiết Kiệm";
            var meta = new HtmlMeta() { Name = "description", Content = "Combo Tiết Kiệm" };
            Header.Controls.Add(meta);
        }
    }
}