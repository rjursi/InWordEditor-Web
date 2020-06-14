using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class View : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Session["username"] as string))
            {
                lbl_username.Text = Session["username"].ToString();
                lbl_userStatus.CssClass = "dot ml-3";
            }

            SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;" +
                "Initial Catalog=InWordEditor;" +
                "Integrated Security=true");

            string strSql = "UPDATE QuestionBoard SET readcount = readcount + 1 WHERE num = " + Request["No"];

            SqlCommand cmd = new SqlCommand(strSql, conn);
            conn.Open();
            cmd.ExecuteNonQuery();

            // 요청에 맞게 가져옴
            strSql = "SELECT * FROM QuestionBoard WHERE num=" + Request["No"];

            cmd = new SqlCommand(strSql, conn);

            SqlDataReader rd = cmd.ExecuteReader();

            if (rd.Read())
            {
                lbl_writer.Text = rd["name"].ToString();
                lbl_writeDate.Text = rd["writedate"].ToString();
                lbl_readcount.Text = rd["readcount"].ToString();
                lbl_contentTitle.Text = rd["title"].ToString();
                txtbox_content.Text = rd["contents"].ToString();

                lbl_refer.Text = rd["refer"].ToString();
                lbl_depth.Text = rd["depth"].ToString();
                lbl_pos.Text = rd["pos"].ToString();
            }

            rd.Close();
            conn.Close();


            if (!string.IsNullOrEmpty(Session["username"] as string)) { 
                // 관리자만 답글을 달 수 있도록 함
                if (Session["username"].ToString().Equals("김윤권(관리자)"))
                {
                    btn_submitReply.Visible = true;

                }
                else
                {
                    btn_submitReply.Visible = false;
                }

                if (lbl_writer.Text.Equals(Session["username"].ToString()) || Session["username"].ToString().Equals("김윤권(관리자)"))
                {
                    btn_update.Visible = true;
                    btn_delete.Visible = true;
               
                }
                else
                {
                    btn_update.Visible = false;
                    btn_delete.Visible = false;

                }
                // 작성자가 자기 자신이나 관리자가 아니면 수정, 및 삭제를 하지 못하도록 함

            }
            else
            {
                btn_submitReply.Visible = false;
                btn_update.Visible = false;
                btn_delete.Visible = false;
            }


        }
    }

    protected void btn_viewList_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/List.aspx");
    }

    protected void btn_update_Click(object sender, EventArgs e)
    {

        // 이건 그냥 수정 페이지로 변경을 하면 되고
        Response.Redirect("~/Modify.aspx?No=" + Request["No"]);
    }

    protected void btn_delete_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;" +
                "Initial Catalog=InWordEditor;" +
                "Integrated Security=true");

        
        string strSql = "DELETE FROM QuestionBoard WHERE num=" + Request["No"];

        conn.Open();
        SqlCommand cmd = new SqlCommand(strSql, conn);

        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Redirect("~/List.aspx");
    }

    protected void btn_submitReply_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/Write.aspx?Action=Reply&No=" + Request["No"] +
            "&Refer=" + lbl_refer.Text + "&depth=" + lbl_depth.Text + "&pos=" + lbl_pos.Text);


    }
}