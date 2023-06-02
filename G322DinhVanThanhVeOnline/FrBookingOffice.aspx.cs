using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G322DinhVanThanhVeOnline
{
    public partial class FrBookingOffice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownListKV_SelectedIndexChanged(sender, e);
        }

        protected void DropDownListKV_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnThemDBV.Enabled = true;
            btnThemDBV.ToolTip = DropDownListKV.ToolTip = "";
            if (DropDownListKV.SelectedValue.ToString() == "*")
            {
                btnThemDBV.Enabled = false;
                btnThemDBV.ToolTip = DropDownListKV.ToolTip = "Chọn một khu vực cụ thể";
                SqlDataSourceDBV.SelectCommand = "SELECT * FROM [DiemBanVe]";
            }
            lbmskv.Text = DropDownListKV.SelectedValue;
        }

        protected void btnThemDBV_Click(object sender, EventArgs e)
        {
            lbmsdbv.Visible = !lbmsdbv.Visible;
            lbtendbv.Visible = !lbtendbv.Visible;
            lbdiachi.Visible = !lbdiachi.Visible;
            lbsoluong.Visible = !lbsoluong.Visible;
            txtmsdbv.Visible = !txtmsdbv.Visible;
            txttendbv.Visible = !txttendbv.Visible;
            txtdiachi.Visible = !txtdiachi.Visible;
            txtsoluong.Visible = !txtsoluong.Visible;
            btnHuythem.Visible = !btnHuythem.Visible;
            if( btnThemDBV.Text == "Thêm điểm bán vé")
            {
                txtmsdbv.Text = ""; txtmsdbv.ToolTip = "";
                txttendbv.Text = "";
                txtdiachi.Text = "";
                txtsoluong.Text = "";
                btnThemDBV.Text = "Lưu thông tin";
            }
            else 
            {
                try 
                {
                    SqlDataSourceDBV.Insert();
                    GridViewDBV.DataBind();
                    this.Title = "Thêm điểm bán vé thành công";
                }
                catch(System.Exception ex)
                {
                    this.Title = "Lỗi thêm điểm bán vé" + ex.Message;
                };
                btnThemDBV.Text = "Thêm điểm bán vé";
            }
        }

        protected void btnHuythem_Click(object sender, EventArgs e)
        {
            lbmsdbv.Visible = false;
            lbtendbv.Visible = false;
            lbdiachi.Visible = false;
            lbsoluong.Visible = false;
            txtmsdbv.Visible = false;
            txttendbv.Visible = false;
            txtdiachi.Visible = false;
            txtsoluong.Visible = false;
            btnHuythem.Visible = false;
            btnThemDBV.Text = "Thêm điểm bán vé";
        }

       
    }
}