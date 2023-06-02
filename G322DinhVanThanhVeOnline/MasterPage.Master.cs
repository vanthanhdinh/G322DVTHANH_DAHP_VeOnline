using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G322DinhVanThanhVeOnline
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        /// <summary>
        /// Thủ tục tự chạy khi mở trên web browser
        /// ẩn login nv
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            LoginNv.Visible = false;
        }
        /// <summary>
        /// Viết thủ tục ẩn hiện login (trên MasterPage.master)
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e">lưu trữ thông tin mục chọn trên menumain mà nhân viên đãchọn</param>
        protected void MenuMain_MenuItemClick(object sender, MenuEventArgs e)
        {
            if(e.Item.Value == "ql" || e.Item.Value == "dn") // KHINSD(NV) chọn quản lý hoặc đăng nhập
            {
                LoginNv.Visible = true; // mở công cụ loginnv để nv đăng nhập để thực hiện các chức năng quản lý hệ thống
            }     
            else // khi nv chọn các mục khách
            {
                LoginNv.Visible = false;
            }   
        }

        /// <summary>
        /// Thủ tục xử lí đăng nhập
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e">Ghi nhận việc đăng nhập thành công</param>


        protected void LoginNv_Authenticate(object sender, AuthenticateEventArgs e)
        {
            if ((LoginNv.UserName == "Admin" && LoginNv.Password == "admin@vn") ||
               (LoginNv.UserName == "Guest" && LoginNv.Password == "guest@vn"))
            {
                e.Authenticated = true; // đăng nhập thành công, tự chuyển đến trang quản lý
            }
            else // đăng nhập không thành công
            {
                e.Authenticated = false;
            }
        }

    }
}