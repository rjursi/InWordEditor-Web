<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editor.aspx.cs" Inherits="editor" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/editor.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js" ></script>


    <title>InWordEditor</title>
</head>
<body> 
    <form id="form_editor" runat="server">
       
        
        <asp:ScriptManager ID="scriptManager_editor" runat="server"></asp:ScriptManager>
        <div class="container-fluid p-0 overflow-hidden">
            <div class="row min-vh-100">
                <div class="col-md-2 col-lg-2 text-light" style="background-color : #0B3861">
                    <asp:Label ID="lbl_appTitle" runat="server" Text="InWordEditor" Font-Size="XX-Large" CssClass="pl-3 pb-3 font-weight-bold" Font-Bold="True"></asp:Label>
                    <div class="user-status">
                        <asp:Label ID="lbl_userStatus" runat="server" CssClass="dot ml-3"></asp:Label>
                        <asp:Label ID="lbl_username" runat="server" CssClass="ml-2 font-weight-bold"></asp:Label>
                    </div>
                    <div class="explain_login ml-3 mt-4">
                        <asp:Label ID="lbl_loginExplain" runat="server" Text="로그인 하시면 <br/> 에디터의 더 많은 기능을 <br/>이용할 수 있습니다." Font-Size="Smaller"></asp:Label>
                    </div>
                    <div class="btn_logindiv">
                        <asp:Button ID="btn_login" runat="server" Text="로그인하기" CssClass="btn btn-success ml-3 mt-2 w-75" OnClick="btn_login_Click" />
                    </div>
                    <div class="btn_exitdiv">
                        <asp:Button ID="btn_exit" runat="server" Text="나가기" CssClass="btn btn-danger ml-3 mt-2 w-75" OnClick="btn_exit_Click" />
                    </div>
                </div>
                
                <div class="col-md-10 col-lg-10 pl-0" style="background-color : #0B3861">
                    <nav class="navbar navbar-expand-lg navbar-dark bg-dark justify-content-between">   
                        <div>
                            <span class="navbar-brand">기능</span>
                            <asp:Button ID="btn_callExcelFile" runat="server" CssClass="btn btn-info mr-2" Text="불러온 엑셀파일 적용" OnClick="btn_callExcelFile_Click" />     
                            <asp:FileUpload ID="fileUpload_excelFile" runat="server"/>     
                            <asp:Label ID="lbl_uploadStatus" runat="server"></asp:Label>
                            
                        </div>
                        <asp:Button ID="btn_checkWord" runat="server" CssClass="btn btn-danger" Text="단어 유효성 확인" Visible="false"/>
                        <asp:Button ID="btn_outputWord" runat="server" Text="word 파일로 추출" CssClass="btn btn-primary ml-2" />
                        
                    </nav>
                    <div class="form-group bg-white" style="height : 85vh">
                        <asp:TextBox ID="txtbox_editor" runat="server" TextMode="MultiLine" CssClass="form-control h-100 mt-3 bg-white"></asp:TextBox>
                        <ajaxToolkit:HtmlEditorExtender ID="htmlEditorEx_editor" runat="server" EnableSanitization="true" TargetControlID="txtbox_editor" Enabled="true"></ajaxToolkit:HtmlEditorExtender>
                    </div>
                </div>
                
            </div>
        </div>
       
    </form>
</body>
</html>
