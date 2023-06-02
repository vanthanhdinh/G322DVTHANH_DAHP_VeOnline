<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="G322DinhVanThanhVeOnline.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style3 {
        background-color: #FFF7E7;
    }
    .auto-style4 {
        width: 877px;
    }
    .auto-style5 {
        width: 67%;
            margin-top: 15px;
        }
        .auto-style6 {
            margin-bottom: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style5">
    <tr>
        <td class="auto-style4">
            <asp:TextBox ID="TextBox2" runat="server" BackColor="White" Width="720px" BorderStyle="Inset" CssClass="separator" Font-Bold="False" Font-Italic="False" Font-Names="Garamond" Font-Size="XX-Large" Font-Underline="False" ForeColor="#FF6600" Enabled="False">WELCOME TO MY TICKETS WEBSITE!</asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style4">
            <asp:Label ID="lbKQ" runat="server" CssClass="static highlighted" Font-Names="Verdana" Font-Size="Medium"></asp:Label>
            <asp:Button ID="btnCart" runat="server" Font-Bold="True" Font-Names="Verdana" OnClick="btnCart_Click" Text="Xem danh mục vé đặt" CssClass="auto-style6" />
        </td>
    </tr>
    <tr>
        <td class="auto-style4">
            <asp:DataList ID="DataListDMVe" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyField="masove" DataSourceID="SqlDataSourceDanhMucVe" GridLines="Both" Height="397px" RepeatColumns="3" RepeatDirection="Horizontal" Width="1306px" OnItemCommand="DataListDMVe_ItemCommand">
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <ItemTemplate>
                    Mã số vé:
                    <asp:Label ID="masoveLabel" runat="server" Text='<%# Eval("masove") %>' />
                    <br />
                    Tên vé:
                    <asp:Label ID="tenveLabel" runat="server" Text='<%# Eval("tenve") %>' />
                    <br />
                    <span class="auto-style3">Thời gian</span>:
                    <asp:Label ID="thoigianLabel" runat="server" Text='<%# Eval("thoigian") %>' />
                    <br />
                    Địa điểm:
                    <asp:Label ID="diadiemLabel" runat="server" Text='<%# Eval("diadiem") %>' />
                    <br />
                    Khu vực:
                    <asp:Label ID="khuvucLabel" runat="server" Text='<%# Eval("khuvuc") %>' />
                    <br />
                    Giá vé:
                    <asp:Label ID="giaLabel" runat="server" Text='<%# Eval("gia") %>' />
                    <br />
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("hinhanh") %>' />
                    <br />
                    Số lượng:<asp:TextBox ID="txtSL" runat="server" Height="24px" Width="24px">1</asp:TextBox>
                    &nbsp;<asp:Button ID="btnChon" runat="server" Height="32px" Text="Chọn mua" Width="82px" CommandName="chon" />
<br />
                </ItemTemplate>
                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSourceDanhMucVe" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" SelectCommand="SELECT * FROM [DanhMucVe]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="auto-style4">
            &nbsp;</td>
    </tr>
    </table>
</asp:Content>
