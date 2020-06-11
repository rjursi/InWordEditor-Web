<%@ Page Language="C#" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="View" %>

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
    <form id="form_view" runat="server">
        <div class ="container-fluid p-0 overflow-hidden">
            <div class="row min-vh-100">
                <div class="col-md-2 col-lg-2 text-light" style="background-color : #1C1C1C">
                    <asp:Label ID="lbl_modifyTitle" runat="server" Text="글 보기" Font-Size="XX-Large" CssClass="pl-3 pt-3 font-weight-bold" Font-Bold="True"></asp:Label>
                    <div class="user-status">
                        <asp:Label ID="lbl_userStatus" runat="server" CssClass="dot ml-3"></asp:Label>
                        <asp:Label ID="lbl_username" runat="server" CssClass="ml-2 font-weight-bold"></asp:Label>
                    </div>
                </div>
                <div class="col-md-10 col-lg-10 pl-0" style="background-color : #1C1C1C">
                    <div class="row w-75 mt-5">
                        <asp:Label ID="lbl_writerHeader" runat="server" Text="작성자 :&nbsp;" CssClass="text-white font-weight-bold"></asp:Label>
                        <asp:Label ID="lbl_writer" runat="server" CssClass="text-white-50 mr-2"></asp:Label>
                        <asp:Label ID="lbl_writeDateHeader" runat="server" Text="작성일 :&nbsp;" CssClass="text-white font-weight-bold"></asp:Label>
                        <asp:Label ID="lbl_writeDate" runat="server" CssClass="text-white-50 mr-2"></asp:Label>
                        <asp:Label ID="lbl_readcountHeader" runat="server" Text="조회수 :&nbsp;" CssClass="text-white font-weight-bold"></asp:Label>
                        <asp:Label ID="lbl_readcount" runat="server" CssClass="text-white-50 mr-2"></asp:Label>
                    </div>
                    <div class="row w-75 mt-3">
                        <asp:Label ID="lbl_contentTitle" runat="server" CssClass="text-white font-weight-bold" Font-Size="X-Large"></asp:Label>
                    </div>
                    <div class="row w-75 mt-3">
                        <asp:TextBox ID="txtbox_content" runat="server" Width="100%" Height="500px" TextMode="MultiLine" Wrap="True" ReadOnly="True"></asp:TextBox>
                    </div>
                    <div class="row w-75 mt-3">
                        <div style="float : left">
                            <asp:Button ID="btn_update" runat="server" Text="수정" CssClass="btn btn-success btn-lg mr-2" OnClick="btn_update_Click"  />
                            <asp:Button ID="btn_delete" runat="server" Text="삭제" CssClass="btn btn-danger btn-lg mr-2" OnClick="btn_delete_Click"  />
                        </div>
                        <div style="float : right">

                           <asp:Button ID="btn_submitReply" runat="server" Text="답변 등록" CssClass="btn btn-primary btn-lg mr-2" OnClick="btn_submitReply_Click"/>
                           <asp:Button ID="btn_viewList" runat="server" Text="목록 보기" CssClass="btn btn-secondary btn-lg" OnClick="btn_viewList_Click" />
                        </div>
                        <div>
                            <asp:Label ID="lbl_refer" runat="server" Visible = "false"></asp:Label>
                            <asp:Label ID="lbl_depth" runat="server" Visible = "false"></asp:Label>
                            <asp:Label ID="lbl_pos" runat="server" Visible = "false"></asp:Label>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </form>
</body>
</html>
