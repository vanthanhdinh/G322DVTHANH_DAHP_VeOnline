<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="FrTicketsManagements.aspx.cs" Inherits="G322DinhVanThanhVeOnline.FrTicketsManagements" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            width: 580px;
        }
        .auto-style5 {
            width: 580px;
            height: 72px;
        }
        .auto-style6 {
            height: 72px;
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
                <asp:Label ID="lbnhomve" runat="server" Text="Chọn loại vé"></asp:Label>
                <asp:DropDownList ID="DropDownListNhomMH" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSourceNhom" DataTextField="tenloaive" DataValueField="masoloaive" OnSelectedIndexChanged="DropDownListNhomMH_SelectedIndexChanged" Width="100px">
                    <asp:ListItem Value="*">Tất cả</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceNhom" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" SelectCommand="SELECT * FROM [DanhMucLoaiVe]"></asp:SqlDataSource>
            </td>
            <td class="auto-style6">
                <asp:Label ID="lbmasonhom" runat="server" Text="Mã loại vé:"></asp:Label>
                <asp:Label ID="lbmsnhom" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lbchonnhom" runat="server" Text="Chọn danh mục loại vé thuộc nhóm:" Font-Bold="True"></asp:Label>
                <asp:CheckBox ID="CheckBoxHinh" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBoxHinh_CheckedChanged" Text="Hiện thị mục hình" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnThem" runat="server" Enabled="False" OnClick="btnThem_Click" Text="Thêm vé mới" />
                <asp:Label ID="lbmasove" runat="server" Text="Mã số vé:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtmasove" runat="server" Visible="False" Width="30px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbtenve" runat="server" Text="Tên vé:" Visible="False"></asp:Label>
                <asp:TextBox ID="txttenve" runat="server" Visible="False" Width="247px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbtheloai" runat="server" Text="Thể loại:" Visible="False"></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownListTL" runat="server" DataSourceID="SqlDataSourceTL" DataTextField="tentheloai" DataValueField="masotheloai" Visible="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceTL" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" SelectCommand="SELECT * FROM [DanhMucTheLoai]"></asp:SqlDataSource>
&nbsp;<asp:Label ID="lbnghesi" runat="server" Text="Nghệ sĩ biểu diễn:" Visible="False"></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownListNS" runat="server" DataSourceID="SqlDataSourceNS" DataTextField="tennghesi" DataValueField="masonghesi" Visible="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceNS" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" SelectCommand="SELECT * FROM [DanhMucNgheSi]"></asp:SqlDataSource>
                <asp:Label ID="lbdiadiem" runat="server" Text="Địa điểm:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtdiadiem" runat="server" Visible="False" Width="394px"></asp:TextBox>
&nbsp;<br />
&nbsp;<asp:Label ID="lbkhuvuc" runat="server" Text="Khu vực:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtkhuvuc" runat="server" Visible="False" Width="44px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbgia" runat="server" Text="Giá vé:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtgia" runat="server" Visible="False" Width="100px"></asp:TextBox>
&nbsp;
                <asp:Label ID="lbhinhanh" runat="server" Text="Hình ảnh:" Visible="False"></asp:Label>
&nbsp;<asp:FileUpload ID="FileUploadhinhanh" runat="server" Visible="False" />
&nbsp;
                <asp:Label ID="lbthoigian" runat="server" Text="Thời gian:" Visible="False"></asp:Label>
                <asp:Calendar ID="Calendarthoigian" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True" Visible="False" Width="220px">
                    <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                    <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                    <OtherMonthDayStyle ForeColor="#CC9966" />
                    <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                    <SelectorStyle BackColor="#FFCC66" />
                    <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                    <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                </asp:Calendar>
                <asp:Button ID="btnHuy" runat="server" Text="Hủy" Visible="False" OnClick="btnHuy_Click" />
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridViewMH" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="masove" DataSourceID="SqlDataSourceMH" DataMember="DefaultView" OnRowCommand="GridViewMH_RowCommand" OnRowEditing="GridViewMH_RowEditing">
                    <Columns>
                        <asp:CommandField HeaderText="Chọn" SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masove" HeaderText="Mã số vé" ReadOnly="True" SortExpression="masove" />
                        <asp:BoundField DataField="tenve" HeaderText="Tên vé" SortExpression="tenve" />
                        <asp:BoundField DataField="masotheloai" HeaderText="Mã số thể loại" ReadOnly="True" SortExpression="masotheloai" />
                        <asp:BoundField DataField="masonghesi" HeaderText="Mã số nghệ sĩ" ReadOnly="True" SortExpression="masonghesi" />
                        <asp:TemplateField HeaderText="Hình ảnh" SortExpression="hinhanh" Visible="False">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("hinhanh") %>' Enabled="False" Height="16px" Width="121px"></asp:TextBox>
                                <asp:Button ID="btnHinh" runat="server" CommandName="select" Text="Chọn" />
                                <br />
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("hinhanh") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Thời gian" SortExpression="thoigian">
                            <EditItemTemplate>
                                <asp:Calendar ID="Calendar1" runat="server" SelectedDate='<%# Bind("thoigian") %>'></asp:Calendar>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("thoigian") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="diadiem" HeaderText="Địa điểm" SortExpression="diadiem" />
                        <asp:BoundField DataField="khuvuc" HeaderText="Khu vực" SortExpression="khuvuc" />
                        <asp:BoundField DataField="gia" HeaderText="Giá" SortExpression="gia" />
                        <asp:BoundField DataField="masoloaive" HeaderText="Mã số loại vé" ReadOnly="True" SortExpression="masoloaive" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" HeaderText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                        <asp:CommandField DeleteText="Xóa" HeaderText="Xóa" ShowDeleteButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSourceMH" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" InsertCommand="INSERT INTO DanhMucVe(masove, tenve, masotheloai, masonghesi, hinhanh, thoigian, diadiem, khuvuc, gia, masoloaive) VALUES (@masove, @tenve, @masotheloai, @masonghesi, @hinhanh, @thoigian, @diadiem, @khuvuc, @gia, @masoloaive)" SelectCommand="SELECT * FROM [DanhMucVe] WHERE ([masoloaive] = @masoloaive)" UpdateCommand="UPDATE DanhMucVe SET tenve = @tenve, masotheloai = @masotheloai, masonghesi = @masonghesi, hinhanh = @hinhanh, thoigian = @thoigian, diadiem = @diadiem, khuvuc = @khuvuc, gia = @gia WHERE (masove = @masove)" DeleteCommand="DELETE FROM DanhMucVe WHERE (masove = @masove)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewMH" Name="masove" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListNhomMH" Name="masoloaive" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridViewMH" Name="tenve" PropertyName="SelectedValue[2]" />
                        <asp:ControlParameter ControlID="GridViewMH" Name="masotheloai" PropertyName="SelectedValue[3]" />
                        <asp:ControlParameter ControlID="GridViewMH" Name="masonghesi" PropertyName="SelectedValue[4]" />
                        <asp:ControlParameter ControlID="GridViewMH" DbType="DateTime" Name="thoigian" PropertyName="SelectedValue[5]" />
                        <asp:ControlParameter ControlID="GridViewMH" Name="diadiem" PropertyName="SelectedValue[6]" />
                        <asp:ControlParameter ControlID="GridViewMH" Name="khuvuc" PropertyName="SelectedValue[7]" />
                        <asp:ControlParameter ControlID="GridViewMH" DbType="Double" Name="gia" PropertyName="SelectedValue[8]" />
                        <asp:ControlParameter ControlID="GridViewMH" Name="masove" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridViewMH" Name="hinhanh" PropertyName="SelectedValue[9]" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:GridView ID="GridViewVeTon" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" Caption="VÉ ĐANG CHỌN CÒN TỒN TẠI CÁC ĐIỂM BÁN VÉ VỚI SỐ LƯỢNG NHƯ SAU" CellPadding="3" CellSpacing="2" DataKeyNames="masodiembanve,masove" DataSourceID="SqlDataSourceVeTon">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masodiembanve" HeaderText="Mã điểm bán vé" ReadOnly="True" SortExpression="masodiembanve" />
                        <asp:BoundField DataField="masove" HeaderText="Mã số vé" ReadOnly="True" SortExpression="masove" />
                        <asp:BoundField DataField="soluongton" HeaderText="Số lượng tồn" SortExpression="soluongton" />
                        <asp:CommandField DeleteText="Thanh lý " ShowDeleteButton="True" />
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
                        <asp:ControlParameter ControlID="GridViewMH" Name="masove" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:GridView ID="GridViewCTDonMuaVe" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" Caption="VÉ ĐANG CHỌN CÒN ĐẶT MUA TRÊN CÁC ĐƠN HÀNG NHƯ SAU" CellPadding="3" CellSpacing="2" DataKeyNames="masodonmuave,masove" DataSourceID="SqlDataSourceCTDonMuaVe">
                    <Columns>
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:BoundField DataField="masodonmuave" HeaderText="Mã số đơn mua" ReadOnly="True" SortExpression="masodonmuave" />
                        <asp:BoundField DataField="masove" HeaderText="Mã số vé" SortExpression="masove" />
                        <asp:BoundField DataField="soluong" HeaderText="Số lượng" SortExpression="soluong" />
                        <asp:CommandField DeleteText="Hủy chi tiết đơn" ShowDeleteButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSourceCTDonMuaVe" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" DeleteCommand="DELETE FROM ChiTietDonMuaVe WHERE (masodonmuave = @masodonmuave) AND (masove = @masove)" SelectCommand="SELECT * FROM [ChiTietDonMuaVe] WHERE ([masove] = @masove)" UpdateCommand="UPDATE ChiTietDonMuaVe SET masove = @masove_new, soluong = @soluong WHERE (masove = @masove) AND (masodonmuave = @masodonmuave)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridViewCTDonMuaVe" Name="masodonmuave" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="GridViewCTDonMuaVe" Name="masove" PropertyName="SelectedValue[2]" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridViewMH" Name="masove" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridViewCTDonMuaVe" Name="masodonmuave" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="GridViewCTDonMuaVe" Name="masove" PropertyName="SelectedValue[2]" />
                        <asp:ControlParameter ControlID="GridViewCTDonMuaVe" Name="soluong" PropertyName="SelectedValue[3]" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
