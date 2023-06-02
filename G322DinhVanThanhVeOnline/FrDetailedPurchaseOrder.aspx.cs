using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G322DinhVanThanhVeOnline
{
    public partial class FrDetailedPurchaseOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            lbmsdmv.Visible = !lbmsdmv.Visible;
            lbmsv.Visible = !lbmsv.Visible;
            lbsl.Visible = !lbsl.Visible;
            txtdmv.Visible = !txtdmv.Visible;
            txtmsv.Visible = !txtmsv.Visible;
            txtsl.Visible = !txtsl.Visible;
            btnHuyThem.Visible = !btnHuyThem.Visible;
            if (btnThem.Text == "Thêm chi tiết")
            {
                txtdmv.Text = "";
                txtmsv.Text = "";
                txtsl.Text = "";
                btnThem.Text = "Lưu thông tin";
            }
            else
            {
                try
                {
                    SqlDataSourceCTD.Insert();
                    GridViewCTD.DataBind();
                    this.Title = "Thêm thành công";
                }
                catch (System.Exception ex)
                {
                    this.Title = "Lỗi thêm mới" + ex.Message;
                };
                btnThem.Text = "Thêm chi tiết";
            }
        }

        protected void btnHuyThem_Click(object sender, EventArgs e)
        {
            lbmsdmv.Visible = false;
            lbmsv.Visible = false;
            lbsl.Visible = false;
            txtdmv.Visible = false;
            txtmsv.Visible = false;
            txtdmv.Visible = false;
            btnThem.Text = "Thêm chi tiết";
        }
    }
}