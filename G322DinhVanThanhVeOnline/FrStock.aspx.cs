using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G322DinhVanThanhVeOnline
{
    public partial class FrStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownListDiemBanVe_SelectedIndexChanged(sender, e);
            
        }

        protected void DropDownListDiemBanVe_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnThem.Enabled = true;
            if (DropDownListDiemBanVe.SelectedValue.ToString() == "*")// NSD (NV) đã chọn mục tất cả (Text) với Value = *
            {
                SqlDataSourceVeTon.SelectCommand = "SELECT * FROM [VeTon]";//Viết lại câu lệnh Select ... From : không Where.. = liệt kê All
                btnThem.Enabled = false; //nsd chọn mục tất cả, không chọn thêm
                btnThem.ToolTip = DropDownListDiemBanVe.ToolTip = "Phải chọn một điểm bán vé cụ thể";//thông báo nhắc người dùng
            }
            lbmsdbv.Text = DropDownListDiemBanVe.SelectedValue;
            //Hiểm thị mã nhóm vé ở kế bên = tự động chay trên Page_Load (nêu trên)
        }
        protected void DropDownListVe_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbmsv.Text = DropDownListVe.SelectedValue;
            btnThem.Text = "Lưu thông tin"; btnThem.ToolTip = "";
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            lbtenve.Visible = !lbtenve.Visible;
            lbmsve.Visible = !lbmsve.Visible;
            lbslt.Visible = !lbslt.Visible;
            DropDownListVe.Visible = !DropDownListVe.Visible;
            lbmsv.Visible = !lbmsv.Visible;
            txtslt.Visible = !txtslt.Visible;
            btnHuythem.Visible = !btnHuythem.Visible;
            
            if (btnThem.Text == "Thêm")
            {
                lbmsv.Text = DropDownListVe.SelectedValue;
                txtslt.Text = "";
                btnThem.Text = "Lưu thông tin"; btnThem.ToolTip = "";
            }
            else
            {
                try
                {
                    SqlDataSourceVeTon.Insert();
                    GridViewVeTon.DataBind();
                    this.Title = "Thêm thành công";
                }
                catch (System.Exception ex)
                {
                    this.Title = "Lỗi thêm" + ex.Message;
                };
                btnThem.Text = "Thêm";
            }
        }

        protected void btnHuythem_Click(object sender, EventArgs e)
        {
            lbtenve.Visible = false;
            lbmsve.Visible = false;
            lbslt.Visible = false;
            DropDownListVe.Visible = false;
            lbmsv.Visible = false;
            txtslt.Visible = false;
            btnHuythem.Visible = false;
            btnThem.Text = "Thêm";
        }



        
    }
}