<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signUp.aspx.cs" Inherits="signUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/signUp.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js" ></script>
    
    <title>회원가입</title>
</head>
<body>
    <form id="form_signUp" runat="server">
        <div class="container-fluid p-0 min-vh-100">
            <div class="row min-vh-100 justify-content-md-center align-items-center">
                <div class="col-lg-4 col-md-4 border">
                    <div class="signUp-form">
                        <div class="form-group">
                            <asp:Label ID="lbl_title" runat="server" Text="회원가입" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                        </div>
                        <div class="form-group">    
                            <label>사용자 ID</label>
                            <asp:TextBox ID="txtbox_signIn_userID" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>패스워드</label>
                                <asp:TextBox ID="txtbox_signIn_userPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>이메일 주소</label>
                            <div class="row">
                                <div class="col-md-5">
                                    <asp:TextBox ID="txtbox_userEmailID" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                                </div>
                                <div class="col-md-7 pl-0">
                                    <div class="input-group">
                                        <div class="input-group-append">
                                            <div class="input-group-text">@</div>
                                        </div>
                                        <asp:TextBox ID="txtbox_userEmailAddress" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mt-5">
                            <asp:Label ID="lbl_title_newInfo" runat="server" Text="추가정보" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label>핸드폰 번호</label>
                                
                                
                             <div class="row">
                                <div class="col-md-4 pr-0">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtbox_userPhoneNum_1" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                                        <div class="input-group-append">
                                            <div class="input-group-text">-</div>
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <div class="col-md-4 px-0">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtbox_userPhoneNum_2" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                                        <div class="input-group-append">
                                            <div class="input-group-text">-</div>
                                        </div>
                                    </div>
                                </div>
                                  
                                <div class="col-md-4 pl-0">
                                    <asp:TextBox ID="txtbox_userPhoneNum_3" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                                </div>

                             </div>
                          
                        </div>
                        
                        <div class="form-group pb-5">
                            <label>주소</label>
                            <asp:TextBox ID="txtbox_userAddress" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                        </div>
                        
                        <asp:Button ID="btn_signIn" runat="server" Text="회원가입" CssClass="btn btn-block btn-success btn-custom-h" /> 
                    </div>
                </div>        
            </div>
        </div>
    </form>
</body>
</html>
