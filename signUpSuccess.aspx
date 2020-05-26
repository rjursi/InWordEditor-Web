<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signUpSuccess.aspx.cs" Inherits="signUpSuccess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/signUpSuccess.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js" ></script>
    <title>회원가입 성공</title>
</head>
<body class="bg-success">
    <form id="form_signUpSuccess" runat="server">
        <div class="container-fluid p-0 min-vh-100 overflow-hidden">
            <div class="row min-vh-100 justify-content-md-center align-items-center">
                <div class="col-lg-4 col-md-4 border bg-white rounded">
                    <div class="success-form  text-center">
                        <div class="form-group mb-2">
                            <asp:Label ID="lbl_title" runat="server" Text="회원가입 성공!" Font-Bold="True" Font-Size="XX-Large" ></asp:Label>
                        </div>
                        <label class="pt-5 mb-5">반가워요!</label>
                        <asp:Label ID="lbl_userName" runat="server"></asp:Label>님!
                        <asp:Button ID="btn_signIn" runat="server" Text="로그인 하러 가기" CssClass="btn btn-block btn-success btn-custom-h" PostBackUrl="~/signIn.aspx" />
                        
                        
                    </div>
                </div>        
            </div>
        </div>
    </form>
</body>
</html>
