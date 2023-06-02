using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;//khai báo namespace để tránh phải sd nhiều lần trong các code bên dưới, khi dùng các class của nó

namespace G322DinhVanThanhVeOnline
{
    public partial class HomePage : System.Web.UI.Page
    {
        static DataTable Cart = new DataTable();
        // biến toàn cục Cart dùng để dùng lưu giỏ hàng, static cấp phát vùng nhớ "tĩnh" 

        // Nhiệm vụ chính: khởi tạo giỏ hàng nếu có trong sesion thì lấy xuống, nếu chưa thì khởi tạo 
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack) // chỉ thiết lập giỏ hàng mới khi homepage được load lần đầu ,các lần sau không 
            {
                if(Session["Cart"] != null) // đã có giỏ hàng
                {
                    Cart = Session["Cart"] as DataTable; // lấy giỏ hàng từ ""session" xuống để dùng
                }    
                else
                {
                    Cart.Rows.Clear(); // xóa các dòng và cột "rác" trong giỏ hàng
                    Cart.Columns.Clear();
                    Cart.Columns.Add("masove", typeof(string));
                    Cart.Columns.Add("tenve", typeof(string));
                    Cart.Columns.Add("gia", typeof(float));
                    Cart.Columns.Add("soluong", typeof(int));
                    Cart.Columns.Add("tien", typeof(float), "soluong * gia"); // thuoc tính tahnhf tiền được tính tự động = số lượng*đơn giá
                }   //else if 
            }    
        } // page load

        /// <summary>
        /// Thủ tục = Bỏ hàng vào giỏ = Khi khách hàng online chọn nút lệnh "Chọn mua" một mặt hàng item/ datalistdmve
        /// thục tục thực hiện khi người dùng chọn 1 lệnh (nhận diện nhờ thuộc commandname) nào đó trong 1 item datalist
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        protected void DataListDMVe_ItemCommand(object source, DataListCommandEventArgs e) // tham số e.Item lưu giữ các thông tin cơ bản 
        {
            if(e.CommandName == "chon")// nsd bấm nút "chọn mua"
            {
                //B1: Lấy các thông tin món hàng [item] mà khách hàng đang chọn
                string masove = ((Label)e.Item.FindControl("masoveLabel")).Text.Trim(); //datalistDMVe.Datakeys(e.item.itemindex)
                string tenve = ((Label)e.Item.FindControl("tenveLabel")).Text;
                float gia = float.Parse(((Label)e.Item.FindControl("giaLabel")).Text.Trim());
                int soluong = int.Parse(((TextBox)e.Item.FindControl("txtSL")).Text.Trim());
                //B2: Kiểm tra item (item có chưa, nếu có thì chỉ tăng số lượng)
                foreach(DataRow r in Cart.Rows) // dò từng dòng hàng có trong vỏ
                {
                    if (r["masove"].ToString() == masove)//if ((string)r["masove"] == masove) || Mặt hàng kh chọn đã có trong giỏ
                    {
                        r["soluong"] = (int)r["soluong"] + soluong;//tăng số lượng vừa chọn
                        goto kt; // đã tìm thấy hàng trong giỏ kết thúc foreach => nhảy đến B4 (bỏ qua B3: Thêm mặt hàng Cart vào giỏ)
                    }
                }
                //B3: Thêm mặt hàng mới vào giỏ khi giỏ hàng trống
                Cart.Rows.Add(masove,tenve,gia,soluong);

            //B4: Gửi giỏ hàng lên session để chuyển sang các trang khác sử dụng sau khi đã thêm vào giỏ
            kt:
                Session["Cart"] = Cart;
            //B5: Thông báo kết quả
                lbKQ.Text = "Hiện tại trong giỏ hàng đang có: " + Cart.Compute("Count(masove)","").ToString() + " Vé, Tổng tiền: " + Cart.Compute("Sum(tien)","").ToString() + " đồng";
            }    // if chọn mua
        } // itemcommand của datalistdmve
        /// <summary>
        /// Xem giỏ hàng
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        

        protected void btnCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\Cart.aspx");
        }
    }
}