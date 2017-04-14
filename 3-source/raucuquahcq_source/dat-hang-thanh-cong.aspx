<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="dat-hang-thanh-cong.aspx.cs" Inherits="dat_hang_thanh_cong" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Rau sạch</title>
    <meta name="description" content="Rau sạch" />
    <style>
        .dhtc > img {
            width:455px;
            display:inline-block;
            vertical-align:top;
        }
        .dhtc > .wrap-dhtc {
            width:calc(100% - 463px);
            vertical-align:top;
            display:inline-block;
            padding-left:25px;
        }
        .dhtc > .wrap-dhtc .ma-don-hang {
            display:inline-block;
            padding:5px 15px;
            border:2px solid #8da72e;
            color:#8da72e;
        }
        @media screen and (max-width:991px) {
             .dhtc > img {
                 display:block;
                 margin:0 auto 20px;
                 max-width:100%;
            }
            .dhtc > .wrap-dhtc {
                width:100%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="wrap-main">
        <h1 class="main-title">Đặt hàng thành công</h1>
        <div class="dhtc">
            <img src="assets/images/dhtc.jpg" alt="" />
            <div class="wrap-dhtc">
                <p>Chào bạn Nguyễn Linh Đan</p>
                <p>Cảm ơn bạn đã đặt hàng tại Rau Củ Sạch</p>
                <p>Mã số đơn hàng của bạn <span class="ma-don-hang"><%= Session["OrderNumber"].ToString() %></span></p>
                <p>Bạn có thể xem lại chi tiết đơn hàng.</p>
                <p>Thời gian giao hàng vào 13/12/16 - Trước 10 giờ</p>
                <p>Thông tin chi tiết về đơn hàng đã được gửi đến địa chỉ email linhdan1002@gmail.com. Nếu không tìm thấy vui lòng kiểm tra hộp thư Spam hoặc Junk Folder</p>
                <p>Để việc xử lý giao hàng nhanh chóng, Rau Củ Sạch có thể sẽ không gọi điện thoại xác nhận đơn hàng. Hệ thống tự động xử lý và nhân viên giao hàng sẽ liên hệ trực tiếp với bạn.</p>
                <p>Mọi thắc mắc vui lòng liên hệ: (08) 3811 22 11</p>
            </div>
        </div>
    </div>
</asp:Content>

