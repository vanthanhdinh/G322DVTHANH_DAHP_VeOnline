using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G322DinhVanThanhVeOnline
{
    public partial class Managements : System.Web.UI.Page
    {
        static string us = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["dn"] != null) us = Session["dn"] as string; //Nếu đã có tên đang nhập thành công thì gán tên biến toàn cục us
            lbTitle.Text = "XIN CHÀO " + us + ": ĐÂY LÀ TRANG QUẢN LÝ CHÍNH: TỪ ĐÂY CHỌN CÁC CHỨC NĂNG QUẢN LÝ CỤ THỂ KHÁC";
                       
        }
        /// <summary>
        /// Gọi trang quản lý vé
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnVe_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrTicketsManagements.aspx");
            us = Session["dn"] as string; //gởi tên đăng nhập sang trang quản lý vé: FrTicketManagements.aspx thông qua Session
        }

        protected void btnNv_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrHumanResource.aspx");
        }

        protected void BtnDbv_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrBookingOffice.aspx");
        }

        protected void btnKv_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrArea.aspx");
        }

        protected void btnTl_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrMusicGenre.aspx");
        }

        protected void btnNs_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrArtist.aspx");
        }

        protected void btnNhomve_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrTicketClass.aspx");
        }

        protected void btnTon_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrStock.aspx");
        }

        protected void btnKh_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrCustumer.aspx");
        }

        protected void btnDmv_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrPurchaseOrder.aspx");
        }

        protected void btnCtdmv_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrDetailedPurchaseOrder.aspx");
        }

        protected void btnCnv_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrChuyenNhomVe.aspx");
        }
    }
}