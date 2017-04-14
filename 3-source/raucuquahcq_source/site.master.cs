using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (Session["Cart"] != null)
        {
            var oShoppingCart = new ShoppingCart();
            var dt = oShoppingCart.Cart();
            if (dt.Rows.Count == 0)
            {
                lblSummary.Text = "0";
            }
            else
            {
                int quantity = 0;
                double Total = 0;

                foreach (DataRow dr in dt.Rows)
                {
                    var Quantity = Convert.ToInt32(string.IsNullOrEmpty(dr["Quantity"].ToString()) ? "0" : dr["Quantity"]);
                    var Price = Convert.ToDouble(string.IsNullOrEmpty(dr["Price"].ToString()) ? 0 : dr["Price"]);
                    Total += Quantity * Price;
                    quantity += Quantity;
                }
                lblSummary.Text = "(" + quantity.ToString() + ")";
                //lblTotal.Text = string.IsNullOrEmpty(Total.ToString()) ? "0.000" : (string.Format("{0:##,###.##}", Total.ToString().Replace('.', '*').Replace(',', '.').Replace('*', ',')));
                //lblTotalPrice.Text = string.Format("{0:##,###.##}", Total).Replace('.', '*').Replace(',', '.').Replace('*', ',') + "đ";
            }

            //ListView1.DataBind();
        }
    }
    protected void btnSubmitSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("tim-kiem.aspx?kw=" + txtTextSearch.Text.Trim());
    }
}
