<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="FrCustumer.aspx.cs" Inherits="G322DinhVanThanhVeOnline.FrCustumer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>
                <table class="auto-style1">
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbdskh" runat="server" Font-Bold="True" Text="DANH SÁCH KHÁCH HÀNG"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridViewKH" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="masokhachhang" DataSourceID="SqlDataSourceKH">
                                <Columns>
                                    <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                                    <asp:BoundField DataField="masokhachhang" HeaderText="Mã số khách hàng" ReadOnly="True" SortExpression="masokhachhang" />
                                    <asp:BoundField DataField="tenkhachhang" HeaderText="Tên khách hàng" SortExpression="tenkhachhang" />
                                    <asp:BoundField DataField="diachi" HeaderText="Địa chỉ" SortExpression="diachi" />
                                    <asp:BoundField DataField="sodienthoai" HeaderText="Số điện thoại" SortExpression="sodienthoai" />
                                    <asp:CommandField DeleteText="Hủy khách hàng" ShowDeleteButton="True" />
                                    <asp:CommandField CancelText="Hủy" EditText="Sửa thông tin" ShowEditButton="True" UpdateText="Cập nhật thông tin" />
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
                            <asp:SqlDataSource ID="SqlDataSourceKH" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" DeleteCommand="DELETE FROM KhachHang WHERE (masokhachhang = @masokhachhang)" SelectCommand="SELECT * FROM [KhachHang]" UpdateCommand="UPDATE KhachHang SET tenkhachhang = @tenkhachhang, diachi = @diachi, sodienthoai = @sodienthoai WHERE (masokhachhang = @masokhachhang)"></asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
