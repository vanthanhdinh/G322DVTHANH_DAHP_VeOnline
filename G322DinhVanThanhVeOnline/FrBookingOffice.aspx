<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="FrBookingOffice.aspx.cs" Inherits="G322DinhVanThanhVeOnline.FrBookingOffice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbkhuvuc" runat="server" Text="Chọn khu vực:"></asp:Label>
                <asp:DropDownList ID="DropDownListKV" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSourceKhuVuc" DataTextField="tenkhuvuc" DataValueField="masokhuvuc" OnSelectedIndexChanged="DropDownListKV_SelectedIndexChanged">
                    <asp:ListItem Value="*">Tất cả</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceKhuVuc" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" SelectCommand="SELECT * FROM [KhuVuc]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Label ID="lbmasokv" runat="server" Text="Mã số khu vực:"></asp:Label>
                <asp:Label ID="lbmskv" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="Label2" runat="server" Text="DANH SÁCH ĐIỂM BÁN VÉ THEO KHU VỰC:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnThemDBV" runat="server" OnClick="btnThemDBV_Click" Text="Thêm điểm bán vé" Width="195px" />
&nbsp;
                <asp:Label ID="lbmsdbv" runat="server" Text="Mã số điểm bán vé" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmsdbv" runat="server" Visible="False" Width="122px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbtendbv" runat="server" Text="Tên điểm bán vé" Visible="False"></asp:Label>
                <asp:TextBox ID="txttendbv" runat="server" Visible="False" Width="122px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbdiachi" runat="server" Text="Địa chỉ" Visible="False"></asp:Label>
                <asp:TextBox ID="txtdiachi" runat="server" Visible="False" Width="471px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbsoluong" runat="server" Text="Số lượng" Visible="False"></asp:Label>
                <asp:TextBox ID="txtsoluong" runat="server" Visible="False" Width="43px"></asp:TextBox>
&nbsp;
                <asp:Button ID="btnHuythem" runat="server" OnClick="btnHuythem_Click" Text="Hủy" Visible="False" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridViewDBV" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="masodiembanve" DataSourceID="SqlDataSourceDBV">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masodiembanve" HeaderText="Mã số điểm bán vé" ReadOnly="True" SortExpression="masodiembanve" />
                        <asp:BoundField DataField="tendiembanve" HeaderText="Tên điểm bán vé" SortExpression="tendiembanve" />
                        <asp:BoundField DataField="diachi" HeaderText="Địa chỉ" SortExpression="diachi" />
                        <asp:BoundField DataField="soluong" HeaderText="Số lượng" ReadOnly="True" SortExpression="soluong" />
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
                <asp:SqlDataSource ID="SqlDataSourceDBV" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" DeleteCommand="DELETE FROM DiemBanVe WHERE (masodiembanve = @masodiembanve)" InsertCommand="INSERT INTO DiemBanVe(masodiembanve, tendiembanve, diachi, soluong, masokhuvuc) VALUES (@masodiembanve, @tendiembanve, @diachi, @soluong, @masokhuvuc)" SelectCommand="SELECT * FROM [DiemBanVe] WHERE ([masokhuvuc] = @masokhuvuc)" UpdateCommand="UPDATE DiemBanVe SET tendiembanve = @tendiembanve, diachi = @diachi WHERE (masodiembanve = @masodiembanve)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewDBV" Name="masodiembanve" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtmsdbv" Name="masodiembanve" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txttendbv" Name="tendiembanve" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtdiachi" Name="diachi" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtsoluong" Name="soluong" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownListKV" Name="masokhuvuc" PropertyName="SelectedValue" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListKV" Name="masokhuvuc" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridViewDBV" Name="tendiembanve" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="GridViewDBV" Name="diachi" PropertyName="SelectedValue[2]" />
                        <asp:ControlParameter ControlID="GridViewDBV" Name="masodiembanve" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewVeTon" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" Caption="THANH LÝ VÉ CÒN TỒN TẠI ĐIỂM BÁN VÉ" CellPadding="3" CellSpacing="2" DataKeyNames="masodiembanve,masove" DataSourceID="SqlDataSourceVeTon">
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
                <asp:SqlDataSource ID="SqlDataSourceVeTon" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" DeleteCommand="DELETE FROM VeTon WHERE (masodiembanve = @masodiembanve) AND (masove = @masove)" SelectCommand="SELECT * FROM [VeTon] WHERE ([masodiembanve] = @masodiembanve)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewVeTon" Name="masodiembanve" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="GridViewVeTon" Name="masove" PropertyName="SelectedValue[2]" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewDBV" Name="masodiembanve" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:GridView ID="GridViewKVDBV" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" Caption="ĐÓNG CỬA ĐIỂM BÁN VÉ TẠI KHU VỰC" CellPadding="3" CellSpacing="2" DataKeyNames="masokhuvuc" DataSourceID="SqlDataSourceKVDBV">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masokhuvuc" HeaderText="Mã số khu vực" ReadOnly="True" SortExpression="masokhuvuc" />
                        <asp:BoundField DataField="tenkhuvuc" HeaderText="Tên khu vực" SortExpression="tenkhuvuc" />
                        <asp:CommandField DeleteText="Đóng" ShowDeleteButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSourceKVDBV" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" DeleteCommand="DELETE FROM KhuVuc WHERE (masokhuvuc = @masokhuvuc)" SelectCommand="SELECT * FROM [KhuVuc] WHERE ([masokhuvuc] = @masokhuvuc)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewKVDBV" Name="masokhuvuc" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewDBV" Name="masokhuvuc" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
