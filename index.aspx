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

<body style="background-color : #1C1C1C">
    <form id="form_index" runat="server"> 
        <div class="container-fluid pl-0 pr-0 ml-0 mr-0 text-white overflow-hidden">
            <nav class="navbar navbar-expand-lg justify-content-between pt-3 pb-3" style="background-color :  #151515">
                <span class="navbar-brand font-weight-bold text-light ml-5">InWordEditor</span>
                <asp:Button ID="btn_login" runat="server" Text="로그인" CssClass="btn btn-success mr-5" PostBackUrl="~/signIn.aspx" CausesValidation="False" />
            </nav>
            <div class="main" style="height : 85vh">
                <div class="row justify-content-md-center">
                    <div class="col-lg-5 col-md-5 d-flex align-items-center">
                        <div class="explain-area">
                            <h1 class="font-weight-bold">Write your document<br />Only the words<br />You want.</h1><br />
                            <p style="color : #A4A4A4">단어가 포함되어 있는 엑셀 문서를 불러와 <br />
                            엑셀 파일에 포함된 단어로만 <br />새로운 문서를 작성해보세요.</p>
                            <asp:Button ID="btn_noLoginStart" runat="server" Text="로그인 없이 체험" CssClass="btn mt-5 btn-block btn-primary btn-custom-h" CausesValidation="False" PostBackUrl="~/editor.aspx"/>
                        </div>
                        
                    </div>
                    <div class="col-lg-4 col-md-4 border bg-white rounded text-dark">
                        <div class="signUp-form"> 
                            <div class="form-group">
                                <label>사용자 ID</label>
                                <asp:TextBox ID="txtbox_signUp_userID" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="requireFieldValidator_userid" runat="server" ErrorMessage="ID를 입력하지 않으셨습니다." ControlToValidate="txtbox_signUp_userID" Display="Dynamic" CssClass="text-danger mt-1"></asp:RequiredFieldValidator>
                            </div>  
                            <div class="form-group">
                                <label>이메일</label>
                                <asp:TextBox ID="txtbox_signUp_userEmail" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="requireFieldValidator_userEmail" runat="server" ErrorMessage="이메일을 입력하지 않으셨습니다." ControlToValidate="txtbox_signUp_userEmail" Display="Dynamic" CssClass="text-danger mt-1"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="reqularExValidator_userEmail" runat="server" ErrorMessage="이메일 형식이 잘못되었습니다." ControlToValidate="txtbox_signUp_userEmail" Display="Dynamic" CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group mb-5">
                                <label>사용할 패스워드</label>
                                <asp:TextBox ID="txtbox_signUp_userPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="requireFieldValidator_userPassword" runat="server" ErrorMessage="패스워드를 입력하지 않으셨습니다." ControlToValidate="txtbox_signUp_userPassword" Display="Dynamic" CssClass="text-danger mt-1"></asp:RequiredFieldValidator><br />
                                <asp:RegularExpressionValidator ID="regularExVaildator_userPassword" runat="server" ErrorMessage="패스워드의 길이는 최소 8자 이상이여야 하며 최소 하나의 문자 및 숫자를 포함해야 합니다." ControlToValidate="txtbox_signUp_userPassword" Display="Dynamic" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" CssClass="text-danger"></asp:RegularExpressionValidator>
                            </div>
                            <asp:Button ID="btn_signUp" runat="server" Text="회원가입" CssClass="btn btn-block btn-success btn-custom-h" OnClick="btn_signUp_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
