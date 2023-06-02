<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="FrArea.aspx.cs" Inherits="G322DinhVanThanhVeOnline.FrArea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            height: 26px;
        }
        .auto-style5 {
            width: 784px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style5">
                <asp:Label ID="lbkhuvuc" runat="server" Text="Khu vực"></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownListKhuVuc" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSourceKV" DataTextField="tenkhuvuc" DataValueField="masokhuvuc" OnSelectedIndexChanged="DropDownListKhuVuc_SelectedIndexChanged">
                    <asp:ListItem Value="*">Tất cả</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceKV" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" SelectCommand="SELECT * FROM [KhuVuc]"></asp:SqlDataSource>
            </td>
        <td>
                <asp:Label ID="lbmasokv" runat="server" Text="Mã số khu vực:"></asp:Label>
                <asp:Label ID="lbmasokhuvuc" runat="server"></asp:Label>
            </td>
    </tr>
    <tr>
        <td colspan="2">
            Danh sách khu vực</td>
    </tr>
    <tr>
        <td class="auto-style4" colspan="2">
            <asp:Button ID="btnThemKV" runat="server" Text="Thêm khu vực" OnClick="btnThemKV_Click" />
            &nbsp;<asp:Label ID="lbmskv" runat="server" Text="Mã số khu vực" Visible="False"></asp:Label>
            <asp:TextBox ID="txtmskv" runat="server" Visible="False"></asp:TextBox>
&nbsp;&nbsp;
            <asp:Label ID="lbtenkv" runat="server" Text="Tên khu vực" Visible="False"></asp:Label>
            <asp:TextBox ID="txttenkv" runat="server" Visible="False"></asp:TextBox>
&nbsp;<asp:Button ID="btnHuyThem" runat="server" Text="Hủy" Visible="False" OnClick="btnHuyThem_Click" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
                <asp:GridView ID="GridViewKhuVuc" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="masokhuvuc" DataSourceID="SqlDataSourceKhuVuc">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masokhuvuc" HeaderText="Mã số khu vực" ReadOnly="True" SortExpression="masokhuvuc" />
                        <asp:BoundField DataField="tenkhuvuc" HeaderText="Tên khu vực" SortExpression="tenkhuvuc" />
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
                <asp:SqlDataSource ID="SqlDataSourceKhuVuc" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" DeleteCommand="DELETE FROM KhuVuc WHERE (masokhuvuc = @masokhuvuc)" InsertCommand="INSERT INTO KhuVuc(masokhuvuc, tenkhuvuc) VALUES (@masokhuvuc, @tenkhuvuc)" SelectCommand="SELECT * FROM [KhuVuc] WHERE ([masokhuvuc] = @masokhuvuc)" UpdateCommand="UPDATE KhuVuc SET tenkhuvuc = @tenkhuvuc WHERE (masokhuvuc = @masokhuvuc)">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtmskv" Name="masokhuvuc" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txttenkv" Name="tenkhuvuc" PropertyName="Text" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListKhuVuc" Name="masokhuvuc" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
    </tr>
    <tr>
        <td>
&nbsp;
                <asp:GridView ID="GridViewDBV" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" Caption="DANH SÁCH ĐIỂM BÁN VÉ THEO KHU VỰC" CellPadding="3" CellSpacing="2" DataKeyNames="masodiembanve" DataSourceID="SqlDataSourceDBV">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masodiembanve" HeaderText="Mã số điểm bán vé" ReadOnly="True" SortExpression="masodiembanve" />
                        <asp:BoundField DataField="tendiembanve" HeaderText="Tên điểm bán vé" SortExpression="tendiembanve" />
                        <asp:BoundField DataField="diachi" HeaderText="Địa chỉ" SortExpression="diachi" />
                        <asp:BoundField DataField="soluong" HeaderText="Số lượng" SortExpression="soluong" />
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
            <asp:SqlDataSource ID="SqlDataSourceDBV" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" DeleteCommand="DELETE FROM DiemBanVe WHERE (masokhuvuc = @masokhuvuc)" SelectCommand="SELECT * FROM [DiemBanVe] WHERE ([masokhuvuc] = @masokhuvuc)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewKhuVuc" Name="masokhuvuc" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            </td>
        <td>
                <asp:GridView ID="GridViewNV" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" Caption="DANH SÁCH NHÂN VIÊN THEO KHU VỰC" CellPadding="3" CellSpacing="2" DataKeyNames="masonhanvien" DataSourceID="SqlDataSourceNV">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masonhanvien" HeaderText="Mã số nhân viên" ReadOnly="True" SortExpression="masonhanvien" />
                        <asp:BoundField DataField="tennhanvien" HeaderText="Tên nhân viên" SortExpression="tennhanvien" ReadOnly="True" />
                        <asp:BoundField DataField="masocm" HeaderText="Mã số chứng minh" SortExpression="masocm" ReadOnly="True" />
                        <asp:BoundField DataField="masokhuvuc" HeaderText="Mã số khu vực" SortExpression="masokhuvuc" />
                        <asp:CommandField CancelText="Hủy" EditText="Chuyển nhân viên " ShowEditButton="True" UpdateText="Cập nhật" />
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
                <asp:SqlDataSource ID="SqlDataSourceNV" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" DeleteCommand="DELETE FROM NhanVien WHERE (masokhuvuc = @masokhuvuc)" SelectCommand="SELECT * FROM [NhanVien] WHERE ([masokhuvuc] = @masokhuvuc)" UpdateCommand="UPDATE NhanVien SET masokhuvuc = @masokhuvuc WHERE (masonhanvien = @masonhanvien)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewKhuVuc" Name="masokhuvuc" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
    </tr>
    <tr>
        <td colspan="2">
                <asp:GridView ID="GridViewDMV" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" Caption="DANH SÁCH ĐƠN MUA VÉ THEO KHU VỰC" CellPadding="3" CellSpacing="2" DataKeyNames="masodonmuave" DataSourceID="SqlDataSourceDMV">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masodonmuave" HeaderText="Mã số đơn mua vé" ReadOnly="True" SortExpression="masodonmuave" />
                        <asp:BoundField DataField="ngaylap" HeaderText="Ngày lập" SortExpression="ngaylap" ReadOnly="True" />
                        <asp:BoundField DataField="masokhachhang" HeaderText="Mã số khách hàng" SortExpression="masokhachhang" ReadOnly="True" />
                        <asp:BoundField DataField="masonhanvien" HeaderText="Mã số nhân viên giao" SortExpression="masonhanvien" ReadOnly="True" />
                        <asp:BoundField DataField="diachigiao" HeaderText="Địa chỉ giao" SortExpression="diachigiao" ReadOnly="True" />
                        <asp:BoundField DataField="nguoinhan" HeaderText="Người nhận" SortExpression="nguoinhan" ReadOnly="True" />
                        <asp:BoundField DataField="sodienthoai" HeaderText="Số điện thoại" SortExpression="sodienthoai" ReadOnly="True" />
                        <asp:BoundField DataField="ghichu" HeaderText="Ghi chú" SortExpression="ghichu" ReadOnly="True" />
                        <asp:BoundField DataField="masokhuvuc" HeaderText="Mã số khu vực" SortExpression="masokhuvuc" />
                        <asp:CommandField CancelText="Hủy" EditText="Chuyển đơn" ShowEditButton="True" UpdateText="Cập nhật" />
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
                <asp:SqlDataSource ID="SqlDataSourceDMV" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" DeleteCommand="DELETE FROM DonMuaVe WHERE (masokhuvuc = @masokhuvuc)" SelectCommand="SELECT * FROM [DonMuaVe] WHERE ([masokhuvuc] = @masokhuvuc)" UpdateCommand="UPDATE DonMuaVe SET masokhuvuc = @masokhuvuc WHERE (masodonmuave = @masodonmuave)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewKhuVuc" Name="masokhuvuc" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
    </tr>
</table>
</asp:Content>
