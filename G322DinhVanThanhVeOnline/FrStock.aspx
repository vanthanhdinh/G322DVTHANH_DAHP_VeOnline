<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="FrStock.aspx.cs" Inherits="G322DinhVanThanhVeOnline.FrStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            width: 782px;
        }
        .auto-style6 {
            height: 26px;
        }
        .auto-style7 {
            height: 26px;
            width: 782px;
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
                <asp:Label ID="lbtenDBV" runat="server" Text="Điểm bán vé"></asp:Label>
                <asp:DropDownList ID="DropDownListDiemBanVe" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSourceDiemBanVe" DataTextField="tendiembanve" DataValueField="masodiembanve" OnSelectedIndexChanged="DropDownListDiemBanVe_SelectedIndexChanged" Width="437px">
                    <asp:ListItem Value="*">Tất cả</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceDiemBanVe" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" SelectCommand="SELECT * FROM [DiemBanVe]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Label ID="lbmasoDBV" runat="server" Text="Mã điểm bán vé:"></asp:Label>
                <asp:Label ID="lbmsdbv" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lbChonMoi" runat="server" Font-Bold="True" Text="Chọn vé tồn theo điểm bán:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Button ID="btnThem" runat="server" OnClick="btnThem_Click" Text="Thêm " />
&nbsp;
                <asp:Label ID="lbtenve" runat="server" Text="Tên vé" Visible="False"></asp:Label>
                <asp:DropDownList ID="DropDownListVe" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceVe" DataTextField="tenve" DataValueField="masove" Height="28px" OnSelectedIndexChanged="DropDownListVe_SelectedIndexChanged" Visible="False" Width="403px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceVe" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" SelectCommand="SELECT * FROM [DanhMucVe]"></asp:SqlDataSource>
&nbsp;
                <br />
            </td>
            <td class="auto-style6">
                <asp:Label ID="lbmsve" runat="server" Text="Mã số vé:" Visible="False"></asp:Label>
                <asp:Label ID="lbmsv" runat="server" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lbslt" runat="server" Text="Số lượng tồn" Visible="False"></asp:Label>
                <asp:TextBox ID="txtslt" runat="server" Visible="False" Width="91px"></asp:TextBox>
&nbsp;
                <asp:Button ID="btnHuythem" runat="server" OnClick="btnHuythem_Click" Text="Hủy" Visible="False" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridViewVeTon" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="masodiembanve,masove" DataSourceID="SqlDataSourceVeTon">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masodiembanve" HeaderText="Mã số điểm bán vé" SortExpression="masodiembanve" />
                        <asp:BoundField DataField="masove" HeaderText="Mã số vé" ReadOnly="True" SortExpression="masove" />
                        <asp:BoundField DataField="soluongton" HeaderText="Số lượng tồn" SortExpression="soluongton" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
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
                <asp:SqlDataSource ID="SqlDataSourceVeTon" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" DeleteCommand="DELETE FROM VeTon WHERE (masodiembanve = @masodiembanve) OR (masove = @masove)" InsertCommand="INSERT INTO VeTon(masodiembanve, masove, soluongton) VALUES (@masodiembanve, @masove, @soluongton)" SelectCommand="SELECT * FROM [VeTon] WHERE ([masodiembanve] = @masodiembanve)" UpdateCommand="UPDATE VeTon SET masodiembanve = @masodiembanve, soluongton = @soluongton WHERE  (masove = @masove)">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="DropDownListDiemBanVe" Name="masodiembanve" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownListVe" Name="masove" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="txtslt" Name="soluongton" PropertyName="Text" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListDiemBanVe" Name="masodiembanve" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridViewVeTon" Name="masodiembanve" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridViewVeTon" Name="soluongton" PropertyName="SelectedValue[3]" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:GridView ID="GridViewDanhMucVe" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" Caption="THÔNG TIN VÉ TỒN ĐANG CHỌN CÓ THÔNG TIN NHƯ SAU" CellPadding="3" CellSpacing="2" DataKeyNames="masove" DataSourceID="SqlDataSourceDanhMucVe">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masove" HeaderText="Mã số vé" ReadOnly="True" SortExpression="masove" />
                        <asp:BoundField DataField="tenve" HeaderText="Tên vé" SortExpression="tenve" />
                        <asp:BoundField DataField="masotheloai" HeaderText="Mã số thể loại" SortExpression="masotheloai" />
                        <asp:BoundField DataField="masonghesi" HeaderText="Mã số nghệ sĩ" SortExpression="masonghesi" />
                        <asp:TemplateField HeaderText="Hình ảnh" SortExpression="hinhanh">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("hinhanh") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("hinhanh") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="thoigian" HeaderText="Thời gian" SortExpression="thoigian" />
                        <asp:BoundField DataField="diadiem" HeaderText="Địa điểm" SortExpression="diadiem" />
                        <asp:BoundField DataField="khuvuc" HeaderText="Khu Vực" SortExpression="khuvuc" />
                        <asp:BoundField DataField="gia" HeaderText="Giá" SortExpression="gia" />
                        <asp:BoundField DataField="masoloaive" HeaderText="Mã số loại vé" SortExpression="masoloaive" />
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
                <asp:SqlDataSource ID="SqlDataSourceDanhMucVe" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" DeleteCommand="DELETE FROM DanhMucVe WHERE (masove = @masove)" SelectCommand="SELECT * FROM [DanhMucVe] WHERE ([masove] = @masove)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewVeTon" Name="masove" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:GridView ID="GridViewDBV" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" Caption="THÔNG TIN VÉ TỒN CÒN TỒN Ở CÁC ĐIỂM BÁN VÉ NHƯ SAU" CellPadding="3" CellSpacing="2" DataKeyNames="masodiembanve" DataSourceID="SqlDataSourceDBV" Height="210px" Width="591px">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masodiembanve" HeaderText="Mã số điểm bán vé" ReadOnly="True" SortExpression="masodiembanve" />
                        <asp:BoundField DataField="tendiembanve" HeaderText="Tên điểm bán vé" SortExpression="tendiembanve" />
                        <asp:BoundField DataField="diachi" HeaderText="Địa chỉ" SortExpression="diachi" />
                        <asp:BoundField DataField="soluong" HeaderText="Số lượng" SortExpression="soluong" />
                        <asp:BoundField DataField="masokhuvuc" HeaderText="Mã số khu vực" SortExpression="masokhuvuc" />
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
                <asp:SqlDataSource ID="SqlDataSourceDBV" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" DeleteCommand="DELETE FROM DiemBanVe WHERE (masodiembanve = @masodiembanve)" SelectCommand="SELECT * FROM [DiemBanVe] WHERE ([masodiembanve] = @masodiembanve)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewVeTon" Name="masodiembanve" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
