<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Managements.aspx.cs" Inherits="G322DinhVanThanhVeOnline.Managements" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            margin-left: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    <table class="auto-style1">
        <tr>
            <td>
                <asp:Label ID="lbTitle" runat="server" Text="ĐÂY LÀ TRANG QUẢN LÝ CHÍNH: TỪ ĐÂY CHỌN CÁC CHỨC NĂNG QUẢN LÝ CỤ THỂ KHÁC"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbBan" runat="server" Text="1. CÁC CHỨC NĂNG QUẢN LÝ BÊN: BÁN"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="BtnVe" runat="server" Text="Quản lý vé" OnClick="BtnVe_Click" />
                <asp:Button ID="btnNv" runat="server" Text="Quản lý nhân viên" OnClick="btnNv_Click" />
                <asp:Button ID="BtnDbv" runat="server" Text="Quản lý điểm bán vé" OnClick="BtnDbv_Click" />
                <asp:Button ID="btnKv" runat="server" Text="Quản lý khu vực" OnClick="btnKv_Click" />
                <asp:Button ID="btnNs" runat="server" Text="Quản lý nghệ sĩ" OnClick="btnNs_Click" />
                <asp:Button ID="btnTl" runat="server" Text="Quản lý thể loại" OnClick="btnTl_Click" />
                <asp:Button ID="btnNhomve" runat="server" Text="Quản lý nhóm vé" OnClick="btnNhomve_Click" />
                <asp:Button ID="btnTon" runat="server" Text="Quản lý vé tồn" OnClick="btnTon_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbMua" runat="server" Text="2. CÁC CHỨC NĂNG QUẢN LÝ BÊN: MUA"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnKh" runat="server" Text="Quản lý khách hàng" OnClick="btnKh_Click" />
                <asp:Button ID="btnDmv" runat="server" Text="Quản lý đơn mua vé" OnClick="btnDmv_Click" />
                <asp:Button ID="btnCtdmv" runat="server" Text="Quản lý chi tiết đơn mua vé" OnClick="btnCtdmv_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbThongke" runat="server" Text="3. CÁC CHỨC NĂNG THỐNG KÊ"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnBc" runat="server" Text="Báo cáo kinh doanh" />
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lbChuyennhom" runat="server" Text="4. CÁC CHỨC NĂNG CHUYỂN NHÓM"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Button ID="btnCnv" runat="server" OnClick="btnCnv_Click" Text="Chuyển nhóm vé" />
            </td>
        </tr>
    </table>
</p>
</asp:Content>
