using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
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
            if (!string.IsNullOrEmpty(Session["username"] as string))
            {
                // 로그인 된 사람이 있을 경우
                lbl_username.Text = Session["username"].ToString();
                lbl_userStatus.CssClass = "dot ml-3";
                lbl_loginExplain.Visible = false;
                btn_login.Visible = false;
                //htmlEditorEx_editor.Enabled = true;
            }
            else
            {
                // 비회원 사용일 경우

                lbl_username.Text = "Guest";
                lbl_userStatus.CssClass = "guestDot ml-3";
                lbl_loginExplain.Visible = true;
                btn_login.Visible = true;
                //htmlEditorEx_editor.Enabled = false;

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
        Session.Remove("workbookObj");
        Session.Remove("worksheetReaderObj");
        Session.Remove("wordDataInfo");
        Session.Remove("words");

        // 다 쓰고 나서 쿠키 삭제
        Response.Cookies.Remove("wordList");

        Server.Transfer("index.aspx");
    }

    protected void btn_callExcelFile_Click(object sender, EventArgs e)
    {

        // 가상 경로 문자열을 정적 경로로 변경해 반환
        Session["savePath"] = Server.MapPath("~/ForCheckExcelFile/");


        if (fileUpload_excelFile.HasFile)
        {
            btn_callExcelFile.Visible = false;

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

            string wordString = String.Join(",", (Session["words"] as List<string>).ToArray());
            ClientScript.RegisterStartupScript(this.GetType(), "setWord", String.Format("setWord('{0}')", wordString), true);
            

            /*
            // cookie 로 저장하기 위한 과정
            // 쿠키 사이즈 4096byte 제한으로 인한 두개로 나눔
            string wordListString_1 = "";
            string wordListString_2 = "";

            int wordCnt = (Session["words"] as List<string>).Count;
            StringBuilder stringBuilder_1 = new StringBuilder();
            StringBuilder stringBuilder_2 = new StringBuilder();    
            for(int cnt = 0; cnt < wordCnt; cnt++)
            {

                if(cnt <= wordCnt / 2)
                {
                    if(cnt == wordCnt / 2)
                    {
                        stringBuilder_1.Append((Session["words"] as List<string>)[cnt]);
                    }
                    stringBuilder_1.Append((Session["words"] as List<string>)[cnt] + ',');
                }
                else if (cnt >= wordCnt / 2)
                {
                    if(cnt == wordCnt)
                    {
                        stringBuilder_2.Append((Session["words"] as List<string>)[cnt]);
                    }
                    stringBuilder_2.Append((Session["words"] as List<string>)[cnt] + ',');
                }

            }

            wordListString_1 = stringBuilder_1.ToString();
            wordListString_2 = stringBuilder_2.ToString();

            
            HttpCookie wordList_1 = new HttpCookie("wordList_1");
            wordList_1.Value = wordListString_1;
            wordList_1.Expires = DateTime.Now.AddDays(1);
            wordList_1.HttpOnly = false;
            wordList_1.Secure = true;
            wordList_1.Domain = "editor.com";
           
            Response.Cookies.Add(wordList_1);

            

            
            
            
            HttpCookie wordList_2 = new HttpCookie("wordList_2");
            wordList_2.Value = wordListString_2;
            wordList_2.Expires = DateTime.Now.AddDays(1);
            wordList_2.HttpOnly = false;
            wordList_2.Secure = true;
            wordList_2.Domain = "editor.com";
            Response.Cookies.Add(wordList_2);
            */






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



    protected void btn_outputWord_Click(object sender, EventArgs e)
    {


    }

    /*
    protected void btn_checkWord_Click(object sender, EventArgs e)
    {
        string words = string.Join(",", (Session["words"] as List<string>).ToArray());

        ClientScript.RegisterClientScriptBlock(this.GetType(), "checkword", string.Format("checkWord('{0}');", words), true);

       
    }
    */
}