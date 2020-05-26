using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class signUp : System.Web.UI.Page
{
    string[] cityArray = { "선택","서울특별시", "인천광역시", "경기도", "강원도", "충청남도", "세종특별자치시", "대전광역시", "충청북도", "경상북도", "전라북도", "대구광역시", "광주광역시", "전라남도", "경상남도", "부산광역시", "울산광역시", "제주특별자치도" };

    bool isIDDuplicate = false;
    bool isEmailDuplicate = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {

            
            txtbox_signUp_userAddress.ReadOnly = true;
            txtbox_signUp_detailAddress.ReadOnly = true;

            ListItemCollection items = new ListItemCollection();

            foreach (string cityname in cityArray)
            {
                items.Add(new ListItem(cityname, cityname));
            }

            ddList_address.DataSource = items;
            ddList_address.DataBind();
                
            if (Session["userID"] != null)
            {

                string[] emailSplitArray;

                emailSplitArray = Session["userEmail"].ToString().Split(new char[] { '@' });
                txtbox_signUp_userID.Text = Session["userID"].ToString();
                txtbox_signUp_userPassword.Text = Session["userPassword"].ToString();
                txtbox_signUp_userEmailID.Text = emailSplitArray[0];
                txtbox_signUp_userEmailAddress.Text = emailSplitArray[1];


                txtbox_signUp_userID.ReadOnly = true;
                txtbox_signUp_userPassword.Visible = false;
                lbl_password.Visible = false;
                txtbox_signUp_userEmailID.ReadOnly = true;
                txtbox_signUp_userEmailAddress.ReadOnly = true;


                Session.Remove("userID");
                Session.Remove("userPassword");
                Session.Remove("userEmail");
            }
        }
    }

    protected void btn_signUp_Click(object sender, EventArgs e)
    {
        // 회원가입 버튼
        

        if(isEmailDuplicate == true || isIDDuplicate == true)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('아이디나 이메일 중복을 확인해주세요.')", true);
            return;
        }


        SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;" +
            "Initial Catalog=InWordEditor;" +
            "Integrated Security=True");


        string sql = "INSERT INTO Member VALUES(@UserID, @EmailAddress,@UserName, @Password, @PhoneNum, @Address)";

        SqlCommand cmd = new SqlCommand(sql, conn);
        cmd.Parameters.AddWithValue("@UserID", txtbox_signUp_userID.Text);


        string email = txtbox_signUp_userEmailID.Text + "@" + txtbox_signUp_userEmailAddress.Text;
        cmd.Parameters.AddWithValue("@EmailAddress", email);

        cmd.Parameters.AddWithValue("@UserName", txtbox_signUp_userName.Text);
        cmd.Parameters.AddWithValue("@Password", txtbox_signUp_userPassword.Text);

        string phoneNum = ddList_phoneNum_1.SelectedValue + '-' + txtbox_userPhoneNum_2.Text + '-' + txtbox_userPhoneNum_3.Text;
        cmd.Parameters.AddWithValue("@PhoneNum", phoneNum);

        string address = ddList_address.SelectedValue + " " + txtbox_signUp_userAddress.Text + " " + txtbox_signUp_detailAddress.Text;
        cmd.Parameters.AddWithValue("@Address", address);

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        Session["userName"] = txtbox_signUp_userName.Text;
        Server.Transfer("signUpSuccess.aspx");
    }

    protected void ddList_emailAddress_SelectedIndexChanged(object sender, EventArgs e)
    {
      

        if (ddList_emailAddress.SelectedIndex == 0)
        {
            txtbox_signUp_userEmailAddress.Text = "";
            txtbox_signUp_userEmailAddress.ReadOnly = true;
        }
        else if (ddList_emailAddress.SelectedIndex == 4)
        {
            txtbox_signUp_userEmailAddress.ReadOnly = false;
            txtbox_signUp_userEmailAddress.Text = "";
        }
        else
        {
            txtbox_signUp_userEmailAddress.ReadOnly = false;
            txtbox_signUp_userEmailAddress.Text = ddList_emailAddress.SelectedValue;
            txtbox_signUp_userEmailAddress.ReadOnly = true;
        }


        
    }

    protected void ddList_address_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddList_address.SelectedIndex == 0)
        {
            txtbox_signUp_userAddress.Text = "";
            txtbox_signUp_detailAddress.Text = "";
            txtbox_signUp_userAddress.ReadOnly = true;
            txtbox_signUp_detailAddress.ReadOnly = true;
        }
        else
        {
            txtbox_signUp_userAddress.ReadOnly = false;
            txtbox_signUp_detailAddress.ReadOnly = false;
        }
    }

    protected void btn_idDubCheck_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;" +
           "Initial Catalog=InWordEditor;" +
           "Integrated Security=True");


        string sql = "SELECT UserID FROM Member WHERE UserID = @UserID";

        SqlCommand cmd = new SqlCommand(sql, conn);
        cmd.Parameters.AddWithValue("@UserID", txtbox_signUp_userID.Text);

        conn.Open();
        SqlDataReader rd = cmd.ExecuteReader();

        if (rd.HasRows)
        {
            lbl_userIDCheck.Text = "이미 사용중인 아이디 입니다.";
            lbl_userIDCheck.CssClass = "text-danger";
            isIDDuplicate = true;
        }
        else
        {
            lbl_userIDCheck.Text = "사용 가능한 아이디 입니다.";
            lbl_userIDCheck.CssClass = "text-success";
            isIDDuplicate = false;
        }

        rd.Close();
        conn.Close();


    }



    protected void btn_emailDubCheck_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;" +
            "Initial Catalog=InWordEditor;" +
            "Integrated Security=True");


        string sql = "SELECT EmailAddress FROM Member WHERE EmailAddress = @EmailAddress";

        SqlCommand cmd = new SqlCommand(sql, conn);
        string emailAddress = txtbox_signUp_userEmailID + "@" + txtbox_signUp_userEmailAddress;
        cmd.Parameters.AddWithValue("@EmailAddress", emailAddress);

        conn.Open();
        SqlDataReader rd = cmd.ExecuteReader();

        if (rd.HasRows)
        {
            lbl_emailDubCheck.Text = "이미 사용중인 이메일 입니다.";
            lbl_emailDubCheck.CssClass = "text-danger";
            isEmailDuplicate = true;
        }
        else
        {
            lbl_emailDubCheck.Text = "사용 가능한 이메일 주소 입니다.";
            lbl_emailDubCheck.CssClass = "text-success";
            isEmailDuplicate = false;
        }

        rd.Close();
        conn.Close();

    }

    protected void txtbox_signUp_userPassword_PreRender(object sender, EventArgs e)
    {
        txtbox_signUp_userPassword.Attributes.Add("value", txtbox_signUp_userPassword.Text);
    }
}