using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G322DinhVanThanhVeOnline
{
    public partial class FrHumanResource : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownListKV_SelectedIndexChanged(sender, e); //gọi thủ tục 
        }

        protected void DropDownListKV_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnThemNV.Enabled = true;
            btnThemNV.ToolTip = DropDownListKV.ToolTip = ""; //đã chọn cụ thể nên kh nhắc thêm
            if(DropDownListKV.SelectedValue.ToString() == "*")
            {
                btnThemNV.Enabled = false;
                btnThemNV.ToolTip = DropDownListKV.ToolTip = "Chọn một khu vực cụ thể";
                SqlDataSourceNhanVien.SelectCommand = "SELECT * FROM [NhanVien]";
            }
            lbmskv.Text = DropDownListKV.SelectedValue;
            
        }

        protected void btnThemNV_Click(object sender, EventArgs e)
        {
            lbmanv.Visible = !lbmanv.Visible;
            lbhotennv.Visible = !lbhotennv.Visible;
            lbmacm.Visible = !lbmacm.Visible;
            txtmasocm.Visible = !txtmasocm.Visible;
            txtmasonhanvien.Visible = !txtmasonhanvien.Visible;
            txttennhanvien.Visible = !txttennhanvien.Visible;
            btnHuyThem.Visible = !btnHuyThem.Visible;
            if(btnThemNV.Text == "Thêm nhân viên")
            {
                txtmasonhanvien.Text = ""; txtmasonhanvien.ToolTip = "";
                txttennhanvien.Text = "";
                txtmasocm.Text = "";
                btnThemNV.Text = "Lưu thông tin nhân viên";
            }    
            else
            {
                try
                {
                    SqlDataSourceNhanVien.Insert();
                    GridViewNhanVien.DataBind();
                    this.Title = "Thêm nhân viên thành công";
                }
                catch (System.Exception ex) { this.Title = "Lỗi thêm nhân viên mới " + ex.Message; };
                btnThemNV.Text = "Thêm nhân viên";
            }
        }

        protected void btnHuyThem_Click(object sender, EventArgs e)
        {
            lbmanv.Visible = false;
            lbhotennv.Visible = false;
            lbmacm.Visible = false;
            txtmasocm.Visible = false;
            txtmasonhanvien.Visible = false;
            txttennhanvien.Visible = false;
            btnHuyThem.Visible = false;
            btnThemNV.Text = "Thêm nhân viên";
        }
    }
}