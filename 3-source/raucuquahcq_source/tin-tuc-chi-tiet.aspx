<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="tin-tuc-chi-tiet.aspx.cs" Inherits="gioi_thieu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ListView ID="lstNewDetail" runat="server" DataSourceID="odsNewDetail"
        EnableModelValidation="True">
        <ItemTemplate>
            <div class="wrap-main">
                <h1 class="main-title"><%# Eval("ProductName") %></h1>
                <div class="wrap-about">
                    <%# Eval("Content") %>
                </div>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <span runat="server" id="itemPlaceholder" />
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsNewDetail" runat="server" SelectMethod="ProductSelectOne"
        TypeName="TLLib.Product">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProductID" QueryStringField="tt" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

