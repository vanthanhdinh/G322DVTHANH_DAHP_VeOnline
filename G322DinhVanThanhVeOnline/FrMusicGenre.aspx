<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="FrMusicGenre.aspx.cs" Inherits="G322DinhVanThanhVeOnline.FrMusicGenre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            width: 749px;
            height: 23px;
        }
        .auto-style5 {
            height: 23px;
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
                <asp:Label ID="lbtentl" runat="server" Text="Tên thể loại"></asp:Label>
                <asp:DropDownList ID="DropDownListTL" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSourceTheLoai" DataTextField="tentheloai" DataValueField="masotheloai" OnSelectedIndexChanged="DropDownListTL_SelectedIndexChanged">
                    <asp:ListItem Value="*">Tất cả</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceTheLoai" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" SelectCommand="SELECT * FROM [DanhMucTheLoai]"></asp:SqlDataSource>
            </td>
            <td class="auto-style5">
                <asp:Label ID="lbmasotl" runat="server" Text="Mã số thể loại:"></asp:Label>
                <asp:Label ID="lbmstl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="Large" Text="Danh sách thể loại"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnThem" runat="server" OnClick="btnThem_Click" Text="Thêm thể loại" />
                <asp:Label ID="lbmasotheloai" runat="server" Text="Mã số thể loại" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmasotheloai" runat="server" Visible="False"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbtentheloai" runat="server" Text="Tên thể loại" Visible="False"></asp:Label>
                <asp:TextBox ID="txttentheloai" runat="server" Visible="False"></asp:TextBox>
&nbsp;<asp:Button ID="btnHuyThem" runat="server" OnClick="btnHuyThem_Click" Text="Hủy" Visible="False" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
&nbsp;&nbsp;
                <asp:GridView ID="GridViewTL" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="masotheloai" DataSourceID="SqlDataSourceTL">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masotheloai" HeaderText="Mã số thể loại" ReadOnly="True" SortExpression="masotheloai" />
                        <asp:BoundField DataField="tentheloai" HeaderText="Tên thể loại" SortExpression="tentheloai" />
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
                <asp:SqlDataSource ID="SqlDataSourceTL" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" DeleteCommand="DELETE FROM DanhMucTheLoai WHERE (masotheloai = @masotheloai)" InsertCommand="INSERT INTO DanhMucTheLoai(masotheloai, tentheloai) VALUES (@masotheloai, @tentheloai)" SelectCommand="SELECT * FROM [DanhMucTheLoai] WHERE ([masotheloai] = @masotheloai)" UpdateCommand="UPDATE DanhMucTheLoai SET tentheloai = @tentheloai WHERE (masotheloai = @masotheloai)">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtmasotheloai" Name="masotheloai" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txttentheloai" Name="tentheloai" PropertyName="Text" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListTL" Name="masotheloai" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridViewVe" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="masove" DataSourceID="SqlDataSourceVe">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masove" HeaderText="Mã số vé" ReadOnly="True" SortExpression="masove" />
                        <asp:BoundField DataField="tenve" HeaderText="Tên vé" ReadOnly="True" SortExpression="tenve" />
                        <asp:BoundField DataField="masotheloai" HeaderText="Mã số thể loại" SortExpression="masotheloai" />
                        <asp:BoundField DataField="masonghesi" HeaderText="Mã số nghệ sĩ" ReadOnly="True" SortExpression="masonghesi" />
                        <asp:TemplateField HeaderText="Hình ảnh" SortExpression="hinhanh">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("hinhanh") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("hinhanh") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="thoigian" HeaderText="Thời gian" ReadOnly="True" SortExpression="thoigian" />
                        <asp:BoundField DataField="diadiem" HeaderText="Địa điểm" ReadOnly="True" SortExpression="diadiem" />
                        <asp:BoundField DataField="khuvuc" HeaderText="Khu vực" ReadOnly="True" SortExpression="khuvuc" />
                        <asp:BoundField DataField="gia" HeaderText="Giá" ReadOnly="True" SortExpression="gia" />
                        <asp:BoundField DataField="masoloaive" HeaderText="Mã số thể loại" ReadOnly="True" SortExpression="masoloaive" />
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
                <asp:SqlDataSource ID="SqlDataSourceVe" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" SelectCommand="SELECT * FROM [DanhMucVe] WHERE ([masotheloai] = @masotheloai)" UpdateCommand="UPDATE DanhMucVe SET masotheloai = @masotheloai WHERE (masove = @masove)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewTL" Name="masotheloai" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
        </tr>
    </table>
</asp:Content>
