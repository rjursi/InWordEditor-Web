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
        string[] userInfo = new string[3];
        SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;" +
              "Initial Catalog=InWordEditor;" +
              "Integrated Security=True");


        conn.Open();

        string idSql = "SELECT username, userid, emailaddress FROM Member WHERE UserID=@UserID AND Password=@Password";

        SqlCommand cmd = new SqlCommand(idSql, conn);

        cmd.Parameters.AddWithValue("@UserID", txtbox_signIn_userID.Text);
        cmd.Parameters.AddWithValue("@Password", txtbox_signIn_userPassword.Text);

        
        SqlDataReader rd = cmd.ExecuteReader();

        if (rd.HasRows)
        {

            while (rd.Read())
            {
                userInfo[0] = rd["UserName"].ToString();
                userInfo[1] = rd["UserID"].ToString();
                userInfo[2] = rd["EmailAddress"].ToString();
            }

            // ID 로그인 성공 했을 시 로직

            Session["username"] = userInfo[0];
            Session["userID"] = userInfo[1];
            Session["userEmail"] = userInfo[2];

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
            userInfo = emailLoginCheck(conn);
        }


        if (userInfo[0].Equals(""))
        {
            lbl_loginFail.Text = "없는 ID, 이메일 이거나 잘못된 패스워드를 입력하였습니다.";
        }
        else
        {
            // 이메일 로그인 성공 했을 시 로직
            Session["username"] = userInfo[0];
            Session["userID"] = userInfo[1];
            Session["userEmail"] = userInfo[2];

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

    string[] emailLoginCheck(SqlConnection conn)
    {
        string emailSql = "SELECT username, userid, emailaddress FROM Member WHERE EmailAddress=@Email AND Password=@Password";

        SqlCommand cmd = new SqlCommand(emailSql, conn);
        string[] userInfo = new string[3];

        cmd.Parameters.AddWithValue("@Email", txtbox_signIn_userID.Text);
        cmd.Parameters.AddWithValue("@Password", txtbox_signIn_userPassword.Text);

        SqlDataReader rd = cmd.ExecuteReader();

        if (rd.HasRows)
        {
            while (rd.Read())
            {
                userInfo[0] = rd["UserName"].ToString();
                userInfo[1] = rd["UserID"].ToString();
                userInfo[2] = rd["EmailAddress"].ToString();
            }


        }
        else
        {
            userInfo[0] = "";
        }
        rd.Close();
        return userInfo;
    }
}