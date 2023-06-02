<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="FrHumanResource.aspx.cs" Inherits="G322DinhVanThanhVeOnline.FrHumanResource" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            width: 756px;
        }
        .auto-style5 {
            height: 254px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lbchonkv" runat="server" Text="Chọn khu vực:"></asp:Label>
                <asp:DropDownList ID="DropDownListKV" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSourceKhuVuc" DataTextField="tenkhuvuc" DataValueField="masokhuvuc" OnSelectedIndexChanged="DropDownListKV_SelectedIndexChanged">
                    <asp:ListItem Selected="True" Value="*">Tất cả</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceKhuVuc" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" SelectCommand="SELECT * FROM [KhuVuc]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Label ID="lbmasokhuvuc" runat="server" Text="Mã số khu vực:"></asp:Label>
                <asp:Label ID="lbmskv" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="Label4" runat="server" Text="DANH SÁCH NHÂN VIÊN THEO KHU VỰC:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnThemNV" runat="server" OnClick="btnThemNV_Click" Text="Thêm nhân viên" />
                <asp:Label ID="lbmanv" runat="server" Text="Mã nhân viên" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmasonhanvien" runat="server" Visible="False"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbhotennv" runat="server" Text="Họ tên nhân viên" Visible="False"></asp:Label>
                <asp:TextBox ID="txttennhanvien" runat="server" Visible="False"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbmacm" runat="server" Text="Mã số chứng minh" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmasocm" runat="server" Visible="False"></asp:TextBox>
                <asp:Button ID="btnHuyThem" runat="server" OnClick="btnHuyThem_Click" Text="Hủy" Visible="False" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridViewNhanVien" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="masonhanvien" DataSourceID="SqlDataSourceNhanVien">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masonhanvien" HeaderText="Mã số nhân viên" ReadOnly="True" SortExpression="masonhanvien" />
                        <asp:BoundField DataField="tennhanvien" HeaderText="Tên nhân viên" SortExpression="tennhanvien" />
                        <asp:BoundField DataField="masocm" HeaderText="Mã số chứng minh" SortExpression="masocm" />
                        <asp:CommandField EditText="Sửa" ShowEditButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSourceNhanVien" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" DeleteCommand="DELETE FROM NhanVien WHERE (masonhanvien = @masonhanvien)" InsertCommand="INSERT INTO NhanVien(masonhanvien, tennhanvien, masocm, masokhuvuc) VALUES (@masonhanvien, @tennhanvien, @masocm, @masokhuvuc)" SelectCommand="SELECT * FROM [NhanVien] WHERE ([masokhuvuc] = @masokhuvuc)" UpdateCommand="UPDATE NhanVien SET tennhanvien = @tennhanvien, masocm = @masocm WHERE (masonhanvien = @masonhanvien)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewNhanVien" Name="masonhanvien" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtmasonhanvien" Name="masonhanvien" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txttennhanvien" Name="tennhanvien" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtmasocm" Name="masocm" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownListKV" Name="masokhuvuc" PropertyName="SelectedValue" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListKV" Name="masokhuvuc" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridViewNhanVien" Name="tennhanvien" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="GridViewNhanVien" Name="masocm" PropertyName="SelectedValue[2]" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <br />
                <asp:GridView ID="GridViewNhanVienDV" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="masodonmuave" DataSourceID="SqlDataSourceNhanVienDV">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masodonmuave" HeaderText="Mã số đơn mua vé" ReadOnly="True" SortExpression="masodonmuave" />
                        <asp:BoundField DataField="ngaylap" HeaderText="Ngày lập" ReadOnly="True" SortExpression="ngaylap" />
                        <asp:BoundField DataField="masokhachhang" HeaderText="Mã số khách hàng" ReadOnly="True" SortExpression="masokhachhang" />
                        <asp:TemplateField HeaderText="Mã số nhân viên" SortExpression="masonhanvien">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("masonhanvien") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("masonhanvien") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="diachigiao" HeaderText="Địa chỉ giao" ReadOnly="True" SortExpression="diachigiao" />
                        <asp:BoundField DataField="nguoinhan" HeaderText="Người nhận" ReadOnly="True" SortExpression="nguoinhan" />
                        <asp:BoundField DataField="sodienthoai" HeaderText="Số điện thoại" ReadOnly="True" SortExpression="sodienthoai" />
                        <asp:BoundField DataField="ghichu" HeaderText="Ghi chú" SortExpression="ghichu" />
                        <asp:CommandField EditText="Chuyển giao đơn" ShowEditButton="True" CancelText="Hủy" UpdateText="Cập nhật" />
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
                <asp:SqlDataSource ID="SqlDataSourceNhanVienDV" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" DeleteCommand="DELETE FROM DonMuaVe WHERE (masodonmuave = @masodonmuave)" SelectCommand="SELECT * FROM [DonMuaVe] WHERE ([masokhuvuc] = @masokhuvuc)" UpdateCommand="UPDATE DonMuaVe SET masonhanvien = @masonhanvien, ghichu = @ghichu WHERE (masodonmuave = @masodonmuave)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewNhanVienDV" Name="masodonmuave" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListKV" Name="masokhuvuc" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridViewNhanVienDV" Name="masonhanvien" PropertyName="SelectedValue[4]" />
                        <asp:ControlParameter ControlID="GridViewNhanVienDV" Name="ghichu" PropertyName="SelectedValue[8]" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td class="auto-style5">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridViewCTDonMuaVe" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="masodonmuave,masove" DataSourceID="SqlDataSourceCTDonMua">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masodonmuave" HeaderText="Mã số đơn mua vé" ReadOnly="True" SortExpression="masodonmuave" />
                        <asp:BoundField DataField="masove" HeaderText="Mã số vé" ReadOnly="True" SortExpression="masove" />
                        <asp:BoundField DataField="soluong" HeaderText="Số lượng" SortExpression="soluong" />
                        <asp:CommandField EditText="Sửa" ShowEditButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSourceCTDonMua" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" DeleteCommand="DELETE FROM ChiTietDonMuaVe WHERE (masodonmuave = @masodonmuave) AND (masove = @masove)" SelectCommand="SELECT * FROM [ChiTietDonMuaVe] WHERE ([masodonmuave] = @masodonmuave)">
                    <DeleteParameters>
                        <asp:ControlParameter Name="masodonmuave" />
                        <asp:Parameter Name="masove" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewNhanVienDV" Name="masodonmuave" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
