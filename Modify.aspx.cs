using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class Modify : System.Web.UI.Page
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

            SqlConnection conn = new SqlConnection("" +
                "Data Source=.\\SQLEXPRESS;" +
                "Initial Catalog=InWordEditor;" +
                "Integrated Security=true");

            string strSql = "SELECT * FROM QuestionBoard WHERE num=" + Request["No"];

            SqlCommand cmd = new SqlCommand(strSql, conn);
            conn.Open();

            SqlDataReader read = cmd.ExecuteReader();

            if (read.Read())
            {
                lbl_writer.Text = read["name"].ToString();
                txtbox_contentTitle.Text = read["title"].ToString();
                txtbox_content.Text = read["contents"].ToString();

            }

            read.Close();
            conn.Close();
        }
    }



    protected void btn_modifyCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/List.aspx");
    }

    protected void btn_modify_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("" +
            "Data Source=.\\SQLEXPRESS;" +
            "Initial Catalog=InWordEditor;" +
            "Integrated Security=true");

        conn.Open();

        string strSql = "UPDATE QuestionBoard SET title='" + txtbox_contentTitle.Text + "', contents ='" + txtbox_content.Text + "' WHERE num=" + Request["No"];

        SqlCommand cmd = new SqlCommand(strSql, conn);

        cmd.ExecuteNonQuery();

        conn.Close();

        Response.Redirect("~/List.aspx");
    }
}