using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; // Khai báo namespace để sử dụng nhiều lần trong các lớp

namespace G322DinhVanThanhVeOnline
{
    public partial class Cart : System.Web.UI.Page
    {
        static DataTable cart = new DataTable(); // biến toàn cục cart dùng để dùng lưu giỏ hàng, static cấp phát vùng nhớ "tĩnh" 
        /// <summary>
        /// Thủ tục tự động chạy mỗi khi trang này được tải. nhiệm vụ chính: tải giỏ hàng lên nếu chưa thì thông báo rỗng
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cart"] == null) // giỏ hàng rỗng
            {
                lbTitle.Text = "HIỆN TẠI, GIỎ HÀNG CỦA QUÝ KHÁCH ĐANG TRỐNG, XIN MỜI SANG TRANG CHỦ CHỌN VÉ";
                btnShop.Text = "Chọn mua!";
                GridViewCart.DataSource = null; // Xóa trống danh mục vé trong giỏ
                lbSum.Text = ""; // Xóa trống tính tiền
                btnOrder.Visible = false; // giỏ hàng trống => Không có gì để mua để hủy
                BtnCancel.Visible = false;
            }    
            else // giỏ hàng đã có
            {
                lbTitle.Text = "GIỎ HÀNG HIỆN GIỜ CỦA QUÝ KHÁCH NHƯ SAU: ";
                btnShop.Text = "Mua tiếp!"; // vì đã có hàng trong giỏ => về trang chủ đẻ mua tiếp
                //B1: Lấy giỏ hàng từ Session xuống
                cart = Session["cart"] as DataTable; // cart = (datatable)Session["cart"]
                // B2: Gán giỏ hàng vào Gridviews
                GridViewCart.DataSource = cart;
                //B3: Tải dữ liệu lên Gridviews
                GridViewCart.DataBind();
                //B4: Tính tiền
                lbSum.Text= "Giỏ hàng hiện có: " + cart.Compute("Count(masove)", "").ToString() + " Vé, Tổng tiền: " + cart.Compute("Sum(tien)", "").ToString() + " đồng";
                btnOrder.Visible = true; // giỏ hàng có => có thể đặt mua , hủy
                BtnCancel.Visible = true;
            }   // if else session 
        }
        /// <summary>
        /// Về trang chủ (trưng bày hàng hóa) để chọn mua hoặc mua tiếp
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnShop_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\HomePage.aspx");
        }
        /// <summary>
        /// Hủy giỏ hàng
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            Session["cart"] = null; //Hủy giỏ hàng (session) trên bộ nhớ trong (ram)
            //Response.Redirect("~\\HomePage.aspx");
            btnShop_Click(sender, e); //Gọi sự kiện (Event) của nút btnShop
        }

        /// <summary>
        /// Đặt mua = order
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\FrOrder.aspx");
        }
    }
}