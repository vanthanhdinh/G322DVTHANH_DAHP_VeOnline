using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G322DinhVanThanhVeOnline
{
    public partial class FrArtist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownListNS_SelectedIndexChanged(sender, e);
        }

        protected void DropDownListNS_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnThemNS.Enabled = true;
            if (DropDownListNS.SelectedValue.ToString() == "*")
            {
                SqlDataSourceNS.SelectCommand = "SELECT * FROM [DanhMucNgheSi]";
            }
            lbmsns.Text = DropDownListNS.SelectedValue;
        }

        protected void btnThemNS_Click(object sender, EventArgs e)
        {
            lbmsnsbd.Visible = !lbmsnsbd.Visible;
            lbns.Visible = !lbns.Visible;
            txtmsnsbd.Visible = !txtmsnsbd.Visible;
            txtns.Visible = !txtns.Visible;
            btnHuyThem.Visible = !btnHuyThem.Visible;
            if (btnThemNS.Text == "Thêm nghệ sĩ")
            {
                txtmsnsbd.Text = ""; txtmsnsbd.ToolTip = "Nhập mã nghệ sĩ không được trùng";
                txtns.Text = "";
                btnThemNS.Text = "Lưu thông tin";
            }
            else
            {
                try
                {
                    SqlDataSourceNS.Insert();
                    GridViewNS.DataBind();
                    this.Title = "Thêm thành công";
                }
                catch (System.Exception ex)
                {
                    this.Title = "Lỗi thêm" + ex.Message;
                };
                btnThemNS.Text = "Thêm nghệ sĩ";
            }
        }

        protected void btnHuyThem_Click(object sender, EventArgs e)
        {
            lbmsnsbd.Visible = false;
            lbns.Visible = false;
            txtmsnsbd.Visible = false;
            txtns.Visible = false;
            btnHuyThem.Visible = false;
            btnThemNS.Text = "Thêm nghệ sĩ";
        }
    }
        
}
