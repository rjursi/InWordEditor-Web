using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!string.IsNullOrEmpty(Session["username"] as string))
            {
                // 로그인 된 사람이 있을 경우
                lbl_username.Text = Session["username"].ToString();
                lbl_userStatus.CssClass = "dot ml-3";
                lbl_loginExplain.Visible = false;
                btn_login.Visible = false;
                btn_write.Visible = true;

                //htmlEditorEx_editor.Enabled = true;
            }
            else
            {
                // 비회원 사용일 경우

                lbl_username.Text = "Guest";
                lbl_userStatus.CssClass = "guestDot ml-3";
                lbl_loginExplain.Visible = true;
                btn_login.Visible = true;
                btn_write.Visible = false;

            }
        }
    }

    public string SetSpace(int depth)
    {
        if (depth == 0) return "";

        string strSpace = "";

        for (int i = 0; i < depth; i++)
        {
            strSpace += "&nbsp;&nbsp;&nbsp;";
        }
        strSpace += "ㄴ";
        return strSpace;
    }

    protected void btn_write_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Write.aspx?Action=Write");
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        Server.Transfer("signIn.aspx");
    }

    protected void btn_exit_Click(object sender, EventArgs e)
    {
        Server.Transfer("index.aspx");
    }
}