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

        SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;" +
            "Initial Catalog=InWordEditor" +
            "Integrated Security=True");


        string sql = "INSERT INTO Member VALUES(@UserID, @EmailAddres, @Password, @PhoneNum, @Address)";
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
}