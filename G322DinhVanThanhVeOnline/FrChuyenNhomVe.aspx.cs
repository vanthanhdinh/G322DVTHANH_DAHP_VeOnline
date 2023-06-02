using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G322DinhVanThanhVeOnline
{
    public partial class FrChuyenNhomVe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownListS_SelectedIndexChanged(sender, e);
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\Managements.aspx");
        }

        protected void LR_Click(object sender, EventArgs e)
        {
            SqlDataSourceMHS.Update(); // gọi Update() bên Nguồn (S) đề chuyển  
            ListBoxS.DataBind();//Tải DL sau Update lên Source         
            ListBoxD.DataBind();//Tải DL sau Update lên Destinatio
        }

        protected void RL_Click(object sender, EventArgs e)
        {
            // CHUYỂN 1 MH TỪ NHÓM "ĐÍCH" SANG NHÓM "NGUỒN" : RIGHT to LEFT
                SqlDataSourceMHD.Update(); // gọi Update() bên Đích (D) đề chuyển  
                ListBoxS.DataBind();//Tải DL sau Update lên Source         
                ListBoxD.DataBind();//Tải DL sau Update lên Destination 
        }

        protected void ButtonLAR_Click(object sender, EventArgs e)
        {
            SqlDataSourceMHS.UpdateCommand = "UPDATE DanhMucVe SET masoloaive = @masoloaive WHERE masoloaive = @masoloaive";
            //Viết lại lệnh Update....không Where.. 
            SqlDataSourceMHS.UpdateParameters.Clear();  //Xóa các tham số cũ 
            SqlDataSourceMHS.UpdateParameters.Add("masoloaive", DropDownListD.SelectedValue.Trim());
            //Khai báo lại tham số cho Update...  
            SqlDataSourceMHS.UpdateParameters.Add("masoloaive", DropDownListS.SelectedValue.Trim());
            SqlDataSourceMHS.Update(); // gọi Update() bên Nguồn (S) đề chuyển  
            ListBoxS.DataBind();//Tải DL sau Update lên Source         
            ListBoxD.DataBind();//Tải DL sau Update lên Destination
        }

        protected void ButtonRAL_Click(object sender, EventArgs e)
        {
            SqlDataSourceMHD.UpdateCommand = "UPDATE DanhMucVe SET masoloaive = @masoloaive WHERE masoloaive = @masoloaive";
            //Viết lại lệnh Update....không Where.. 
            SqlDataSourceMHD.UpdateParameters.Clear();  //Xóa các tham số cũ 
            SqlDataSourceMHD.UpdateParameters.Add("masoloaive", DropDownListD.SelectedValue.Trim());
            //Khai báo lại tham số cho Update...  
            SqlDataSourceMHD.UpdateParameters.Add("masoloaive", DropDownListS.SelectedValue.Trim());
            SqlDataSourceMHD.Update(); // gọi Update() bên Nguồn (S) đề chuyển  
            ListBoxD.DataBind();//Tải DL sau Update lên Source         
            ListBoxS.DataBind();//Tải DL sau Update lên Destination
        }

        protected void DropDownListS_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownListS.SelectedValue.Trim() == DropDownListD.SelectedValue.Trim())
            // 2 Bên đã chọn giống nhau 
            {
                LR.Enabled = false;
                RL.Enabled = false;
                ButtonLAR.Enabled = false;
                ButtonRAL.Enabled = false;
                DropDownListS.ToolTip = DropDownListD.ToolTip = "HAI BÊN PHẢI KHÁC NHAU THÌ MỚI CHUYỂN ĐƯỢC";
            }
            else // 2 bên đã chọn KHÁC nhau 
            {
                LR.Enabled = true;
                RL.Enabled = true;
                ButtonLAR.Enabled = true;
                ButtonRAL.Enabled = true;
                DropDownListS.ToolTip = DropDownListD.ToolTip = "";
            }
        }

        protected void DropDownListD_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownListS.SelectedValue.Trim() == DropDownListD.SelectedValue.Trim())
            // 2 Bên đã chọn giống nhau 
            {
                LR.Enabled = false;
                RL.Enabled = false;
                ButtonLAR.Enabled = false;
                ButtonRAL.Enabled = false;
                DropDownListS.ToolTip = DropDownListD.ToolTip = "HAI BÊN PHẢI KHÁC NHAU THÌ MỚI CHUYỂN ĐƯỢC";
            }
            else // 2 bên đã chọn KHÁC nhau 
            {
                LR.Enabled = true;
                RL.Enabled = true;
                ButtonLAR.Enabled = true;
                ButtonRAL.Enabled = true;
                DropDownListS.ToolTip = DropDownListD.ToolTip = "";
            }
        }

    }
}