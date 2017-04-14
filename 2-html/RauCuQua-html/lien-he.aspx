<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="lien-he.aspx.cs" Inherits="lien_he" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Rau sạch</title>
    <meta name="description" content="Rau sạch" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="wrap-main">
        <h1 class="main-title">Liên hệ</h1>
        <div class="wrap-lienhe">
            <div class="img-lh">
                <img src="assets/images/lh.jpg" alt="" />
            </div>
            <div class="content-lh">
                <h1>thông tin liên hệ</h1>
                <ul>
                    <li><i class="fa fa-map-marker"></i>111 Tên Lửa, P.Bình Trị Đông, Q.Bình Tân</li>
                    <li><i class="fa fa-mobile"></i>08.3856.1489 - 0907 018 309</li>
                    <li><i class="fa fa-facebook-official"></i>www.facebook.com/raucusach.com</li>
                    <li><i class="fa fa-link"></i>www.raucusach.com</li>
                </ul>
                <p>Mọi ý kiến thắc mắc hay nhu cầu đặt hàng số lượng lớn cho căn tin, trường mầm non, nhà hàng... hãy liên hệ với chúng tôi</p>
                <div class="form-wrap">
                    <div class="form-group">
                        <label>Họ tên <span>*</span></label>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Email <span>*</span></label>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Điện thoại <span>*</span></label>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Nội dung <span>*</span></label>
                        <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <asp:Button ID="Button1" runat="server" Text="GỬI" /> 
                    <span class="note">*<i>Thông tin bắt buộc</i></span>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

