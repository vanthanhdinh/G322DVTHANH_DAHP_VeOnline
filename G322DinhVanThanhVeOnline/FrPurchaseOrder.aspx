<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="FrPurchaseOrder.aspx.cs" Inherits="G322DinhVanThanhVeOnline.FrPurchaseOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewDDH" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="masodonmuave" DataSourceID="SqlDataSourceDDH">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masodonmuave" HeaderText="Mã số đơn mua vé" ReadOnly="True" SortExpression="masodonmuave" />
                        <asp:BoundField DataField="ngaylap" HeaderText="Ngày lập" SortExpression="ngaylap" />
                        <asp:BoundField DataField="masokhachhang" HeaderText="Mã số khách hàng" SortExpression="masokhachhang" />
                        <asp:BoundField DataField="masonhanvien" HeaderText="Mã số nhân viên" SortExpression="masonhanvien" />
                        <asp:BoundField DataField="diachigiao" HeaderText="Địa chỉ giao" SortExpression="diachigiao" />
                        <asp:BoundField DataField="nguoinhan" HeaderText="Người nhận" SortExpression="nguoinhan" />
                        <asp:BoundField DataField="sodienthoai" HeaderText="Số điện thoại" SortExpression="sodienthoai" />
                        <asp:BoundField DataField="ghichu" HeaderText="Ghi chú" SortExpression="ghichu" />
                        <asp:BoundField DataField="masokhuvuc" HeaderText="Mã số khu vực" SortExpression="masokhuvuc" />
                        <asp:CommandField DeleteText="Hủy đơn" ShowDeleteButton="True"></asp:CommandField>
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
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
                <asp:SqlDataSource ID="SqlDataSourceDDH" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" DeleteCommand="DELETE FROM DonMuaVe WHERE (masodonmuave = @masodonmuave)" SelectCommand="SELECT * FROM [DonMuaVe]" UpdateCommand="UPDATE DonMuaVe SET ngaylap = @ngaylap, masokhachhang = @masokhachhang, masonhanvien = @masonhanvien, diachigiao = @diachigiao, nguoinhan = @nguoinhan, sodienthoai = @sodienthoai, ghichu = @ghichu, masokhuvuc = @masokhuvuc WHERE (masodonmuave = @masodonmuave)"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
