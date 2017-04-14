using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using TLLib;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Data;
using System.Web.Security;


public partial class ad_single_order : System.Web.UI.Page
{
    #region Common Method

    protected void DropDownList_DataBound(object sender, EventArgs e)
    {
        var cbo = (RadComboBox)sender;
        cbo.Items.Insert(0, new RadComboBoxItem(""));
    }

    #endregion

    #region Event

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridNestedViewItem)
        {
            //var oOrderDetail = new OrderDetail();
            //var nestedItem = (GridNestedViewItem)e.Item;
            //var hdnProductVoucherID = (HiddenField)nestedItem.FindControl("hdnOrderID");
            //var RadGrid2 = (RadGrid)nestedItem.FindControl("RadGrid2");
            //var ObjectDataSource1 = (ObjectDataSource)nestedItem.FindControl("ObjectDataSource1");
            //hdnOrderID.Value = nestedItem.ParentItem["Order2ID"].Text;
            //((RadGrid)nestedItem.FindControl("RadGrid2")).DataSourceID = ObjectDataSource1.ID;
        }
    }
    protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
    {
        if (e.CommandName == "PerformInsert" || e.CommandName == "Update")
        {
            var command = e.CommandName;
            var row = command == "PerformInsert" ? (GridEditFormInsertItem)e.Item : (GridEditFormItem)e.Item;
            //var strOrderStatusID = ((RadComboBox)row.FindControl("ddlOrderStatus")).SelectedValue;
            var VoucherCode = (TextBox)row.FindControl("txtVoucherCode");

            if (e.CommandName == "PerformInsert")
            {
                var strVoucherCode = Guid.NewGuid().GetHashCode().ToString("X");
                //ObjectDataSource1.InsertParameters["VoucherCode"].DefaultValue = "LADY" + Guid.NewGuid().GetHashCode().ToString("X").Substring(0, 4);
                
                ObjectDataSource1.InsertParameters["VoucherCode"].DefaultValue = VoucherCode.Text;
                ObjectDataSource1.InsertParameters["IsReceived"].DefaultValue = "0";
                ObjectDataSource1.InsertParameters["IsUse"].DefaultValue = "0";
            }
            //else
            //{
            //    ObjectDataSource1.UpdateParameters["OrderStatusID"].DefaultValue = strOrderStatusID;
            //    ObjectDataSource1.UpdateParameters["UserName"].DefaultValue = User.Identity.Name;
            //}
        }
        else if (e.CommandName == "QuickUpdate")
        {
            //string OrderID, OrderStatusID;
            //var oOrder = new Orders2();

            //foreach (GridDataItem item in RadGrid1.Items)
            //{
            //    OrderID = item.GetDataKeyValue("Order2ID").ToString();
            //    OrderStatusID = ((RadComboBox)item.FindControl("ddlOrderStatus")).SelectedValue;

            //    oOrder.Order2QuickUpdate(
            //        OrderID,
            //        OrderStatusID
            //    );
            //}
        }
    }
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridEditableItem && e.Item.IsInEditMode)
        {
            //var itemtype = e.Item.ItemType;
            //var row = itemtype == GridItemType.EditFormItem ? (GridEditFormItem)e.Item : (GridEditFormInsertItem)e.Item;
            //var ddlOrderStatus = (RadComboBox)row.FindControl("ddlOrderStatus");
            //var OrderStatusID = ddlOrderStatus.Attributes["SelectedID"];

            //if (!string.IsNullOrEmpty(OrderStatusID))
            //    ddlOrderStatus.SelectedValue = OrderStatusID;
            var txtVoucherCode = (TextBox)e.Item.FindControl("txtVoucherCode");
            txtVoucherCode.Text = "SURI" + Guid.NewGuid().GetHashCode().ToString("X").Substring(0, 4);
        }
        else if (e.Item is GridDataItem)
        {
            //var ddlOrderStatus = (RadComboBox)e.Item.FindControl("ddlOrderStatus");
            //var OrderStatusID = ddlOrderStatus.Attributes["SelectedID"];

            //if (!string.IsNullOrEmpty(OrderStatusID))
            //    ddlOrderStatus.SelectedValue = OrderStatusID;
        }
    }

    protected void txtEmail_TextChanged(object sender, EventArgs e)
    {
        var txtEmail = (TextBox)sender;
        var strEmail = txtEmail.Text;
        var CustomValidator2 = (CustomValidator)txtEmail.Parent.FindControl("CustomValidator2");
        var lblMessage = (Label)txtEmail.Parent.FindControl("lblEmailMessage");

        if (!string.IsNullOrEmpty(strEmail))
        {
            var productVoucher = new ProductVoucher();

            if (productVoucher.ProductVoucherSelectByEmail(strEmail).DefaultView.Count > 0)
            {
                CustomValidator2.ErrorMessage = "Email <b>\"" + strEmail + "\"</b> đã tồn tại!";
                CustomValidator2.IsValid = false;
                lblMessage.Text = "";
            }
            else
            {
                CustomValidator2.IsValid = true;
                lblMessage.Text = "Email <b>\"" + strEmail + "\"</b> có thể sử dụng.";
            }
        }
    }

    #endregion
}