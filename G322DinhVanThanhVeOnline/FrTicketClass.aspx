<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="FrTicketClass.aspx.cs" Inherits="G322DinhVanThanhVeOnline.FrTicketClass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            width: 807px;
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
                <asp:Label ID="lbloaive" runat="server" Text="Chọn loại vé:"></asp:Label>
                <asp:DropDownList ID="DropDownListLoaiVe" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSourceLoaiVe" DataTextField="tenloaive" DataValueField="masoloaive">
                    <asp:ListItem Value="*">Tất cả</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceLoaiVe" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" SelectCommand="SELECT * FROM [DanhMucLoaiVe]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Label ID="lbmasoloaive" runat="server" Text="Mã số loại vé:"></asp:Label>
                <asp:Label ID="lbmslv" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lbdmlv" runat="server" Font-Bold="True" Font-Size="Large" Text="Danh mục loại vé"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnThemLV" runat="server" OnClick="btnThemDBV_Click" Text="Thêm loại vé" Width="195px" />
&nbsp;
                <asp:Label ID="lbmsloaive" runat="server" Text="Mã số loại vé" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmsloaive" runat="server" Visible="False" Width="122px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbtenlv" runat="server" Text="Tên loại vé" Visible="False"></asp:Label>
                <asp:TextBox ID="txttenlv" runat="server" Visible="False" Width="122px"></asp:TextBox>
&nbsp;&nbsp;<asp:Label ID="lbmota" runat="server" Text="Mô tả" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmota" runat="server" Visible="False" Width="256px"></asp:TextBox>
&nbsp;&nbsp;<asp:Button ID="btnHuythem" runat="server" OnClick="btnHuythem_Click" Text="Hủy" Visible="False" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridViewLV" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="masoloaive" DataSourceID="SqlDataSourceLV">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masoloaive" HeaderText="Mã số loại vé" ReadOnly="True" SortExpression="masoloaive" />
                        <asp:BoundField DataField="tenloaive" HeaderText="Tên loại vé" SortExpression="tenloaive" />
                        <asp:BoundField DataField="mota" HeaderText="Mô tả" SortExpression="mota" />
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
                <asp:SqlDataSource ID="SqlDataSourceLV" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" DeleteCommand="DELETE FROM DanhMucLoaiVe WHERE (masoloaive = @masoloaive)" InsertCommand="INSERT INTO DanhMucLoaiVe(masoloaive, tenloaive, mota) VALUES (@masoloaive, @tenloaive, @mota)" SelectCommand="SELECT * FROM [DanhMucLoaiVe] WHERE ([masoloaive] = @masoloaive)" UpdateCommand="UPDATE DanhMucLoaiVe SET tenloaive = @tenloaive, mota = @mota WHERE (masoloaive = @masoloaive)">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtmsloaive" Name="masoloaive" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txttenlv" Name="tenloaive" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtmota" Name="mota" PropertyName="Text" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListLoaiVe" Name="masoloaive" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridViewVe" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" Caption="DANH SÁCH VÉ THEO LOẠI VÉ" CellPadding="3" CellSpacing="2" DataKeyNames="masove" DataSourceID="SqlDataSourceVe">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masove" HeaderText="Mã số vé" ReadOnly="True" SortExpression="masove" />
                        <asp:BoundField DataField="tenve" HeaderText="Tên vé" SortExpression="tenve" ReadOnly="True" />
                        <asp:BoundField DataField="masotheloai" HeaderText="Mã số thể loại" SortExpression="masotheloai" ReadOnly="True" />
                        <asp:BoundField DataField="masonghesi" HeaderText="Mã số nghệ sĩ" SortExpression="masonghesi" ReadOnly="True" />
                        <asp:TemplateField HeaderText="Hình ảnh" SortExpression="hinhanh">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("hinhanh") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("hinhanh") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="thoigian" HeaderText="Thời gian" SortExpression="thoigian" ReadOnly="True" />
                        <asp:BoundField DataField="diadiem" HeaderText="Địa điểm" SortExpression="diadiem" ReadOnly="True" />
                        <asp:BoundField DataField="khuvuc" HeaderText="Khu vực" SortExpression="khuvuc" ReadOnly="True" />
                        <asp:BoundField DataField="gia" HeaderText="Giá" SortExpression="gia" ReadOnly="True" />
                        <asp:BoundField DataField="masoloaive" HeaderText="Mã số loại vé" SortExpression="masoloaive" />
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
                <asp:SqlDataSource ID="SqlDataSourceVe" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" DeleteCommand="DELETE FROM DanhMucVe WHERE (masoloaive = @masoloaive)" SelectCommand="SELECT * FROM [DanhMucVe] WHERE ([masoloaive] = @masoloaive)" UpdateCommand="UPDATE DanhMucVe SET masoloaive = @masoloaive WHERE (masove = @masove)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewLV" Name="masoloaive" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
