<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="FrOrder.aspx.cs" Inherits="G322DinhVanThanhVeOnline.FrOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            height: 26px;
        }
        .auto-style5 {
            height: 24px;
        }
        .auto-style6 {
            height: 27px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>
                <asp:Label ID="lbTitle" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="Large" ForeColor="#FF5050" Text="TRANG THÔNG TIN ĐẶT VÉ"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lbtd1" runat="server" Font-Bold="True" ForeColor="#FF9900" Text="[1] THÔNG TIN KHÁCH HÀNG"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbtTimKH" runat="server" Text="Nhập mã số / Họ tên / Địa chỉ / Số điện thoại khách hàng cần tìm"></asp:Label>
                <asp:TextBox ID="txtTimKH" runat="server" Width="292px"></asp:TextBox>
                <asp:Button ID="btnTimKH" runat="server" OnClick="btnTimKH_Click" Text="Tìm " />
                <asp:Button ID="btnHuyTimKH" runat="server" Text="Hủy" OnClick="btnHuyTimKH_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:GridView ID="GridViewKH" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" Caption="CHỌN KHÁCH HÀNG" CellPadding="3" CellSpacing="2" DataKeyNames="masokhachhang" DataSourceID="SqlDataSourceKH" OnSelectedIndexChanged="GridViewKH_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masokhachhang" HeaderText="Mã số khách hàng" ReadOnly="True" SortExpression="masokhachhang" />
                        <asp:BoundField DataField="tenkhachhang" HeaderText="Họ tên khách hàng" SortExpression="tenkhachhang" />
                        <asp:BoundField DataField="diachi" HeaderText="Địa chỉ" SortExpression="diachi" />
                        <asp:BoundField DataField="sodienthoai" HeaderText="Số điện thoại" SortExpression="sodienthoai" />
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
                <asp:SqlDataSource ID="SqlDataSourceKH" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" InsertCommand="INSERT INTO KhachHang(masokhachhang, tenkhachhang, diachi, sodienthoai) VALUES (@masokhachhang, @tenkhachhang, @diachi, @sodienthoai)" SelectCommand="SELECT masokhachhang, tenkhachhang, diachi, sodienthoai FROM KhachHang WHERE (masokhachhang = @masokhachhang) OR (tenkhachhang = @tenkhachhang) OR (diachi = @diachi) OR (sodienthoai = @sodienthoai)">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtmskh" Name="masokhachhang" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txttenkh" Name="tenkhachhang" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtdc" Name="diachi" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtsdt" Name="sodienthoai" PropertyName="Text" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtTimKH" Name="masokhachhang" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtTimKH" Name="tenkhachhang" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTimKH" Name="diachi" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTimKH" Name="sodienthoai" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lbnhaptt" runat="server" Font-Bold="True" Text="NHẬP THÔNG TIN KHÁCH HÀNG MỚI" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lbmskh" runat="server" Text="Mã số khách hàng:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmskh" runat="server" Visible="False" Width="50px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbtenkh" runat="server" Text="Họ tên khách hàng:" Visible="False"></asp:Label>
                <asp:TextBox ID="txttenkh" runat="server" Visible="False" Width="197px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbdc" runat="server" Text="Địa chỉ khách hàng:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtdc" runat="server" Visible="False" Width="356px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbsdt" runat="server" Text="Số điện thoại khách hàng:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtsdt" runat="server" Visible="False" Width="201px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbtd2" runat="server" Font-Bold="True" ForeColor="#FF9900" Text="[2] THÔNG TIN ĐẶT VÉ" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbmasoddv" runat="server" Text="Mã số đơn đặt vé:" Visible="False"></asp:Label>
                <asp:Label ID="lbmsddv" runat="server" Visible="False"></asp:Label>
&nbsp;&nbsp;
                <asp:Label ID="lbngaydv" runat="server" Text="Ngày đặt vé:" Visible="False"></asp:Label>
                <asp:Label ID="lbndv" runat="server" Visible="False"></asp:Label>
&nbsp;&nbsp;
                <asp:Label ID="lbdcg" runat="server" Text="Địa chỉ giao:" Visible="False"></asp:Label>
&nbsp;<asp:TextBox ID="txtdcg" runat="server" Visible="False"></asp:TextBox>
&nbsp;&nbsp;
                <asp:Label ID="lbnguoinhan" runat="server" Text="Người nhận:" Visible="False"></asp:Label>
&nbsp;<asp:TextBox ID="txtnguoinhan" runat="server" Visible="False"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbsdtg" runat="server" Text="Số điện thoại:" Visible="False"></asp:Label>
&nbsp;<asp:TextBox ID="txtsdtg" runat="server" Visible="False" Height="25px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbgc" runat="server" Text="Ghi chú:" Visible="False"></asp:Label>
&nbsp;<asp:TextBox ID="txtgc" runat="server" Visible="False" Width="243px"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="btnAcceptDMV" runat="server" Text="Duyệt đơn đặt vé" Visible="False" OnClick="btnAcceptDMV_Click" />
                <asp:Button ID="btnHuyDMV" runat="server" Text="Hủy đơn đặt vé" Visible="False" OnClick="btnHuyDMV_Click" />
                <br />
                <asp:SqlDataSource ID="SqlDataSourceDDH" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" InsertCommand="INSERT INTO DonMuaVe(masodonmuave, ngaylap, masokhachhang, diachigiao, nguoinhan, sodienthoai, ghichu) VALUES (@masodonmuave, @ngaylap, @masokhachhang, @diachigiao, @nguoinhan, @sodienthoai, @ghichu)" SelectCommand="SELECT * FROM [DonMuaVe]">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="lbmsddv" Name="masodonmuave" PropertyName="Text" />
                        <asp:ControlParameter ControlID="lbndv" Name="ngaylap" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtmskh" Name="masokhachhang" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtdcg" Name="diachigiao" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtnguoinhan" Name="nguoinhan" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtsdt" Name="sodienthoai" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtgc" Name="ghichu" PropertyName="Text" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="lbtd3" runat="server" Font-Bold="True" ForeColor="#FF9900" Text="[3] THÔNG TIN CHI TIẾT VÉ ĐẶT MUA" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewCart" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Visible="False">
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
                <asp:SqlDataSource ID="SqlDataSourceCTDDH" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" InsertCommand="INSERT INTO ChiTietDonMuaVe(masodonmuave, masove, soluong) VALUES (@masodonmuave, @masove, @soluong)" ProviderName="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1.ProviderName %>"></asp:SqlDataSource>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbsum" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
