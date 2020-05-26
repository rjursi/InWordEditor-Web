using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_signUp_Click(object sender, EventArgs e)
    {
        // 세션으로 다른 페이지 데이터 전송
        Session["userId"] = txtbox_signUp_userID.Text;
        Session["userPassword"] = txtbox_signUp_userPassword.Text;
        Session["userEmail"] = txtbox_signUp_userEmail.Text;

        Server.Transfer("signUp.aspx");
        
    }
}