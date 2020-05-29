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
        if (fileUpload_excelFile.HasFile)
        {
            File.Delete(Session["filepath"].ToString());
        }

        Session.Remove("filepath");
        Session.Remove("filename");
        Session.Remove("savePath");

        Server.Transfer("index.aspx");
    }

    protected void btn_callExcelFile_Click(object sender, EventArgs e)
    {
        // 가상 경로 문자열을 정적 경로로 변경해 반환
        Session["savePath"] = Server.MapPath("~/ForCheckExcelFile/");

        
        if (fileUpload_excelFile.HasFile)
        {

            Session["filename"] = fileUpload_excelFile.FileName;
            Session["filepath"] = Session["savePath"].ToString() + Session["filename"].ToString();

            // 만약에 똑같은 파일명이 있으면 
            fileUpload_excelFile.SaveAs(Session["filepath"].ToString());

            
            fileUpload_excelFile.Visible = false;

            lbl_uploadStatus.Text = "지정한 파일이 업로드 되었습니다.";
            lbl_uploadStatus.CssClass = "text-success ml-2";
            btn_checkWord.Visible = true;
            //callAlert(sender, "지정한 파일이 업로드 되었습니다.");

            Session["workbookObj"] = new WorkbookSetting();
                (Session["workbookObj"] as WorkbookSetting).selectExcelFile(Session["filepath"].ToString());
                (Session["workbookObj"] as WorkbookSetting).selectWorksheet();

            Session["worksheetReaderObj"] = new WorksheetReader(Session["workbookObj"] as WorkbookSetting);
            Session["wordDataInfo"] = (Session["worksheetReaderObj"] as WorksheetReader).getWordDataInfo();

            Session["words"] = (Session["wordDataInfo"] as DataInfo).getWords();

            var wordListString = String.Join(",", Session["words"] as List<string>);

            HttpCookie wordListCookie = new HttpCookie("wordList", wordListString);
            wordListCookie.Expires = DateTime.Now.AddDays(7);
            Response.Cookies.Add(wordListCookie);
            
        }
        else
        {
            lbl_uploadStatus.Text = "파일을 먼저 업로드 해주세요.";
            lbl_uploadStatus.CssClass = "text-danger ml-2";
            //callAlert(sender, "파일을 먼저 업로드 해주세요.");
        }
    }

    /*
    void callAlert(object sender, string message)
    {
        string alertMsg = "alert('" + message + "');";
        ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", alertMsg, true);
    }
    */

  
}