<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="G322DinhVanThanhVeOnline.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style4 {
        height: 31px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
    <tr>
        <td class="auto-style4">
            <asp:Label ID="lbTitle" runat="server" Font-Bold="True" Font-Names="Cambria" Font-Size="Large"></asp:Label>
&nbsp;<asp:Button ID="btnShop" runat="server" Font-Names="Verdana" OnClick="btnShop_Click" Font-Bold="True" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="GridViewCart" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="masove" HeaderText="Mã vé" ReadOnly="True" />
                    <asp:BoundField DataField="tenve" HeaderText="Tên vé" ReadOnly="True" />
                    <asp:BoundField DataField="soluong" HeaderText="Số lượng" />
                    <asp:BoundField DataField="tien" HeaderText="Thành tiền" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lbSum" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="btnOrder" runat="server" Font-Names="Verdana" Text="Đặt mua" Font-Bold="True" OnClick="btnOrder_Click" />
&nbsp;<asp:Button ID="btnHome" runat="server" Font-Names="Verdana" Text="Về trang Homepage" OnClick="btnShop_Click" Font-Bold="True" />
&nbsp;<asp:Button ID="BtnCancel" runat="server" Font-Names="Verdana" Text="Hủy giỏ hàng" OnClick="BtnCancel_Click" Font-Bold="True" />
        </td>
    </tr>
</table>
</asp:Content>
