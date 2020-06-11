<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Write.aspx.cs" Inherits="Write" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet"/>
    <script src="Scripts/bootstrap.min.js" ></script>
    <link href="css/Modify.css" rel="stylesheet"/>
    <title></title>
</head>
<body>
    <form id="form_write" runat="server">
        <div class ="container-fluid p-0 overflow-hidden">
            <div class="row min-vh-100">
                <div class="col-md-2 col-lg-2 text-light" style="background-color : #1C1C1C">
                    <asp:Label ID="lbl_writeTitle" runat="server" Text="글 쓰기" Font-Size="XX-Large" CssClass="pl-3 pt-3 font-weight-bold" Font-Bold="True"></asp:Label>
                    <div class="user-status">
                        <asp:Label ID="lbl_userStatus" runat="server" CssClass="dot ml-3"></asp:Label>
                        <asp:Label ID="lbl_useUserName" runat="server" CssClass="ml-2 font-weight-bold"></asp:Label>
                    </div>
                </div>
                <div class="col-md-10 col-lg-10 pl-0" style="background-color : #1C1C1C">
                    <div class="row w-100 mt-5">
                        <asp:Label ID="lbl_writerHeader" runat="server" Text="&nbsp;작성자" CssClass="text-white font-weight-bold mr-5" Font-Size="X-Large"></asp:Label>
                        <div class="form-group">
                            <asp:Label ID="lbl_username" runat="server" CssClass="w-auto text-white-50"></asp:Label>
                        </div>
                    </div>
                    <div class="row w-100">
                        <asp:Label ID="lbl_titleHeader" runat="server" Text="글 제목" CssClass="text-white font-weight-bold mr-5" Font-Size="X-Large"></asp:Label>
                        <div class="form-group w-75">
                            <asp:TextBox ID="txtbox_contentTitle" runat="server" CssClass="form-control ml-0 w-100"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row w-100">
                        <asp:Label ID="lbl_contentHeader" runat="server" Text="글 내용" CssClass="text-white font-weight-bold mr-5" Font-Size="X-Large"></asp:Label>
                        <div class="form-group w-75">
                            <asp:TextBox ID="txtbox_content" runat="server" Width="100%" Height="500px" TextMode="MultiLine" Wrap="True" CssClass="form-control ml-0"></asp:TextBox> 
                        </div>
                    </div>
                    <div class="row w-100 ml-5">
                        <asp:Button ID="btn_submitContent" Text="게시물 등록" runat="server" CssClass="btn btn-success btn-lg ml-5 mr-3" OnClick="btn_submitContent_Click" />
                         <asp:Button ID="btn_list" Text="목록" runat="server" CssClass="btn btn-info btn-lg" OnClick="btn_list_Click" />
                    </div>
                </div>
            </div>
        </div>


        
    </form>
</body>
</html>
