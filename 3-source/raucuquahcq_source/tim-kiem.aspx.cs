using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TLLib;

public partial class san_pham : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (((DataView)odsProduct.Select()).Count <= DataPager1.PageSize)
            {
                DataPager1.Visible = false;
            }

            string strTitle, strDescription, strMetaTitle, strMetaDescription;
            if (!string.IsNullOrEmpty(Request.QueryString["pci"]))
            {
                var oProductCategory = new ProductCategory();
                var dv = oProductCategory.ProductCategorySelectOne(Request.QueryString["pci"]).DefaultView;

                if (dv != null && dv.Count <= 0) return;
                var row = dv[0];

                strTitle = Server.HtmlDecode(row["ProductCategoryName"].ToString());
                strDescription = Server.HtmlDecode(row["Description"].ToString());
                strMetaTitle = Server.HtmlDecode(row["MetaTitle"].ToString());
                strMetaDescription = Server.HtmlDecode(row["MetaDescription"].ToString());

                //hdnNews.Value = progressTitle(dv[0]["ArticleCategoryName"].ToString()) + "-tci-" + dv[0]["ArticleCategoryID"].ToString() + ".aspx";
            }
            else
            {
                strTitle = strMetaTitle = "Sản Phẩm";
                strDescription = "Sản Phẩm";
                strMetaDescription = "Sản Phẩm";
            }
            Page.Title = !string.IsNullOrEmpty(strMetaTitle) ? strMetaTitle : strTitle;
            var meta = new HtmlMeta() { Name = "description", Content = !string.IsNullOrEmpty(strMetaDescription) ? strMetaDescription : strDescription };
            Header.Controls.Add(meta);
        }
    }
    protected string progressTitle(object input)
    {
        return TLLib.Common.ConvertTitle(input.ToString());
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