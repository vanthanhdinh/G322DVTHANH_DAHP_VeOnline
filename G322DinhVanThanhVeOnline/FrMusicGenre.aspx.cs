using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G322DinhVanThanhVeOnline
{
    public partial class FrMusicGenre : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownListTL_SelectedIndexChanged(sender, e);
        }

        protected void DropDownListTL_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnThem.Enabled = true;
            if (DropDownListTL.SelectedValue.ToString() == "*")
            {
                SqlDataSourceTL.SelectCommand = "SELECT * FROM [DanhMucTheLoai]";
            }
            lbmstl.Text = DropDownListTL.SelectedValue;
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            lbmasotheloai.Visible = !lbmasotheloai.Visible;
            lbtentheloai.Visible = !lbtentheloai.Visible;
            txtmasotheloai.Visible = !txtmasotheloai.Visible;
            txttentheloai.Visible = !txttentheloai.Visible;
            btnHuyThem.Visible = !btnHuyThem.Visible;
            if (btnThem.Text == "Thêm thể loại")
            {
                txtmasotheloai.Text = ""; 
                txttentheloai.Text = "";
                btnThem.Text = "Lưu thông tin";
            }
            else
            {
                try
                {
                    SqlDataSourceTL.Insert();
                    GridViewTL.DataBind();
                    this.Title = "Thêm thành công";
                }
                catch (System.Exception ex)
                {
                    this.Title = "Lỗi thêm điểm bán vé" + ex.Message;
                };
                btnThem.Text = "Thêm thể loại";
            }
        }

        protected void btnHuyThem_Click(object sender, EventArgs e)
        {
            lbmasotheloai.Visible = false;
            lbtentheloai.Visible = false;
            txtmasotheloai.Visible = false;
            txttentheloai.Visible = false;
            btnThem.Text = "Thêm thể loại";
        }
    }
}