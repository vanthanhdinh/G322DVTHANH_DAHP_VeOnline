using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace G322DinhVanThanhVeOnline
{
    public partial class FrOrder : System.Web.UI.Page
    {
        static DataTable cart = new DataTable();//biến toàn cục cart = sẽ dùng để lưu giữ "giỏ hàng"
        //static = cấp phát vùng nhớ "tĩnh" cho biến cart => giá trị trong cart khi ra khỏi 1 thủ tục KHÔNG bị mất

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTimKH_Click(object sender, EventArgs e)
        {
            btnTimKH.Visible = true;//cho phép hủy tìm lại (bất kỳ lúc nào)
            if (btnTimKH.Text.Trim() == "Tìm")//[1] TÌM KHÁCH HÀNG
            {
                GridViewKH.DataBind(); // tìm kh
                if(GridViewKH.Rows.Count <1)
                {
                    btnTimKH.Text = "Thêm khách hàng mới"; //không tìm thấy KH như vậy (theo nd NSD nhập txtTimKH) =>THÊM KH MỚI
                }    
                else // tìm thấy ít nhất 1 khả năng
                {
                    btnTimKH.Text = "Chọn khách hàng"; // được chọn = xử lí ở dưới
                    txtmskh.Text = GridViewKH.Rows[0].Cells[1].Text.Trim(); //tạm gán mã kh đầu tiên tìm thấy row[0] vào txtmskh, cell[1]: phòng khi nsd kh chọn ai cả
                }    
            }   
            else if(btnTimKH.Text.Trim() == "Thêm khách hàng mới") // nhập kh mới
            { //hiện thị các ô 
                lbnhaptt.Visible = true;
                lbmskh.Visible = true;
                lbtenkh.Visible = true;
                lbdc.Visible = true;
                lbsdt.Visible = true;
                txtmskh.Visible = true;
                txttenkh.Visible = true;
                txtdc.Visible = true;
                txtsdt.Visible = true;
                // hien thi cac o nhap tt moi
                txtmskh.Text = txtTimKH.Text.Trim();
                txtmskh.ToolTip = "KHÔNG ĐỂ TRỐNG MÃ KHÁCH HÀNG & KHÔNG NHẬP TRÙNG";
                //gán nd nsd nhập mskh đảm bảo kh trùng // sau này cho thuộc tính này tự động
                txttenkh.Text = "";
                txtdc.Text = "";
                txtsdt.Text = "";
                //đổi nhãn nút lệnh
                btnTimKH.Text = "Lưu thông tin khách hàng mới";
            }    
            else if(btnTimKH.Text.Trim() == "Lưu thông tin khách hàng mới")
            { //lưu thông tin khách hàng mới đã nhập vào db
                try 
                {
                    SqlDataSourceKH.Insert(); //lưu kh mới vào db
                    txtTimKH.Text = txtmskh.Text.Trim(); // gán mskh tìm kh, tìm đúng kh vừa thêm
                    GridViewKH.DataBind();
                    this.Title = "ĐÃ THÊM THÀNH CÔNG";
                }
                catch (System.Exception ex)
                {
                    this.Title = "LỖI THÊM KHÁCH HÀNG MỚI" + ex.Message;
                }
                // an tt
                lbnhaptt.Visible = false;
                lbmskh.Visible = false;
                lbtenkh.Visible = false;
                lbdc.Visible = false;
                lbsdt.Visible = false;
                txtmskh.Visible = false;
                txttenkh.Visible = false;
                txtdc.Visible = false;
                txtsdt.Visible = false;
                //đổi nhãn
                btnTimKH.Text = "Chọn khách hàng"; //CÓ 2 tr. h CHỌN = khi tìm thấy KH {phía trên} hoặc khi nhập mới KH, tại đây
            }    
            else if (btnTimKH.Text == "Chọn khách hàng") // chọn khách hàng mới trong gridview tìm thấy
            {// gán mskh vào ô txt tìm (thống nhất chọn 1 kh)
                txtTimKH.Text = txtmskh.Text.Trim(); //khi chọn kh phải gán mã kh đã chọn vào txtmskh (SelectedIndexChanged)
                // tải dl khách hàng
                GridViewKH.DataBind();
                // khong cho chon lai, muon chon lai phai huy roi chon lai
                btnTimKH.Enabled = false;
                // xu li thong tin don hang
                lbtd2.Visible = true;
                lbmasoddv.Visible = true;
                lbngaydv.Visible = true;
                lbdcg.Visible = true;
                lbnguoinhan.Visible = true;
                lbsdtg.Visible = true;
                lbgc.Visible = true;
                lbmsddv.Visible = true;
                lbndv.Visible = true;
                txtdcg.Visible = true;
                //gán ĐT KH vào đây = mặc định ĐT giao hàng là DT của KH
                txtdcg.Text = GridViewKH.Rows[vt].Cells[3].Text.Trim();
                txtnguoinhan.Visible = true;
                //gán Tên KH vào đây = mặc định Người nhận là KH
                txtnguoinhan.Text = GridViewKH.Rows[vt].Cells[2].Text.Trim();
                txtsdtg.Visible = true;
                //gán ĐT KH vào đây = mặc định ĐT giao hàng là DT của KH
                txtsdtg.Text = GridViewKH.Rows[vt].Cells[4].Text.Trim();
                txtgc.Visible = true;
                DateTime t = System.DateTime.Now;
                lbndv.Text = t.ToShortDateString().Trim(); //Ngày lập = ngày ngày hiện tại => sv cho KH đổi = Calendard
                //msddv = SV nên cho mặc định tăng theo quy luật = năm _ quý _....(tạm thời gán như sau)
                lbmsddv.Text = txtTimKH.Text.Trim() + t.Year.ToString().Substring(2, 2) + t.Month.ToString().Trim() + t.Day.ToString().Trim() + t.Hour.ToString().Trim() + t.Minute.ToString().Trim() + t.Second.ToString().Trim();
                // Cùng 1 KH đặt 2 đơn hàng phải cách nhau ít nhất 1 s
                btnAcceptDMV.Visible = true;
                btnHuyDMV.Visible = true;
                //4.3.2 Hiện thị thông tin CHI TIẾT "Đơn hàng"
                lbtd3.Visible = true;
                cart = Session["cart"] as DataTable;
                GridViewCart.DataSource = cart;
                GridViewCart.DataBind();
                lbsum.Text = "Giỏ hàng hiện có " + cart.Compute("Count(masove)", "").ToString() + " MẶT HÀNG, TỔNG TIỀN = " + cart.Compute("Sum(gia)", "").ToString() + " đ";
                GridViewCart.Visible = true;
                lbsum.Visible = true;
            }
        }

        static int vt = 0;
        protected void GridViewKH_SelectedIndexChanged(object sender, EventArgs e)
        {
            vt = GridViewKH.SelectedIndex;
            txtmskh.Text = GridViewKH.Rows[vt].Cells[1].Text.Trim();//gán mã KH đã chọn vào TxtMaKH; ....

        }

        protected void btnHuyTimKH_Click(object sender, EventArgs e)
        {
            //1. Cho "Tìm lại"
            btnTimKH.Text = "Tìm";
            btnTimKH.Enabled = true;
            //2. Ẩn các ô nhập thông tin KH mới         
            lbnhaptt.Visible = false;
            lbmskh.Visible = false;
            lbtenkh.Visible = false;
            lbdc.Visible = false;
            lbsdt.Visible = false;
            txtmskh.Visible = false;
            txttenkh.Visible = false;
            txtdc.Visible = false;
            txtsdt.Visible = false;

            //3. Xóa trống TextBox nhập thông tin tim, để nhập lại
            txtTimKH.Text = "";
            //4. Nạp lại (trống) GridView ds KH, tránh trường hợp trước đã tìm có ds KH
            GridViewKH.DataBind();
            //5. Ẩn chính nó
            btnHuyTimKH.Visible = false;
            //6. HỦY "ĐƠN HÀNG" 
            //6.1 Hiện thị thông tin "Đơn hàng"
            lbtd2.Visible = false;
            lbmasoddv.Visible = false;
            lbngaydv.Visible = false;
            lbdcg.Visible = false;
            lbnguoinhan.Visible = false;
            lbsdtg.Visible = false;
            lbgc.Visible = false;
            lbmsddv.Visible = false;
            lbndv.Visible = false;
            txtdcg.Visible = false;
            txtdcg.Text = "";
            lbmsddv.Text = "";
            txtdcg.Visible = false;
            txtnguoinhan.Visible = false;
            txtsdtg.Visible = false;
            txtgc.Visible = false;
            btnAcceptDMV.Visible = false;
            btnHuyDMV.Visible = false;
            //4.3.2 Hiện thị thông tin CHI TIẾT "Đơn hàng"
            lbtd3.Visible = false;
            lbsum.Text = "";
            GridViewCart.Visible = false;
            lbsum.Visible = false;
        }

        protected void btnAcceptDMV_Click(object sender, EventArgs e)
        {
            //THÊM ĐƠN & CTDDH vào DB
            try
            {
                SqlDataSourceDDH.Insert();
                foreach (DataRow r in cart.Rows)
                {
                    SqlDataSourceCTDDH.InsertParameters.Clear();
                    SqlDataSourceCTDDH.InsertParameters.Add("masodonmuave", lbmsddv.Text.Trim());
                    SqlDataSourceCTDDH.InsertParameters.Add("masove", r["masove"].ToString().Trim());
                    SqlDataSourceCTDDH.InsertParameters.Add("soluong", DbType.Double, r["soluong"].ToString().Trim());
                    SqlDataSourceCTDDH.Insert();
                }
                this.Title = "Thêm DDH & CTDDH xong";
            }
            catch (System.Exception ex) { this.Title = "LỖI THÊM DDH & CTDDH = " + ex.Message; }
            //KHÓA "Đơn hàng"
            txtgc.Enabled = false;
            txtdcg.Enabled = false;
            txtnguoinhan.Enabled = false;
            txtsdtg.Enabled = false;
            btnAcceptDMV.Enabled = false;
            //KHÔNG HỦY KH = HỦY ĐƠN HÀNG = HỦY
            btnHuyTimKH.Enabled = false;

        }



        protected void btnHuyDMV_Click(object sender, EventArgs e)
        {
            lbnhaptt.Visible = false;
            lbmskh.Visible = false;
            lbtenkh.Visible = false;
            lbdc.Visible = false;
            lbsdt.Visible = false;
            txtmskh.Visible = false;
            txttenkh.Visible = false;
            txtdc.Visible = false;
            txtsdt.Visible = false;

            GridViewKH.Visible = false;

            lbtd2.Visible = false;

            lbmasoddv.Visible = false;
            lbngaydv.Visible = false;
            lbdcg.Visible = false;
            lbnguoinhan.Visible = false;
            lbsdtg.Visible = false;
            lbgc.Visible = false;

            lbmsddv.Visible = false;
            lbndv.Visible = false;
            txtdcg.Visible = false;
            txtnguoinhan.Visible = false;
            txtsdtg.Visible = false;
            txtgc.Visible = false;
            btnAcceptDMV.Visible = false;
            btnHuyDMV.Visible = false;

            // hiển thị CT đơn hàng

            lbtd3.Visible = false;
            lbsum.Visible = false;
            GridViewCart.Visible = false;

            btnTimKH.Text = "Chọn khách hàng";
        }
    }
}