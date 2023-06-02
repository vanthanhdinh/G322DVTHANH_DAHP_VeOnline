using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G322DinhVanThanhVeOnline
{
    public partial class FrTicketClass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownListLoaiVe_SelectedIndexChanged(sender, e);
        }

        protected void DropDownListLoaiVe_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnThemLV.Enabled = true;
            if (DropDownListLoaiVe.SelectedValue.ToString() == "*")
            {
                SqlDataSourceLV.SelectCommand = "SELECT * FROM [DanhMucLoaiVe]";
            }
            lbmslv.Text = DropDownListLoaiVe.SelectedValue;
        }

        protected void btnThemDBV_Click(object sender, EventArgs e)
        {
            lbmsloaive.Visible = !lbmsloaive.Visible;
            lbtenlv.Visible = !lbtenlv.Visible;
            lbmota.Visible = !lbmota.Visible;
            txtmsloaive.Visible = !txtmsloaive.Visible;
            txttenlv.Visible = !txttenlv.Visible;
            txtmota.Visible = !txtmota.Visible;
            btnHuythem.Visible = !btnHuythem.Visible;
            if (btnThemLV.Text == "Thêm loại vé")
            {
                txtmsloaive.Text = ""; txtmsloaive.ToolTip = "Nhập mã loại vé không được trùng";
                txttenlv.Text = "";
                txtmota.Text = "";
                btnThemLV.Text = "Lưu thông tin";
            }
            else
            {
                try
                {
                    SqlDataSourceLV.Insert();
                    GridViewLV.DataBind();
                    this.Title = "Thêm thành công";
                }
                catch (System.Exception ex)
                {
                    this.Title = "Lỗi thêm mới" + ex.Message;
                };
                btnThemLV.Text = "Thêm loại vé";
            }
        }

        protected void btnHuythem_Click(object sender, EventArgs e)
        {
            lbmsloaive.Visible = false;
            lbtenlv.Visible = false;
            lbmota.Visible = false;
            txtmsloaive.Visible = false;
            txttenlv.Visible = false;
            txtmota.Visible = false;
            btnHuythem.Visible = false;
            btnThemLV.Text = "Thêm loại vé";
        }
    }
}