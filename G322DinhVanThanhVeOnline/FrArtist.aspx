<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="FrArtist.aspx.cs" Inherits="G322DinhVanThanhVeOnline.FrArtist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            width: 388px;
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
                <asp:Label ID="lbnghesibieudien" runat="server" Text="Nghệ sĩ biểu diễn"></asp:Label>
                <asp:DropDownList ID="DropDownListNS" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSourceNgheSi" DataTextField="tennghesi" DataValueField="masonghesi" OnSelectedIndexChanged="DropDownListNS_SelectedIndexChanged">
                    <asp:ListItem Value="*">Tất cả</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceNgheSi" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" SelectCommand="SELECT * FROM [DanhMucNgheSi]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Label ID="lbmasonghesi" runat="server" Text="Mã số nghệ sĩ:"></asp:Label>
                <asp:Label ID="lbmsns" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lbTt" runat="server" Text="Danh sách nghệ sĩ"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnThemNS" runat="server" Text="Thêm nghệ sĩ" OnClick="btnThemNS_Click" />
                &nbsp;
                <asp:Label ID="lbmsnsbd" runat="server" Text="Mã số nghệ sĩ" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmsnsbd" runat="server" Visible="False"></asp:TextBox>
&nbsp;&nbsp;
                <asp:Label ID="lbns" runat="server" Text="Nghệ sĩ biểu diễn" Visible="False"></asp:Label>
                <asp:TextBox ID="txtns" runat="server" Visible="False"></asp:TextBox>
&nbsp;<asp:Button ID="btnHuyThem" runat="server" Text="Hủy" Visible="False" OnClick="btnHuyThem_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridViewNS" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="masonghesi" DataSourceID="SqlDataSourceNS">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masonghesi" HeaderText="Mã số nghệ sĩ" ReadOnly="True" SortExpression="masonghesi" />
                        <asp:BoundField DataField="tennghesi" HeaderText="Tên nghệ sĩ" SortExpression="tennghesi" />
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
                <asp:SqlDataSource ID="SqlDataSourceNS" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" DeleteCommand="DELETE FROM DanhMucNgheSi WHERE (masonghesi = @masonghesi)" InsertCommand="INSERT INTO DanhMucNgheSi(masonghesi, tennghesi) VALUES (@masonghesi, @tennghesi)" SelectCommand="SELECT * FROM [DanhMucNgheSi] WHERE ([masonghesi] = @masonghesi)" UpdateCommand="UPDATE DanhMucNgheSi SET tennghesi = @tennghesi WHERE (masonghesi = @masonghesi)">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtns" Name="masonghesi" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtmsnsbd" Name="tennghesi" PropertyName="Text" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListNS" Name="masonghesi" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridViewNS" Name="tennghesi" PropertyName="SelectedValue[2]" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
&nbsp;
                </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridViewVe" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" Caption="DANH SÁCH VÉ THEO NGHỆ SĨ" CellPadding="3" CellSpacing="2" DataKeyNames="masove" DataSourceID="SqlDataSourceVe">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masove" HeaderText="Mã số vé" ReadOnly="True" SortExpression="masove" />
                        <asp:BoundField DataField="tenve" HeaderText="Tên vé" SortExpression="tenve" ReadOnly="True" />
                        <asp:BoundField DataField="masotheloai" HeaderText="Mã số thể loại" SortExpression="masotheloai" ReadOnly="True" />
<asp:BoundField DataField="masonghesi" HeaderText="Mã số nghệ sĩ" SortExpression="masonghesi"></asp:BoundField>
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
                        <asp:BoundField DataField="masoloaive" HeaderText="Mã số loại vé" SortExpression="masoloaive" ReadOnly="True" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                        <asp:CommandField DeleteText="Hủy buổi biểu diễn" ShowDeleteButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSourceVe" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" DeleteCommand="DELETE FROM DanhMucVe WHERE (masove = @masove)" SelectCommand="SELECT * FROM [DanhMucVe] WHERE ([masonghesi] = @masonghesi)" UpdateCommand="UPDATE DanhMucVe SET masonghesi = @masonghesi WHERE (masove = @masove)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewNS" Name="masonghesi" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:GridView ID="GridViewVeMua" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" Caption="VÉ ĐANG CHỌN CÒN ĐANG ĐẶT MUA NHƯ SAU:" CellPadding="3" CellSpacing="2" DataKeyNames="masodonmuave,masove" DataSourceID="SqlDataSourceVeMua">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masodonmuave" HeaderText="Mã số đơn mua vé" ReadOnly="True" SortExpression="masodonmuave" />
                        <asp:BoundField DataField="masove" HeaderText="Mã số vé" ReadOnly="True" SortExpression="masove" />
                        <asp:BoundField DataField="soluong" HeaderText="Số lượng" SortExpression="soluong" />
                        <asp:CommandField DeleteText="Hủy đơn" ShowDeleteButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSourceVeMua" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" DeleteCommand="DELETE FROM ChiTietDonMuaVe WHERE (masodonmuave = @masodonmuave) AND (masove = @masove)" SelectCommand="SELECT * FROM [ChiTietDonMuaVe] WHERE ([masove] = @masove)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewVeMua" Name="masodonmuave" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="GridViewVeMua" Name="masove" PropertyName="SelectedValue[2]" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewVe" Name="masove" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
            <td>
                <asp:GridView ID="GridViewVeTon" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" Caption="VÉ ĐANG CHỌN CÒN ĐANG TỒN NHƯ SAU:" CellPadding="3" CellSpacing="2" DataKeyNames="masodiembanve,masove" DataSourceID="SqlDataSourceVeTon">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masodiembanve" HeaderText="Mã số điểm bán vé" ReadOnly="True" SortExpression="masodiembanve" />
                        <asp:BoundField DataField="masove" HeaderText="Mã số vé" ReadOnly="True" SortExpression="masove" />
                        <asp:BoundField DataField="soluongton" HeaderText="Số lượng tồn" SortExpression="soluongton" />
                        <asp:CommandField DeleteText="Thanh lý" ShowDeleteButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSourceVeTon" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" DeleteCommand="DELETE FROM VeTon WHERE (masodiembanve = @masodiembanve) AND (masove = @masove)" SelectCommand="SELECT * FROM [VeTon] WHERE ([masove] = @masove)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewVeTon" Name="masodiembanve" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="GridViewVeTon" Name="masove" PropertyName="SelectedValue[2]" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewVe" Name="masove" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
        </tr>
    </table>
</asp:Content>
