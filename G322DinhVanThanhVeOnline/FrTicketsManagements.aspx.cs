using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G322DinhVanThanhVeOnline
{
    public partial class FrTicketsManagements : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            DropDownListNhomMH_SelectedIndexChanged(sender, e);//Gọi thủ tục sự kiện ..SelectIndexChange của Dropdownlist => xử lý chọn * và ... 

        }
        /// <summary>
        /// ẨN or HIỆN: Cột hình mẫu trong danh sách Món ăn (từ đầu: ẩn = tránh tình trạng WebPage bị chậm do tải hình ảnh) 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void CheckBoxHinh_CheckedChanged(object sender, EventArgs e)
        {
            GridViewMH.Columns[5].Visible = !GridViewMH.Columns[5].Visible;
            // ẩn hiện hình mẫu bằng cột 4, nếu thêm bớt cột phải điểu chỉnh lại vị trí cột
        }

        /// <summary>
        /// THỦ TỤC TỰ ĐỘNG CHẠY MỖI KHI NSD (NV) THAY ĐỔI LỰA CHỌN TRONG Dropdownlist này
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DropDownListNhomMH_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownListNhomMH.SelectedValue.Trim() == "*")// NSD (NV) đã chọn mục tất cả (Text) với Value = *
            {
                SqlDataSourceMH.SelectCommand = "SELECT * FROM [DanhMucVe]";//Viết lại câu lệnh Select ... From : không Where.. = liệt kê All
                btnThem.Enabled = false; //nsd chọn mục tất cả, không chọn thêm
                btnThem.ToolTip = DropDownListNhomMH.ToolTip = "Phải chọn nhóm cụ thể để có thể thêm Vé mới vào Nhóm đó";//thông báo nhắc người dùng
            }
            else
            {
                btnThem.Enabled = true; //thêm mới được vì đã chọn nhóm cụ thể
                btnThem.ToolTip = DropDownListNhomMH.ToolTip = "";//không thông báo nhắc người dùng
            }
            lbmsnhom.Text = DropDownListNhomMH.SelectedValue;
            //Hiểm thị mã nhóm vé ở kế bên = tự động chay trên Page_Load (nêu trên)
        }
        /// <summary>
        /// VIẾT MÃ LỆNH CHO NÚT THÊM / LƯU
        /// PA2: Trong bài làm này tạm dùng các Textbox để nhập thông tin MH mới: 
        /// + chỉ khi nsd bấm “thêm mới” thì các Textbox hiện ra cho nsd nhập thông tin MH mới, đổi nhãn “Thêm mới” => “Lưu”; 
        /// + nsd sau khi nhập xong thông tin MH mới, sẽ bấm nút “Lưu” : lưu MH mới vào BD đồng thời ẩn các TextBox và đồi nhãn nhút “Lưu” => “Thêm mới”
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnThem_Click(object sender, EventArgs e)
        {//B1: ẨN || HIỆN CÁC Ô NHẬP DỮ LIỆU : TEXTBOX
            lbmasove.Visible = !lbmasove.Visible;
            lbtenve.Visible = !lbtenve.Visible;
            lbtheloai.Visible = !lbtheloai.Visible;
            lbnghesi.Visible = !lbnghesi.Visible;
            lbhinhanh.Visible = !lbhinhanh.Visible;
            lbthoigian.Visible = !lbthoigian.Visible;
            lbdiadiem.Visible = !lbdiadiem.Visible;
            lbkhuvuc.Visible = !lbkhuvuc.Visible;
            lbgia.Visible = !lbgia.Visible;

            txtmasove.Visible = !txtmasove.Visible;
            txttenve.Visible = !txttenve.Visible;
            DropDownListTL.Visible = !DropDownListTL.Visible;
            DropDownListNS.Visible = !DropDownListNS.Visible;
            FileUploadhinhanh.Visible = !FileUploadhinhanh.Visible;
            Calendarthoigian.Visible = !Calendarthoigian.Visible;
            txtdiadiem.Visible = !txtdiadiem.Visible;
            txtkhuvuc.Visible = !txtkhuvuc.Visible;
            txtgia.Visible = !txtgia.Visible;

            btnHuy.Visible = !btnHuy.Visible;

            //B2: ĐỔI NHÃN nút "Thêm..." <=> "Lưu..."
            if(btnThem.Text == "Thêm vé mới")//"Thêm...Lưu"
            {
                //Xóa trống tất cả các TextBox để chuẩn bị cho nsd (NV) nhập thông tin mặt hàng mới
                txtmasove.Text = "";
                txtmasove.ToolTip = "Không để trống mã vé";
                txttenve.Text = "";
                txtdiadiem.Text = "";
                txtkhuvuc.Text = "";
                txtgia.Text = "";
                txtgia.ToolTip = "Giá > 0";
                //đổi nhãn nút "thêm ..." => "lưu..." 
                btnThem.Text = "Lưu vé mới";
            }    
            else //"Lưu...Thêm"
            {
                try
                {
                    SqlDataSourceMH.InsertParameters.Clear();//Xóa ALL tham số cũ;chuẩn bị Định nghĩa tham số mơi
                    SqlDataSourceMH.InsertParameters.Add("masove", txtmasove.Text.Trim());
                    SqlDataSourceMH.InsertParameters.Add("tenve", txttenve.Text);
                    SqlDataSourceMH.InsertParameters.Add("masotheloai", DropDownListTL.SelectedValue.Trim());
                    SqlDataSourceMH.InsertParameters.Add("masonghesi", DropDownListNS.SelectedValue.Trim());
                    SqlDataSourceMH.InsertParameters.Add("hinhanh", "~\\Media\\" + FileUploadhinhanh.FileName.Trim());
                    SqlDataSourceMH.InsertParameters.Add("thoigian",System.Data.DbType.DateTime, Calendarthoigian.SelectedDate.ToShortDateString());
                    SqlDataSourceMH.InsertParameters.Add("diadiem", txtdiadiem.Text.Trim());
                    SqlDataSourceMH.InsertParameters.Add("khuvuc", txtkhuvuc.Text.Trim());
                    SqlDataSourceMH.InsertParameters.Add("gia", System.Data.DbType.Double,txtgia.Text.Trim());
                    SqlDataSourceMH.InsertParameters.Add("masoloaive", DropDownListNhomMH.SelectedValue.Trim());
                    FileUploadhinhanh.SaveAs("D:\\G322DinhVanThanhVeOnline\\Media\\"+FileUploadhinhanh.FileName);

                    SqlDataSourceMH.Insert(); //LƯU MH MỚI VÀO DB = CÂU LỆNH QUAN TRỌNG 1

                    //COPY HÌNH VỪA CHON TỪ FileUpload vào THƯ MỤC =~\\Media\\
                    //System.IO.File.Copy(FileUploadhinhanh.FileName, "D:\\G322DinhVanThanhVeOnline\\Media\\"+FileUploadhinhanh.FileName,true); //chồng lên đã có file

                    this.Title = "THÊM THÀNH CÔNG !";
                }
                catch(System.Exception ex)
                {
                    this.Title = "CÓ LỖI THÊM VÉ MỚI !" + ex.Message;
                }
                btnThem.Text = "Thêm vé mới";

                //TẢI DỮ LIỆU SAU KHI THÊM LÊN GridviewMH
                GridViewMH.DataBind();

            }    
        } //btnThem_Click

        //Hủy thêm vé
        protected void btnHuy_Click(object sender, EventArgs e)
        {   //B1: ẨN CÁC Ô NHẬP DỮ LIỆU : TEXTBOX
            lbmasove.Visible = false;
            lbtenve.Visible = false;
            lbtheloai.Visible = false;
            lbnghesi.Visible = false;
            lbhinhanh.Visible = false;
            lbthoigian.Visible = false;
            lbdiadiem.Visible = false;
            lbkhuvuc.Visible = false;
            lbgia.Visible = false;

            txtmasove.Visible = false;
            txttenve.Visible = false;
            DropDownListTL.Visible = false;
            DropDownListNS.Visible = false;
            FileUploadhinhanh.Visible = false;
            Calendarthoigian.Visible = false;
            txtdiadiem.Visible = false;
            txtkhuvuc.Visible = false;
            txtgia.Visible = false;

            btnHuy.Visible = false;

            //đổi nhãn thành nút "thêm ..." 
            btnThem.Text = "Thêm vé mới";
        }//btnHuy

        static int pos = 0; // biến toàn cục static lưu vị trí đang sửa edit
        /// <summary>
        /// LƯU GIỮ VỊ TRÍ {lưu trong biến toàn cục id [static] DÒNG đang Update["hinhanh"] trên GridViewMH
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridViewMH_RowEditing(object sender, GridViewEditEventArgs e)
        {
            pos = e.NewEditIndex; //e là tham số để lấy vị trí dong đang Editing

        }

        /// <summary>
        /// Gán hình mà NSD (NVQL) vừa chọn từ FileUpload lên thay thế vào hình cũ / TextBox1 
        /// (đã DataBinding đến dữ liệu / DataBase)Thực hiện tương tự ItemCommand của DataList / Homepage
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridViewMH_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName.Trim() == "select")
        {
                string p = ((FileUpload)GridViewMH.Rows[pos].FindControl("FileUpload1")).FileName; //
                if (p != "")//nsd [nv] đã chọn file hình trong FileUpload [filename]
                {
                    //GÁN HÌNH VỪA CHỌN trong FileUpload vào textbox dataBinding
                    ((TextBox)GridViewMH.Rows[pos].FindControl("TextBox1")).Text = "~\\Media\\" + p;
                    // copy file hình vừa chọn vào thư mục "~\\Media\\" của app
                    ((FileUpload)GridViewMH.Rows[pos].FindControl("FileUpload1")).SaveAs("D:\\G322DinhVanThanhVeOnline\\Media\\" + p);
                    //chú ý: khi di chuyển app này đến một thư mục khác hoặc upload lên somee ->phải thay đổi path vật lý
                     
                }
                ((FileUpload)GridViewMH.Rows[pos].FindControl("FileUpload1")).Visible = false; //ẨN FileUpload sau khi gán xong
                ((Button)GridViewMH.Rows[pos].FindControl("btnHinh")).Text = "Chọn hình khác"; //đổi nhãn nút thành: "Chọn hình khác"
            }//if

        }
    } //partial class
}