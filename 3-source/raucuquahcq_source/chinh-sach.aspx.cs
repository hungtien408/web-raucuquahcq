using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class chinh_sach : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Title = "Chính Sách Giao Hàng";
            var meta = new HtmlMeta() { Name = "description", Content = "Chính Sách Giao Hàng" };
            Header.Controls.Add(meta);
        }
    }
}