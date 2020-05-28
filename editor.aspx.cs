using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class editor : System.Web.UI.Page
{
    bool isExcelFileLoaded = false;
    string savePath, filepath, filename;
    protected void Page_Load(object sender, EventArgs e)
    {

        
        if (!Page.IsPostBack)
        {
            if(!string.IsNullOrEmpty(Session["username"] as string))
            {
                // 로그인 된 사람이 있을 경우
                lbl_username.Text = Session["username"].ToString();
                lbl_userStatus.CssClass = "dot ml-3";
                lbl_loginExplain.Visible = false;
                btn_login.Visible = false;
            }
            else
            {
                // 비회원 사용일 경우

                lbl_username.Text = "Guest";
                lbl_userStatus.CssClass = "guestDot ml-3";
                lbl_loginExplain.Visible = true;
                btn_login.Visible = true;

            }
        }
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        Session["fromEditorLogin"] = "True";
        Server.Transfer("signIn.aspx");
    }

    protected void btn_exit_Click(object sender, EventArgs e)
    {
        

        
        // 임시로 저장한 파일을 다 사용하였으니 지움
        File.Delete(filepath);
        Server.Transfer("index.aspx");
    }

    protected void btn_callExcelFile_Click(object sender, EventArgs e)
    {
        // 가상 경로 문자열을 정적 경로로 변경해 반환
        savePath = Server.MapPath("~/ForCheckExcelFile/");

        
        if (fileUpload_excelFile.HasFile)
        {

            filename = fileUpload_excelFile.FileName;
            filepath = savePath + filename;

            // 만약에 똑같은 파일명이 있으면 
            fileUpload_excelFile.SaveAs(filepath);

            
            fileUpload_excelFile.Visible = false;

        }
        else
        {
            
            
        }
    }


  
}