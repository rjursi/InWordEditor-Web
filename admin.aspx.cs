using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!string.IsNullOrEmpty(Session["username"] as string))
            {
                lbl_username.Text = Session["username"].ToString();
                lbl_userStatus.CssClass = "dot ml-3";
            }
        }
    }

    protected void btn_deleteUser_Click(object sender, EventArgs e)
    {
        
        SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;" +
               "Initial Catalog=InWordEditor;" +
               "Integrated Security=true");

        string questionDeleteSql = "DELETE FROM QuestionBoard WHERE id=@id";
        string strSql = "DELETE FROM Member WHERE userid=@id";

        conn.Open();
        SqlCommand cmd = new SqlCommand(questionDeleteSql, conn);
        cmd.Parameters.AddWithValue("@id", txtbox_inputID.Text);
        cmd.ExecuteNonQuery();

        cmd = new SqlCommand(strSql, conn);
        cmd.Parameters.AddWithValue("@id", txtbox_inputID.Text);
        cmd.ExecuteNonQuery();
        conn.Close();

        Response.Redirect("~/admin.aspx");
       
    }

    protected void btn_exit_Click(object sender, EventArgs e)
    {
        Server.Transfer("~/index.aspx");
    }
}