using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G322DinhVanThanhVeOnline
{
    public partial class FrArea : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownListKhuVuc_SelectedIndexChanged(sender, e);
        }

        protected void DropDownListKhuVuc_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnThemKV.Enabled = true;
            if (DropDownListKhuVuc.SelectedValue.ToString() == "*")
            {
                SqlDataSourceKhuVuc.SelectCommand = "SELECT * FROM [KhuVuc]";
            }
            lbmasokhuvuc.Text = DropDownListKhuVuc.SelectedValue;
        }

        protected void btnThemKV_Click(object sender, EventArgs e)
        {
            lbmskv.Visible = !lbmskv.Visible;
            lbtenkv.Visible = !lbtenkv.Visible;
            txtmskv.Visible = !txtmskv.Visible;
            txttenkv.Visible = !txttenkv.Visible;
            btnHuyThem.Visible = !btnHuyThem.Visible;
            if (btnThemKV.Text == "Thêm khu vực")
            {
                txtmskv.Text = ""; txtmskv.ToolTip = "";
                txttenkv.Text = "";
                btnThemKV.Text = "Lưu thông tin";
            }
            else
            {
                try
                {
                    SqlDataSourceKhuVuc.Insert();
                    GridViewKhuVuc.DataBind();
                    this.Title = "Thêm thành công";
                }
                catch (System.Exception ex)
                {
                    this.Title = "Lỗi thêm điểm khu vực" + ex.Message;
                };
                btnThemKV.Text = "Thêm khu vực";
            }
        }

        protected void btnHuyThem_Click(object sender, EventArgs e)
        {
            lbmskv.Visible = false;
            lbtenkv.Visible = false;
            txtmskv.Visible = false;
            txttenkv.Visible = false;
            btnHuyThem.Text = "Thêm khu vực";
            
        }
    }
}