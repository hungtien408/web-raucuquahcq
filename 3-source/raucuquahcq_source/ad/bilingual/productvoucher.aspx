<%@ Page Title="" Language="C#" MasterPageFile="~/ad/template/adminEn.master" AutoEventWireup="true"
    CodeFile="productvoucher.aspx.cs" Inherits="ad_single_order" %>

<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <script type="text/javascript">
        var tableView = null;
        function RowDblClick(sender, eventArgs) {
            sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
        }

        function RowMouseOver(sender, eventArgs) {
            var selectedRows = sender.get_masterTableView().get_selectedItems();
            var elem = $get(eventArgs.get_id());
            if (selectedRows.length > 0)
                for (var i = 0; i < selectedRows.length; i++) {
                    var selectedID = selectedRows[i].get_id();

                    if (selectedID != eventArgs.get_id())
                        elem.className += (" rgSelectedRow");
                }
            else
                elem.className += (" rgSelectedRow");
        }

        function RowMouseOut(sender, eventArgs) {
            var className = "rgSelectedRow";
            var elem = $get(eventArgs.get_id());

            var selectedRows = sender.get_masterTableView().get_selectedItems();

            if (selectedRows.length > 0)
                for (var i = 0; i < selectedRows.length; i++) {
                    var selectedID = selectedRows[i].get_id();
                    if (selectedID != eventArgs.get_id())
                        removeCssClass(className, elem);
                }
            else
                removeCssClass(className, elem);
        }

        function removeCssClass(className, element) {
            element.className = element.className.replace(className, "").replace(/^\s+/, '').replace(/\s+$/, '');
        }

        function pageLoad(sender, args) {
            tableView = $find("<%= RadGrid1.ClientID %>").get_masterTableView();
        }

        function RadComboBox1_SelectedIndexChanged(sender, args) {
            tableView.set_pageSize(sender.get_value());
        }

        function changePage(argument) {
            tableView.page(argument);
        }

        function RadNumericTextBox1_ValueChanged(sender, args) {
            tableView.page(sender.get_value());
        }

        function conditionalPostback(sender, eventArgs) {
            if (eventArgs.get_eventTarget().indexOf("ExportToExcelButton") >= 0 || eventArgs.get_eventTarget().indexOf("ExportToWordButton") >= 0 || eventArgs.get_eventTarget().indexOf("ExportToPdfButton") >= 0)
                eventArgs.set_enableAjax(false);
        }
    </script>
    <style type="text/css">
        .viewWrap {
            padding: 15px;
            background: #2291b5 0 0 url(../assets/images/bluegradient.gif) repeat-x;
        }

        .contactWrap {
            padding: 10px 15px 15px 15px;
            background: #fff;
            color: #333;
        }

        .grid-footer td {
            background-color: #fff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">
    <h3 class="mainTitle">
        <img alt="" src="../assets/images/order.png" class="vam" />
        Quản Lý Voucher</h3>
    <br />
    <asp:RadAjaxPanel ID="RadAjaxPanel1" runat="server" ClientEvents-OnRequestStart="conditionalPostback">
        <asp:Panel ID="pnlSearch" DefaultButton="btnSearch" runat="server" Visible="false">
            <table class="search">
                <tr>
                    <td class="left">Mã Voucher
                    </td>
                    <td>
                        <asp:RadTextBox ID="txtSearchVoucherCode" runat="server" Width="130px">
                        </asp:RadTextBox>
                    </td>
                    <td class="left">Từ ngày
                    </td>
                    <td>
                        <asp:RadDatePicker ShowPopupOnFocus="True" ID="dpFromDate" runat="server" Culture="vi-VN"
                            Calendar-CultureInfo="vi-VN" Width="138px">
                            <Calendar ID="Calendar1" runat="server">
                                <SpecialDays>
                                    <asp:RadCalendarDay Repeatable="Today">
                                        <ItemStyle CssClass="rcToday" />
                                    </asp:RadCalendarDay>
                                </SpecialDays>
                            </Calendar>
                        </asp:RadDatePicker>
                    </td>
                    <td class="left">Đến ngày
                    </td>
                    <td>
                        <asp:RadDatePicker ShowPopupOnFocus="True" ID="dpToDate" runat="server" Culture="vi-VN"
                            Calendar-CultureInfo="vi-VN" Width="138px">
                            <Calendar ID="Calendar2" runat="server">
                                <SpecialDays>
                                    <asp:RadCalendarDay Repeatable="Today">
                                        <ItemStyle CssClass="rcToday" />
                                    </asp:RadCalendarDay>
                                </SpecialDays>
                            </Calendar>
                        </asp:RadDatePicker>
                    </td>
                </tr>
                <tr>
                    <td class="left">Họ tên
                    </td>
                    <td>
                        <asp:RadTextBox ID="txtSearchFullName" runat="server" Width="130px">
                        </asp:RadTextBox>
                    </td>
                    <td class="left">Địa chỉ
                    </td>
                    <td>
                        <asp:RadTextBox ID="txtSearchAddress" runat="server" Width="130px">
                        </asp:RadTextBox>
                    </td>
                    <td class="left">Điện thoại
                    </td>
                    <td>
                        <asp:RadTextBox ID="txtSearchHomePhone" runat="server" Width="130px">
                        </asp:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="left">Di động
                    </td>
                    <td>
                        <asp:RadTextBox ID="txtSearchCellPhone" runat="server" Width="130px">
                        </asp:RadTextBox>
                    </td>
                    <td class="left">Email
                    </td>
                    <td>
                        <asp:RadTextBox ID="txtSearchEmail" runat="server" Width="130px">
                        </asp:RadTextBox>
                    </td>
                </tr>
            </table>
            <div align="right" style="padding: 5px 0 5px 0; border-bottom: 1px solid #ccc; margin-bottom: 10px">
                <asp:RadButton ID="btnSearch" runat="server" Text="Tìm kiếm">
                    <Icon PrimaryIconUrl="~/ad/assets/images/find.png" />
                </asp:RadButton>
            </div>
        </asp:Panel>
        <asp:Label ID="lblError" ForeColor="Red" runat="server"></asp:Label>
        <asp:RadGrid ID="RadGrid1" runat="server" Culture="vi-VN" AllowMultiRowSelection="True"
            DataSourceID="ObjectDataSource1" GridLines="Horizontal" AutoGenerateColumns="False"
            AllowAutomaticDeletes="True" ShowStatusBar="True" OnItemCommand="RadGrid1_ItemCommand"
            OnItemDataBound="RadGrid1_ItemDataBound" CssClass="grid" AllowPaging="True" AllowSorting="True"
            AllowAutomaticInserts="True" AllowAutomaticUpdates="True" CellSpacing="0" OnItemCreated="RadGrid1_ItemCreated">
            <ClientSettings EnableRowHoverStyle="true">
                <Selecting AllowRowSelect="True" />
                <ClientEvents OnRowDblClick="RowDblClick" />
                <Resizing AllowColumnResize="true" ClipCellContentOnResize="False" />
            </ClientSettings>
            <ExportSettings IgnorePaging="true" OpenInNewWindow="true" ExportOnlyData="true"
                Excel-Format="ExcelML" Pdf-AllowCopy="true">
            </ExportSettings>
            <MasterTableView CommandItemDisplay="TopAndBottom" DataSourceID="ObjectDataSource1"
                InsertItemPageIndexAction="ShowItemOnCurrentPage" AllowMultiColumnSorting="True"
                DataKeyNames="ProductVoucherID">
                <PagerStyle AlwaysVisible="true" Mode="NextPrevNumericAndAdvanced" PageButtonCount="10"
                    FirstPageToolTip="Trang đầu" LastPageToolTip="Trang cuối" NextPagesToolTip="Trang kế"
                    NextPageToolTip="Trang kế" PagerTextFormat="Đổi trang: {4} &nbsp;Trang <strong>{0}</strong> / <strong>{1}</strong>, Kết quả <strong>{2}</strong> - <strong>{3}</strong> trong <strong>{5}</strong>."
                    PageSizeLabelText="Kết quả mỗi trang:" PrevPagesToolTip="Trang trước" PrevPageToolTip="Trang trước" />
                <CommandItemTemplate>
                    <div class="command">
                        <div style="float: right">
                            <asp:Button ID="ExportToExcelButton" runat="server" CssClass="rgExpXLS" CommandName="ExportToExcel"
                                AlternateText="Excel" ToolTip="Xuất ra Excel" />
                            <asp:Button ID="ExportToPdfButton" runat="server" CssClass="rgExpPDF" CommandName="ExportToPdf"
                                AlternateText="PDF" ToolTip="Xuất ra PDF" />
                            <asp:Button ID="ExportToWordButton" runat="server" CssClass="rgExpDOC" CommandName="ExportToWord"
                                AlternateText="Word" ToolTip="Xuất ra Word" />
                        </div>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="InitInsert" Visible='<%# !RadGrid1.MasterTableView.IsItemInserted %>'
                            CssClass="item"><img class="vam" alt="" src="../assets/images/add.png" /> Thêm mới</asp:LinkButton>|
                        <%--<asp:LinkButton ID="LinkButton3" runat="server" CommandName="PerformInsert" Visible='<%# RadGrid1.MasterTableView.IsItemInserted %>'><img class="vam" alt="" src="../assets/images/accept.png" /> Thêm</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="btnCancel" runat="server" CommandName="CancelAll" Visible='<%# RadGrid1.EditIndexes.Count > 0 || RadGrid1.MasterTableView.IsItemInserted %>'><img class="vam" alt="" src="../assets/images/delete-icon.png" /> Hủy</asp:LinkButton>&nbsp;&nbsp;--%>
                        <asp:LinkButton ID="btnEditSelected" runat="server" CommandName="EditSelected" Visible='<%# RadGrid1.EditIndexes.Count == 0 %>'
                            CssClass="item"><img width="12px" class="vam" alt="" src="../assets/images/tools.png" /> Sửa</asp:LinkButton>|
                        <%--<asp:LinkButton ID="btnUpdateEdited" runat="server" CommandName="UpdateEdited" Visible='<%# RadGrid1.EditIndexes.Count > 0 %>'><img class="vam" alt="" src="../assets/images/accept.png" /> Cập nhật</asp:LinkButton>&nbsp;&nbsp;--%>
                        <asp:LinkButton ID="LinkButton1" OnClientClick="javascript:return confirm('Xóa tất cả dòng đã chọn?')"
                            runat="server" CommandName="DeleteSelected" CssClass="item"><img class="vam" alt="" title="Xóa tất cả dòng được chọn" src="../assets/images/delete-icon.png" /> Xóa</asp:LinkButton>|
                        <asp:LinkButton ID="LinkButton6" runat="server" CommandName="QuickUpdate" Visible='<%# RadGrid1.EditIndexes.Count == 0 %>'
                            CssClass="item"><img class="vam" alt="" src="../assets/images/accept.png" /> Sửa nhanh</asp:LinkButton>|
                        <asp:LinkButton ID="LinkButton4" runat="server" CommandName="RebindGrid" CssClass="item"><img class="vam" alt="" src="../assets/images/reload.png" /> Làm mới</asp:LinkButton>
                    </div>
                    <div class="clear">
                    </div>
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </CommandItemTemplate>
                <Columns>
                    <asp:GridClientSelectColumn FooterText="CheckBoxSelect footer" HeaderStyle-Width="1%"
                        UniqueName="CheckboxSelectColumn" />
                    <asp:GridTemplateColumn HeaderStyle-Width="1%" HeaderText="STT">
                        <ItemTemplate>
                            <%# Container.DataSetIndex + 1 %>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderStyle-Width="1%" Visible="false">
                        <ItemTemplate>
                            <img id="Img1" alt="" src="~/ad/assets/images/new.gif" runat="server" visible='<%# string.IsNullOrEmpty(Eval("IsNew").ToString()) ? false : Eval("IsNew") %>' />
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridBoundColumn HeaderText="ID" DataField="ProductVoucherID" SortExpression="ProductVoucherID" Visible="false">
                    </asp:GridBoundColumn>
                    <asp:GridBoundColumn HeaderText="Mã Voucher" DataField="VoucherCode" SortExpression="VoucherCode">
                    </asp:GridBoundColumn>
                    <asp:GridTemplateColumn DataField="VoucherPrice" HeaderText="Giá Voucher" SortExpression="VoucherPrice">
                        <ItemTemplate>
                            <%# string.Format("{0:##,###.##}", Eval("VoucherPrice")) %>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridBoundColumn HeaderText="Họ tên" DataField="FullName" SortExpression="FullName" Visible="false">
                    </asp:GridBoundColumn>
                    <asp:GridBoundColumn HeaderText="Địa chỉ" DataField="Address" SortExpression="Address" Visible="false">
                    </asp:GridBoundColumn>
                    <asp:GridBoundColumn HeaderText="Điện thoại" DataField="HomePhone" SortExpression="HomePhone" Visible="false">
                    </asp:GridBoundColumn>
                    <asp:GridBoundColumn HeaderText="Di động" DataField="CellPhone" SortExpression="CellPhone" Visible="false">
                    </asp:GridBoundColumn>
                    <asp:GridBoundColumn HeaderText="Email" DataField="Email" SortExpression="Email">
                    </asp:GridBoundColumn>
                    <asp:GridTemplateColumn DataField="IsReceived" HeaderText="Đã nhận voucher" SortExpression="IsReceived">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkIsReceived" runat="server" Checked='<%# string.IsNullOrEmpty(Eval("IsReceived").ToString()) ? false : Eval("IsReceived") %>'
                                CssClass="checkbox" />
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn DataField="IsUse" HeaderText="Đã sử dụng" SortExpression="IsUse">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkIsUse" runat="server" Checked='<%# string.IsNullOrEmpty(Eval("IsUse").ToString()) ? false : Eval("IsUse") %>'
                                CssClass="checkbox" />
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridBoundColumn HeaderText="Ngày tạo" DataField="CreateDate" SortExpression="CreateDate"
                        DataFormatString="{0: dd/MM/yyyy hh:mm tt}">
                    </asp:GridBoundColumn>
                </Columns>
                <EditFormSettings EditFormType="Template">
                    <FormTemplate>
                        <asp:Panel ID="Panel1" runat="server" DefaultButton="lnkUpdate">
                            <h3 class="searchTitle">Thông Tin Voucher
                            </h3>
                            <table class="search">
                                <tr>
                                    <td class="left" valign="top">Mã Voucher
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtVoucherCode" Text='<%# Bind("VoucherCode") %>' runat="server" Width="500px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left">Giá Voucher
                                    </td>
                                    <td>
                                        <asp:RadNumericTextBox ID="txtVoucherPrice" runat="server" Width="500px" Text='<%# Bind("VoucherPrice") %>'
                                            EmptyMessage="Giá Voucher..." Type="Number">
                                            <NumberFormat AllowRounding="false" />
                                        </asp:RadNumericTextBox>
                                    </td>
                                </tr>
                                <tr class="invisible">
                                    <td class="left" valign="top">Họ tên
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFullname" Text='<%# Bind("FullName") %>' runat="server" Width="500px" />
                                    </td>
                                </tr>
                                <tr class="invisible">
                                    <td class="left">Địa chỉ
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAddress" Text='<%# Bind("Address") %>' runat="server" Width="500px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr class="invisible">
                                    <td class="left">Điện thoại
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtHomePhone" Text='<%# Bind("HomePhone") %>' runat="server" Width="500px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr class="invisible">
                                    <td class="left">Di động
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCellPhone" Text='<%# Bind("CellPhone") %>' runat="server" Width="500px"></asp:TextBox>
                                    </td>
                                </tr>
                                <%--<tr class="invisible">
                                    <td class="left">Email
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmail" runat="server" AutoPostBack="True" OnTextChanged="txtEmail_TextChanged"
                                            Width="500px"></asp:TextBox>
                                        <asp:Label ID="lblEmailMessage" runat="server" ForeColor="Green"></asp:Label>
                                        <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txtEmail"
                                            Display="Dynamic"></asp:CustomValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                                            Display="Dynamic" ErrorMessage="Sai định dạng email." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>--%>
                            </table>
                            <div style="padding-left: 10px">
                                <hr />
                                <asp:LinkButton ID="lnkUpdate" runat="server" CausesValidation="True" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'>
                                    <img alt="" title="Cập nhật" src="../assets/images/ok.png" class="vam" /> <%# (Container is GridEditFormInsertItem) ? "Thêm" : "Cập nhật" %>
                                </asp:LinkButton>
                                &nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation="False" CommandName="Cancel">
                                    <img alt="" title="Hủy" src="../assets/images/cancel.png" class="vam" /> &nbsp;&nbsp;Hủy
                                </asp:LinkButton>
                            </div>
                        </asp:Panel>
                    </FormTemplate>
                </EditFormSettings>
            </MasterTableView>
            <HeaderStyle Font-Bold="True" />
            <HeaderContextMenu EnableImageSprites="True" CssClass="GridContextMenu GridContextMenu_Default">
            </HeaderContextMenu>
        </asp:RadGrid>
        <asp:RadInputManager ID="RadInputManager1" runat="server">
            <asp:TextBoxSetting EmptyMessage="Họ tên ...">
                <TargetControls>
                    <asp:TargetInput ControlID="txtFullname" />
                </TargetControls>
            </asp:TextBoxSetting>
            <asp:TextBoxSetting EmptyMessage="Địa chỉ ...">
                <TargetControls>
                    <asp:TargetInput ControlID="txtAddress" />
                </TargetControls>
            </asp:TextBoxSetting>
            <asp:TextBoxSetting EmptyMessage="Điện thoại ...">
                <TargetControls>
                    <asp:TargetInput ControlID="txtHomePhone" />
                </TargetControls>
            </asp:TextBoxSetting>
            <asp:TextBoxSetting EmptyMessage="Di động ...">
                <TargetControls>
                    <asp:TargetInput ControlID="txtCellPhone" />
                </TargetControls>
            </asp:TextBoxSetting>
            <asp:TextBoxSetting EmptyMessage="Email ...">
                <TargetControls>
                    <asp:TargetInput ControlID="txtEmail" />
                </TargetControls>
            </asp:TextBoxSetting>
            <asp:NumericTextBoxSetting AllowRounding="False" Culture="vi-VN" EmptyMessage="Số lượng ..."
                Type="Number" DecimalDigits="0">
                <TargetControls>
                    <asp:TargetInput ControlID="txtQuantity" />
                </TargetControls>
            </asp:NumericTextBoxSetting>
        </asp:RadInputManager>
    </asp:RadAjaxPanel>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="ProductVoucherSelectAll"
        TypeName="TLLib.ProductVoucher" DeleteMethod="ProductVoucherDelete" InsertMethod="ProductVoucherInsert"
        UpdateMethod="ProductVoucherUpdate">
        <DeleteParameters>
            <asp:Parameter Name="ProductVoucherID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="VoucherCode" Type="String" />
            <asp:Parameter Name="VoucherPrice" Type="String" />
            <asp:Parameter Name="FullName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="HomePhone" Type="String" />
            <asp:Parameter Name="CellPhone" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="IsReceived" Type="String" />
            <asp:Parameter Name="IsUse" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="Keyword" Type="String" />
            <asp:ControlParameter ControlID="txtSearchVoucherCode" Name="VoucherCode" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="dpFromDate" Name="FromDate" PropertyName="SelectedDate"
                Type="String" />
            <asp:ControlParameter ControlID="dpToDate" Name="ToDate" PropertyName="SelectedDate"
                Type="String" />
            <asp:ControlParameter ControlID="txtSearchFullName" Name="FullName" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtSearchAddress" Name="Address" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtSearchHomePhone" Name="HomePhone" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtSearchCellPhone" Name="CellPhone" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtSearchEmail" Name="Email" PropertyName="Text"
                Type="String" />
            <asp:Parameter Name="IsReceived" Type="String" />
            <asp:Parameter Name="IsUse" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ProductVoucherID" Type="String" />
            <asp:Parameter Name="VoucherCode" Type="String" />
            <asp:Parameter Name="VoucherPrice" Type="String" />
            <asp:Parameter Name="FullName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="HomePhone" Type="String" />
            <asp:Parameter Name="CellPhone" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="IsReceived" Type="String" />
            <asp:Parameter Name="IsUse" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:RadProgressManager ID="RadProgressManager1" runat="server" />
    <asp:RadProgressArea ID="ProgressArea1" runat="server" Culture="vi-VN" DisplayCancelButton="True"
        HeaderText="Đang tải" Skin="Office2007" Style="position: fixed; top: 50% !important; left: 50% !important; margin: -93px 0 0 -188px;" />
</asp:Content>
