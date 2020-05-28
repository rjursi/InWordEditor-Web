<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signIn.aspx.cs" Inherits="signIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/signIn.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js" ></script>
    
    <title>로그인</title>
</head>
<body style="background-color : #1C1C1C">
    <form id="form_signIn" runat="server">
        <div class="container-fluid p-0 min-vh-100 overflow-hidden">
            <div class="row min-vh-100 justify-content-md-center align-items-center">
                <div class="col-lg-4 col-md-4 border bg-white rounded">
                    <div class="login-form">
                        <div class="form-group mb-5">
                            <asp:Label ID="lbl_title" runat="server" Text="사용자 로그인" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                        </div>
                        <div class="form-group">    
                            <label>사용자 ID 혹은 이메일 주소</label>
                            <asp:TextBox ID="txtbox_signIn_userID" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="requiredValidator_userID" runat="server" CssClass="text-danger mt-1" ControlToValidate="txtbox_signIn_userID" ErrorMessage="로그인 할 ID 나 이메일 주소를 입력하지 않았습니다." Display="Dynamic"></asp:RequiredFieldValidator>

                        </div>
                        <div class="form-group">
                            <label>패스워드</label>
                            <asp:TextBox ID="txtbox_signIn_userPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="requiredVaildator_userPassword" runat="server" CssClass="text-danger mt-1 mb-5" ControlToValidate="txtbox_signIn_userPassword" ErrorMessage="패스워드를 입력하지 않으셨습니다." Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <asp:Label ID="lbl_loginFail" runat="server" CssClass="text-danger"></asp:Label>
                        <asp:Button ID="btn_signIn" runat="server" Text="로그인" CssClass="btn btn-block btn-success btn-custom-h" OnClick="btn_signIn_Click" />
                        <label class="pt-5">아직 회원이 아니신가요?</label>
                        <asp:LinkButton ID="linkBtn_signUp" runat="server" PostBackUrl="~/signUp.aspx" CausesValidation="False">여기를 눌러 회원가입 하세요</asp:LinkButton>
                    </div>
                </div>        
            </div>
        </div>
    </form>
</body>
</html>
