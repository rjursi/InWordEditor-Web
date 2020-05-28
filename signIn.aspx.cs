using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class signIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btn_signIn_Click(object sender, EventArgs e)
    {
        string username="";
        SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;" +
              "Initial Catalog=InWordEditor;" +
              "Integrated Security=True");


        conn.Open();

        string idSql = "SELECT username FROM Member WHERE UserID=@UserID AND Password=@Password";

        SqlCommand cmd = new SqlCommand(idSql, conn);

        cmd.Parameters.AddWithValue("@UserID", txtbox_signIn_userID.Text);
        cmd.Parameters.AddWithValue("@Password", txtbox_signIn_userPassword.Text);

        
        SqlDataReader rd = cmd.ExecuteReader();

        if (rd.HasRows)
        {

            while (rd.Read())
            {
                username = rd["UserName"].ToString();
            }

            // ID 로그인 성공 했을 시 로직

            Session["username"] = username;
            if (!string.IsNullOrEmpty(Session["fromEditorLogin"] as string))
            {
                Server.Transfer("editor.aspx");
                Session.Remove("fromEditorLogin");
            }
            else
            {
                Server.Transfer("index.aspx");
            }
            
            

        }
        else
        {
            rd.Close();
            username = emailLoginCheck(conn);
        }


        if (username.Equals(""))
        {
            lbl_loginFail.Text = "없는 ID, 이메일 이거나 잘못된 패스워드를 입력하였습니다.";
        }
        else
        {
            // 이메일 로그인 성공 했을 시 로직
            Session["username"] = username;
            if (!string.IsNullOrEmpty(Session["fromEditorLogin"] as string))
            {
                Server.Transfer("editor.aspx");
                Session.Remove("fromEditorLogin");
            }
            else
            {
                Server.Transfer("index.aspx");
            }

        }

        conn.Close();
        
    }

    string emailLoginCheck(SqlConnection conn)
    {
        string emailSql = "SELECT username FROM Member WHERE EmailAddress=@Email AND Password=@Password";

        SqlCommand cmd = new SqlCommand(emailSql, conn);
        string username="";

        cmd.Parameters.AddWithValue("@Email", txtbox_signIn_userID.Text);
        cmd.Parameters.AddWithValue("@Password", txtbox_signIn_userPassword.Text);

        SqlDataReader rd = cmd.ExecuteReader();

        if (rd.HasRows)
        {
            while (rd.Read())
            {
                username = rd["UserName"].ToString();
            }

            
        }
        rd.Close();
        return username;
    }
}