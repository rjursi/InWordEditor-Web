<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/index.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js" ></script>
    
    <title>First InWordEditor</title>
</head>
<body>
    <form runat="server"> 
        <div class="container-fluid p-0">
            <nav class="navbar navbar-expand-lg navbar-dark bg-info justify-content-between">
                <span class="navbar-brand">InWordEditor</span>
                <asp:Button ID="btn_login" runat="server" Text="로그인" CssClass="btn btn-outline-secondary btn-success" />
            </nav>
            <div class="main">
                <div class="row justify-content-md-center ">
                    <div class="col-lg-5 col-md-5 d-flex align-items-center">
                        <div class="explain-area">
                            <h1>Write your document<br />Only the words<br />You want.</h1><br />
                            <p>단어가 포함되어 있는 엑셀 문서를 불러와 <br />
                            엑셀 파일에 포함된 단어로만 <br />새로운 문서를 작성해보세요.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 border">
                        <div class="login-form"> 
                            <div class="form-group">
                                <label>사용자 ID</label>
                                <asp:TextBox ID="txtbox_signUp_userID" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>이메일</label>
                                <asp:TextBox ID="txtbox_signUp_userEmail" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>사용할 패스워드</label>
                                <asp:TextBox ID="txtbox_signUp_usePassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            </div>
                            <asp:Button ID="btn_signUp" runat="server" Text="회원가입" CssClass="btn btn-block btn-success btn-custom-h"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
