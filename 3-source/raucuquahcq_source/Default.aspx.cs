using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TLLib;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Title = "Rau Sạch";
            var meta = new HtmlMeta() { Name = "description", Content = "Rau Sạch" };
            Header.Controls.Add(meta);

            var oProduct = new Product();
            var dv2 = oProduct.ProductSelectAll("", "", "", "", "", "", "", Request.QueryString["pci"], "", "", "", "", "", "", "", "", "", "", "", "", "True", "True").DefaultView;

            if (dv2.Count <= DataPager1.PageSize)
            {
                LinkView.Visible = false;
            }
        }
    }
    protected string progressTitle(object input)
    {
        return TLLib.Common.ConvertTitle(input.ToString());
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        DataPager1.PageSize = DataPager1.PageSize + 8;
    }
    protected void lstProduct_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        var item = e.Item as ListViewDataItem;
        var cmd = e.CommandName;
        var ProductID = (item.FindControl("hdnProductID") as HiddenField).Value;
        var ProductName = (item.FindControl("lblProductName") as Label).Text;
        var ProductNameEn = (item.FindControl("lblProductNameEn") as Label).Text;
        var ImageName = (item.FindControl("hdnImageName") as HiddenField).Value;
        var ProductCode = (item.FindControl("hdnProductCode") as HiddenField).Value;
        var Quantity = "1";//(item.FindControl("inQuantity") as TextBox).Text;//(item.FindControl("hdnQuantitySale") as HiddenField).Value;
        double Price = Convert.ToDouble((item.FindControl("hdnPrice") as HiddenField).Value);
        double SavePrice = 0;
        var oProductSizeColor = new ProductSizeColor();
        if (cmd == "AddToCart")
        {
            var oShoppingCart = new ShoppingCart();
            oShoppingCart.CreateCart(ProductID,
                ImageName,
                ProductName,
                ProductNameEn,
                ProductCode,
                "",
                Price,
                SavePrice,
                "",
                Quantity
                );
        }
    }
}