<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="FrDetailedPurchaseOrder.aspx.cs" Inherits="G322DinhVanThanhVeOnline.FrDetailedPurchaseOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbTitle" runat="server" Font-Bold="True" Text="DANH SÁCH CHI TIẾT ĐƠN"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnThem" runat="server" OnClick="btnThem_Click" Text="Thêm chi tiết" />
                <asp:Label ID="lbmsdmv" runat="server" Text="Mã số đơn mua vé" Visible="False"></asp:Label>
                <asp:TextBox ID="txtdmv" runat="server" Visible="False"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbmsv" runat="server" Text="Mã số vé" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmsv" runat="server" Visible="False"></asp:TextBox>
&nbsp;<asp:Label ID="lbsl" runat="server" Text="Số lượng" Visible="False"></asp:Label>
                <asp:TextBox ID="txtsl" runat="server" Visible="False"></asp:TextBox>
&nbsp;&nbsp;<asp:Button ID="btnHuyThem" runat="server" OnClick="btnHuyThem_Click" Text="Hủy" Visible="False" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewCTD" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="masodonmuave,masove" DataSourceID="SqlDataSourceCTD">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masodonmuave" HeaderText="Mã số đơn mua vé" ReadOnly="True" SortExpression="masodonmuave" />
                        <asp:BoundField DataField="masove" HeaderText="Mã số vé" ReadOnly="True" SortExpression="masove" />
                        <asp:BoundField DataField="soluong" HeaderText="Số lượng" SortExpression="soluong" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                        <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSourceCTD" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" DeleteCommand="DELETE FROM ChiTietDonMuaVe WHERE (masodonmuave = @masodonmuave)" InsertCommand="INSERT INTO ChiTietDonMuaVe(masodonmuave, masove, soluong) VALUES (@masodonmuave, @masove, @soluong)" SelectCommand="SELECT * FROM [ChiTietDonMuaVe]" UpdateCommand="UPDATE ChiTietDonMuaVe SET soluong = @soluong, masove = @masove WHERE (masodonmuave = @masodonmuave)">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtdmv" Name="masodonmuave" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtmsv" Name="masove" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtsl" Name="soluong" PropertyName="Text" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
