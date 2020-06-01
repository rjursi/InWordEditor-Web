<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editor.aspx.cs" Inherits="editor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/editor.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js" ></script>
    <!--<script src="Scripts/custom/editor.js"></script>-->

    
    <script language="javascript" type="text/javascript">
        


        function ExportToDocx() {

           

            var preHtml = "<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word' xmlns='http://www.w3.org/TR/REC-html40'><head><meta charset=\'utf-8\'></head><body>";
            var postHtml = "</body></html>";
            var html = preHtml + document.getElementById("div_editor").innerHTML + postHtml;

            var blob = new Blob(['\ufeff', html], {
                type: 'application/msword'
            });

            var url = 'data:application/vnd.ms-word;charset=utf-8,' + encodeURIComponent(html);

            var filename = 'document.doc';

            var downloadLink = document.createElement("a");

            document.body.appendChild(downloadLink);

            if (navigator.msSaveOrOpenBlob) {
                navigator.msSaveOrOpenBlob(blob, filename);
            } else {
                // Create a link to the file
                downloadLink.href = url;

                // Setting the file name
                downloadLink.download = filename;

                //triggering the function
                downloadLink.click();
            }

            document.body.removeChild(downloadLink);
        } 
            
        

        /*
        function alertTest() {
           alert(document.getElementById("div_editor").innerHTML);
        }

        
        */
        function setWord(words) {
            document.getElementById("words").value = words;
            
        }

        function checkWord() {

            var checkStringArray = document.getElementById("words").value.split(",");
            var inEditorString = document.getElementById("div_editor").innerHTML;
            var redColorStartTag = "<span style=\"color: #ff0000;\">";
            var redColorEndTag = "</span>";
         
            
            var myRegExp = /<(\/span|span)([^>]*)>/gim;

            inEditorString = inEditorString.replace(myRegExp, "");
            

            inEditorString = redColorStartTag + inEditorString + redColorEndTag;
            document.getElementById("div_editor").innerHTML = inEditorString;

            
           
            for (var i = 0; i < checkStringArray.length; i++) {
                var word = checkStringArray[i];
                var regex = new RegExp(word, "gimu");

                finded = inEditorString.indexOf(word);
                inEditorString = inEditorString.replace(regex, "<span style=\"color: #000000;\">" + word + "</span>");

                console.log(word);
                
            }

            
            document.getElementById("div_editor").innerHTML = inEditorString;            
            console.log("change Finished");

            alert("단어 유효성 검사가 완료되었습니다. \n빨간 글씨가 잇을 경우 필터링 목록에 해당되는 단어입니다.");
            
        }

        

    </script>
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
                            <asp:Button ID="btn_checkWord" runat="server" CssClass="btn btn-danger" Text="단어 유효성 확인" Visible="false" OnClientClick="checkWord(); return false;"/>    
                        </div>
                        
                       
                        <asp:Button ID="btn_outputWord" runat="server" Text="word 파일로 추출" CssClass="btn btn-primary ml-2" OnClientClick="ExportToDocx(); return false;" />
                        
                    </nav>
                   
                     
                        <div id="editor-container" >
                            <asp:Panel ID="panel_editor" runat="server"> 
                                <div id="editor_menu" style="padding : 10px">
                                    <asp:Button ID="btn_bold" runat="server" Text="굵게" OnClientClick="document.execCommand('bold'); return false;" CssClass="btn btn-primary" />
                                    <asp:Button ID="btn_underline" runat="server" Text="밑줄" OnClientClick="document.execCommand('underline'); return false;" CssClass="btn btn-secondary"/>
                                    <asp:Button ID="btn_insertUnorderedList" runat="server" Text="순서 없는 글머리 기호" OnClientClick=" document.execCommand('insertUnorderedList'); return false;" CssClass="btn btn-warning"/>
                                    <asp:Button ID="btn_redo" runat="server" Text="이전" OnClientClick="document.execCommand('redo'); return false;" CssClass="btn btn-info"/>
                                    <asp:Button ID="btn_undo" runat="server" Text="취소" OnClientClick="document.execCommand('undo'); return false;" CssClass="btn btn-danger" />
                                </div>
                            </asp:Panel> 
                            <div id="div_editor" contenteditable="true" spellcheck="false" style="height : 85vh" class="form-control bg-white"></div>
                        </div>
                         
                </div>
                
            </div>
        </div>
        <input type="hidden" id="words" value="" />
        
    </form>
    
</body>
</html>
