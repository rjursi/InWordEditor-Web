using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Write : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lbl_useUserName.Text = Session["username"].ToString();
            lbl_userStatus.CssClass = "dot ml-3";
            lbl_username.Text = Session["username"].ToString();
        }
    }

    protected void btn_submitContent_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(
            "Data Source=.\\SQLEXPRESS;" +
            "Initial Catalog=InWordEditor;" +
            "Integrated Security=true");

        // 답글이 아닐 경우
        if (Request["Action"].CompareTo("Reply") != 0)
        {
            string sql = "INSERT INTO QuestionBoard(name, id, email, title, contents, writedate, readcount, refer, depth, pos) Values" +
                "(@name, @id, @email, @title, @contents, @writedate, 0,0,0,0)";

            SqlCommand cmd = new SqlCommand(sql, conn);

            cmd.Parameters.AddWithValue("@name", Session["username"].ToString());
            cmd.Parameters.AddWithValue("@id", Session["userID"].ToString());
            cmd.Parameters.AddWithValue("@email", Session["userEmail"].ToString());
            cmd.Parameters.AddWithValue("@title", txtbox_contentTitle.Text);
            cmd.Parameters.AddWithValue("@contents", txtbox_content.Text);
            cmd.Parameters.AddWithValue("@writedate", DateTime.Now.ToShortDateString());

            conn.Open();
            cmd.ExecuteNonQuery();

            string strSql = "UPDATE QuestionBoard SET refer=num WHERE refer= 0";
            cmd = new SqlCommand(strSql, conn);

            cmd.ExecuteNonQuery();

        }
        // 답글일 경우
        else
        {
            int iRefer = int.Parse(Request["refer"]);
            int iDepth = int.Parse(Request["depth"]);
            int iPos = int.Parse(Request["pos"]);

            string strSql = "UPDATE QuestionBoard SET pos=pos + 1 WHERE refer=" + iRefer + " and pos=" + iPos;

            SqlCommand cmd = new SqlCommand(strSql, conn);
            conn.Open();
            cmd.ExecuteNonQuery();

            iDepth++;
            iPos++;


            strSql = "INSERT INTO QuestionBoard(name, id, email, title, contents, writedate, readcount, refer, depth, pos) VALUES (@name, @id, @email, @title, @contents, @writedate, 0, @refer, @depth, @pos)";

            cmd = new SqlCommand(strSql, conn);

            cmd.Parameters.AddWithValue("@name", Session["username"].ToString());
            cmd.Parameters.AddWithValue("@id", Session["userID"].ToString());
            cmd.Parameters.AddWithValue("@email",Session["userEmail"].ToString());
            cmd.Parameters.AddWithValue("@title", txtbox_contentTitle.Text);
            cmd.Parameters.AddWithValue("@contents", txtbox_content.Text);
            cmd.Parameters.AddWithValue("@writedate", DateTime.Now.ToShortDateString());
            cmd.Parameters.AddWithValue("@refer", iRefer);
            cmd.Parameters.AddWithValue("@depth", iDepth);
            cmd.Parameters.AddWithValue("@pos", iPos);

            cmd.ExecuteNonQuery();

        }
        conn.Close();


        Response.Redirect("~/List.aspx");

    }

    protected void btn_list_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/List.aspx");
    }
}