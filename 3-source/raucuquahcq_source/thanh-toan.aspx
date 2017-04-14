<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="thanh-toan.aspx.cs" Inherits="thanh_toan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrap-main">
        <h1 class="main-title">Giỏ hàng</h1>
        <asp:Label ID="lblGioHang" runat="server" Text="Không có sản phẩm trong giỏ hàng"></asp:Label>
        <div class="wrap-giohang" id="giohang" runat="server">
            <div class="gh-head">
                <p>giỏ hàng</p>
                <span><i>
                    <asp:Label ID="lblSummary" runat="server" Text="0"></asp:Label></i> sản phẩm trong giỏ hàng</span>
                <a href="san-pham.aspx">tiếp tục mua hàng <i class="fa fa-chevron-right"></i></a>
            </div>
            <div class="clr"></div>
            <div class="gh-content">
                <div class="left">
                    <asp:ListView ID="ListView1" runat="server"
                        DataSourceID="odsCart" EnableModelValidation="True" OnDataBound="ListView1_DataBound" OnItemCommand="ListView1_ItemCommand">
                        <ItemTemplate>
                            <div class="item">
                                <div class="img">
                                    <img id="Img1" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/" + Eval("ImageName") : "~/assets/images/ao-thun-nu-mau-hong.jpg" %>'
                                        runat="server" />
                                </div>
                                <div class="content">
                                    <p><%# Eval("ProductName") %> <span>- <%# Eval("ProductCode") %></span></p>
                                    <span><%# !string.IsNullOrEmpty(Eval("Price").ToString()) ? (string.Format("{0:##,###.##}", Eval("Price")).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " vnđ") : "" %></span>
                                    <div class="number">
                                        Số lượng:
                                        <div class="sp-quantity">
                                            <%--<div class="sp-btn" data-id="sp-plus"></div>
                                            <div class="sp-btn" data-id="sp-minus"></div>--%>
                                            <div class="sp-input">
                                                <%--<input type="text" class="quntity-input" value="0" disabled="disabled" />--%>
                                                <asp:TextBox ID="txtQuantity" runat="server" CssClass="quntity-input" Text='<%# Eval("Quantity") %>' OnTextChanged="txtQuantity_TextChanged" AutoPostBack="true"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<div class="huy-mua">
                                        huỷ
                                    </div>--%>
                                    <asp:LinkButton CssClass="huy-mua" CommandName="Remove" OnClientClick="return confirm('Bạn muốn xóa sản phẩm này?')"
                                        ID="lkbRemove" runat="server">huỷ</asp:LinkButton>
                                </div>
                            </div>
                            <asp:HiddenField ID="hdnQuantity" runat="server" Value='<%# Eval("Quantity") %>' />
                            <asp:HiddenField ID="hdnCartProductID" Value='<%# Eval("ProductID") %>' runat="server" />
                            <asp:HiddenField ID="hdnCartPrice" Value='<%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "0" : Eval("Price") %>'
                                runat="server" />
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsCart" runat="server" SelectMethod="Cart" TypeName="ShoppingCart"></asp:ObjectDataSource>
                </div>
                <div class="right">
                    <div class="wrap-head-right">
                        <h1>thông tin giao hàng</h1>
                        <div class="form-wrap">
                            <div class="form-group">
                                <label>Họ tên</label>
                                <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server"
                                    Display="Dynamic" ValidationGroup="DatHang" ControlToValidate="txtFullName"
                                    ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label>Số điện thoại</label>
                                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator1" runat="server"
                                    Display="Dynamic" ValidationGroup="DatHang" ControlToValidate="txtPhone"
                                    ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator1"
                                    runat="server" ValidationGroup="DatHang" ControlToValidate="txtEmail"
                                    ErrorMessage="Sai định dạng email!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server"
                                    Display="Dynamic" ValidationGroup="DatHang" ControlToValidate="txtEmail"
                                    ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label>Địa chỉ</label>
                                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator4" runat="server"
                                    Display="Dynamic" ValidationGroup="DatHang" ControlToValidate="txtAddress"
                                    ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="form-group">
                                        <label>Tỉnh Thành</label>
                                        <asp:DropDownList ID="ddlProvince" AutoPostBack="true" DataSourceID="OdsProvince"
                                            DataTextField="ProvinceName" DataValueField="ProvinceID" CssClass="box-select"
                                            runat="server">
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="OdsProvince" runat="server" SelectMethod="ProvinceSelectAll"
                                            TypeName="TLLib.Province">
                                            <SelectParameters>
                                                <asp:Parameter Name="ProvinceID" Type="String" />
                                                <asp:Parameter Name="ProvinceName" Type="String" />
                                                <asp:Parameter Name="ShortName" Type="String" />
                                                <asp:Parameter Name="CountryID" Type="String" />
                                                <asp:Parameter Name="Priority" Type="String" />
                                                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </div>
                                    <div class="form-group">
                                        <label>Quận</label>
                                        <asp:DropDownList ID="ddlDistrict" DataSourceID="OdsDistrict" DataTextField="DistrictName"
                                            DataValueField="DistrictID" CssClass="box-select" runat="server">
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="OdsDistrict" runat="server" SelectMethod="DistrictSelectAll"
                                            TypeName="TLLib.District">
                                            <SelectParameters>
                                                <asp:Parameter Name="DistrictName" Type="String" />
                                                <asp:ControlParameter ControlID="ddlProvince" Name="ProvinceIDs"
                                                    PropertyName="SelectedValue" Type="String" />
                                                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                                <asp:Parameter Name="Priority" Type="String" />
                                                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <%--<div class="form-group">
                                <label>Giờ giao hàng</label>
                                <select>
                                    <option value="value">1</option>
                                    <option value="value">2</option>
                                    <option value="value">3</option>
                                </select>
                            </div>
                            <span class="note">*<i>Thông tin bắt buộc</i></span>--%>
                        </div>
                    </div>
                    <%--<div class="wrap-thoigian">
                        <h3>Thời gian giao hàng</h3>
                        <select>
                            <option value="value">1</option>
                            <option value="value">2</option>
                            <option value="value">3</option>
                        </select>
                        <select>
                            <option value="value">1</option>
                            <option value="value">2</option>
                            <option value="value">3</option>
                        </select>
                    </div>--%>
                    <div class="wrap-tinhtien">
                        <p>
                            Tạm tính: <span class="gia-goc">
                                <asp:Label ID="lblTotalPrice" runat="server"></asp:Label>
                                <asp:HiddenField ID="hdnTotalPrice" runat="server" />
                            </span>
                        </p>
                        <p>
                            Phí vận chuyển:
                            <asp:Label ID="lblShippingPrice" runat="server"></asp:Label>
                            <asp:HiddenField ID="hdnShippingPrice" runat="server" />
                        </p>
                        <p>
                            Giảm giá: <span>
                                <asp:Label ID="lblSavePrice" runat="server"></asp:Label>
                                <asp:HiddenField ID="hdnSavePrice" runat="server" />
                            </span>
                        </p>
                        <div class="ma-giam">
                            Mã giảm giá:
                            <div class="form-group">
                                <asp:TextBox ID="txtInputVoucher" runat="server"></asp:TextBox>
                                <asp:CustomValidator ID="validateVoucher" runat="server"
                                    Display="Dynamic" CssClass="lb-error"></asp:CustomValidator>
                                <asp:Button ID="btnUseVoucher" runat="server" Text="Sử dụng" OnClick="btnUseVoucher_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="wrap-thanhtien">
                        <p>
                            Thành tiền: <span class="gia-goc">
                                <asp:Label ID="lblSumTotalPrice" runat="server"></asp:Label>
                                <asp:HiddenField ID="hdnSumTotalPrice" runat="server" />
                            </span>
                        </p>
                        <asp:Button ID="btnDatHang" runat="server" ValidationGroup="DatHang" OnClick="btnDatHang_Click" Text="ĐẶT HÀNG" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

