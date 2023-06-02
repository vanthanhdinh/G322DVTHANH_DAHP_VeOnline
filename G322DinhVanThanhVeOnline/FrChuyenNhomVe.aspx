<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="FrChuyenNhomVe.aspx.cs" Inherits="G322DinhVanThanhVeOnline.FrChuyenNhomVe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td colspan="3">
                <asp:Label ID="Label2" runat="server" Text="CHUYỂN CÁC MẶT HÀNG TỪ NHÓM NÀY SANG NHÓM KHÁC"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbnguon" runat="server" Text="Chọn nhóm nguồn (Sourse)"></asp:Label>
                <asp:DropDownList ID="DropDownListS" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceNGUON" DataTextField="tenloaive" DataValueField="masoloaive" OnSelectedIndexChanged="DropDownListS_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceNGUON" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" SelectCommand="SELECT * FROM [DanhMucLoaiVe]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceMHS" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" SelectCommand="SELECT * FROM [DanhMucVe]" UpdateCommand="UPDATE DanhMucVe SET masoloaive = @masoloaive WHERE (masove = @masove)">
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="DropDownListD" Name="masoloaive" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ListBoxS" Name="masove" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="lbdich" runat="server" Text="Chọn nhóm đích (Destination)"></asp:Label>
                <asp:DropDownList ID="DropDownListD" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceDICH" DataTextField="tenloaive" DataValueField="masoloaive" OnSelectedIndexChanged="DropDownListD_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceDICH" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" SelectCommand="SELECT * FROM [DanhMucLoaiVe]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceMHD" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" SelectCommand="SELECT * FROM [DanhMucVe]" UpdateCommand="UPDATE DanhMucVe SET masoloaive = @masoloaive WHERE (masove = @masove)">
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="DropDownListS" Name="masoloaive" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ListBoxD" Name="masove" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbdsnguon" runat="server" Text="Danh sách thuộc nhóm nguồn (Source)"></asp:Label>
                <br />
                <asp:ListBox ID="ListBoxS" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceBOXNGUON" DataTextField="tenve" DataValueField="masove"></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSourceBOXNGUON" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" SelectCommand="SELECT * FROM [DanhMucVe] WHERE ([masoloaive] = @masoloaive)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListS" Name="masoloaive" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:Button ID="LR" runat="server" OnClick="LR_Click" Text="&gt;" Width="43px" />
                <br />
                <asp:Button ID="RL" runat="server" OnClick="RL_Click" Text="&lt;" Width="43px" />
                <br />
                <br />
                <asp:Button ID="ButtonLAR" runat="server" OnClick="ButtonLAR_Click" Text="&gt;&gt;" Width="44px" />
                <br />
                <asp:Button ID="ButtonRAL" runat="server" OnClick="ButtonRAL_Click" Text="&lt;&lt;" Width="44px" />
            </td>
            <td>
                <asp:Label ID="lbdsdich" runat="server" Text="Danh sách thuộc nhóm đích (Destination)"></asp:Label>
                <br />
                <asp:ListBox ID="ListBoxD" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceBOXDICH" DataTextField="tenve" DataValueField="masove"></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSourceBOXDICH" runat="server" ConnectionString="<%$ ConnectionStrings:1G322DinhVanThanhVeOnlineConnectionString1 %>" SelectCommand="SELECT * FROM [DanhMucVe] WHERE ([masoloaive] = @masoloaive)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListD" Name="masoloaive" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Trở về Page trước" />
            </td>
        </tr>
    </table>
</asp:Content>
