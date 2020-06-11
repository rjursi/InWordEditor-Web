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
        if (!string.IsNullOrEmpty(Session["username"] as string))
        {
            if (Session["username"].ToString().Equals("김윤권(관리자)"))
            {
                btn_admin.Visible = true;
            }

            lbl_hello.Visible = true;
            lbl_username.Text = Session["username"].ToString();
            btn_logout.Visible = true;
            btn_login.Visible = false;
            panel_signUpForm.Visible = false;
            panel_editorImage.Visible = true;
            btn_noLoginStart.Visible = false;
            btn_start.Visible = true;
            btn_login.CssClass = "btn btn-success";
        }
        else
        {
            panel_signUpForm.Visible = true;
            panel_editorImage.Visible = false;
            btn_noLoginStart.Visible = true;
            btn_start.Visible = false;
            btn_login.CssClass = "btn btn-success mr-5";
            btn_admin.Visible = false;
        }
        
    }

    protected void btn_signUp_Click(object sender, EventArgs e)
    {
        // 세션으로 다른 페이지 데이터 전송
        Session["userId"] = txtbox_signUp_userID.Text;
        Session["userPassword"] = txtbox_signUp_userPassword.Text;
        Session["userEmail"] = txtbox_signUp_userEmail.Text;

        Server.Transfer("signUp.aspx");
        
    }

    protected void btn_logout_Click(object sender, EventArgs e)
    {

        Session.RemoveAll();
        lbl_username.Text = "";
        lbl_hello.Visible = false;

        btn_logout.Visible = false;
        btn_login.Visible = true;
        panel_signUpForm.Visible = true;
        panel_editorImage.Visible = false;
        btn_noLoginStart.Visible = true;
        btn_start.Visible = false;
        btn_admin.Visible = false;

    }

    protected void btn_noLoginStart_Click(object sender, EventArgs e)
    {
        Server.Transfer("editor.aspx");
    }

    protected void btn_start_Click(object sender, EventArgs e)
    {
        Server.Transfer("editor.aspx");
    }
}