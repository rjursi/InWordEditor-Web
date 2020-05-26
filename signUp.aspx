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
<body style="background-color : #1C1C1C">
    <form id="form_signUp" runat="server">
        <div class="container-fluid p-0 min-vh-100 overflow-hidden">
            <div class="row min-vh-100 justify-content-md-center align-items-center">
                <div class="col-lg-4 col-md-4 border bg-white rounded">
                    <div class="signUp-form">
                        <div class="form-group">
                            <asp:Label ID="lbl_title" runat="server" Text="회원가입" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                        </div>
                        <div class="form-group">    
                            <label>사용자 ID</label>
                            <div class="row">
                                <div class="col-md-8">
                                   <asp:TextBox ID="txtbox_signUp_userID" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <asp:Button ID="btn_idDubCheck" runat="server" Text="중복 검사" CssClass="btn btn-primary w-100" OnClick="btn_idDubCheck_Click" CausesValidation="False" />
                                </div>
                            </div>
                            <asp:Label ID="lbl_userIDCheck" runat="server"></asp:Label>
                            <asp:RequiredFieldValidator ID="requireFieldValidator_signUpPage_userID" runat="server" ErrorMessage="사용할 ID를 입력해주세요." ControlToValidate="txtbox_signUp_userID" CssClass="text-danger mt-2"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>사용자 이름</label>
                            
                               <asp:TextBox ID="txtbox_signUp_userName" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="requireFieldValidator_signUpPage_userName" runat="server" ErrorMessage="사용자 이름을 입력해주세요." ControlToValidate="txtbox_signUp_userName" CssClass="text-danger mt-2"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lbl_password" runat="server" Text="패스워드"></asp:Label>
                                <asp:TextBox ID="txtbox_signUp_userPassword" runat="server" CssClass="form-control mt-2" TextMode="Password" OnPreRender="txtbox_signUp_userPassword_PreRender"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="requireFieldValidator_userPassword" runat="server" ErrorMessage="패스워드를 입력하지 않으셨습니다." ControlToValidate="txtbox_signUp_userPassword" Display="Dynamic" CssClass="text-danger mt-2"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regularExVaildator_userPassword" runat="server" ErrorMessage="패스워드의 길이는 최소 8자 이상이여야 하며 최소 하나의 문자 및 숫자를 포함해야 합니다." ControlToValidate="txtbox_signUp_userPassword" Display="Dynamic" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" CssClass="text-danger mt-2"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <label>이메일 주소</label>
                            <div class="row">
                                <div class="col-md-4 pr-0">
                                    <asp:TextBox ID="txtbox_signUp_userEmailID" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                                </div>
                                <div class="col-md-4 pl-0 pr-0">
                                    <div class="input-group">
                                        <div class="input-group-append">
                                            <div class="input-group-text">@</div>
                                        </div>
                                        <asp:TextBox ID="txtbox_signUp_userEmailAddress" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4 pl-0">
                                    <div class="input-group">
                                        <asp:DropDownList ID="ddList_emailAddress" CssClass="w-100 form-control" runat="server" OnSelectedIndexChanged="ddList_emailAddress_SelectedIndexChanged" AutoPostBack="True">
                                            <asp:ListItem>선택</asp:ListItem>
                                            <asp:ListItem>gmail.com</asp:ListItem>
                                            <asp:ListItem>naver.com</asp:ListItem>  
                                            <asp:ListItem>daum.net</asp:ListItem>                                            
                                            <asp:ListItem>직접 입력</asp:ListItem>
                                            
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <asp:Button ID="btn_emailDubCheck" runat="server" Text="이메일 주소 중복 체크" CssClass="mt-2 btn btn-primary w-100" OnClick="btn_emailDubCheck_Click" CausesValidation="False"/>
                            <asp:Label ID="lbl_emailDubCheck" runat="server"></asp:Label>
                            <asp:RequiredFieldValidator ID="requiredFieldValidator_signUpPage_userEmailID" runat="server" Display="Dynamic" ControlToValidate="txtbox_signUp_userEmailID" ErrorMessage="이메일 ID를 입력하지 않으셨습니다.<br/>" CssClass="text-danger mt-2"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="requiredFieldValidator_signUpPage_userEmailAddress" runat="server" Display="Dynamic" ControlToValidate="txtbox_signUp_userEmailAddress" ErrorMessage="이메일 주소를 입력하지 않으셨습니다." CssClass="text-danger mt-2"></asp:RequiredFieldValidator>

                        </div>

                        <div class="form-group mt-5">
                            <asp:Label ID="lbl_title_newInfo" runat="server" Text="추가정보" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label>핸드폰 번호</label>
                                
                                
                             <div class="row">
                                <div class="col-md-4 pr-0">
                                    <div class="input-group">
                                        <asp:DropDownList ID="ddList_phoneNum_1" runat="server" CssClass="w-75">
                                            <asp:ListItem>010</asp:ListItem>
                                            <asp:ListItem>011</asp:ListItem>
                                            <asp:ListItem>017</asp:ListItem>
                                        </asp:DropDownList>
                                        <div class="input-group-append">
                                            <div class="input-group-text">-</div>
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <div class="col-md-4 pl-0 pr-1">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtbox_userPhoneNum_2" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                                        <div class="input-group-append">
                                            <div class="input-group-text">-</div>
                                        </div>
                                    </div>
                                </div>
                                  
                                <div class="col-md-4 pl-0">
                                    <asp:TextBox ID="txtbox_userPhoneNum_3" runat="server" CssClass="form-control" TextMode="SingleLine" ></asp:TextBox>
                                </div>

                                <asp:RequiredFieldValidator ID="requiredValidation_phoneNum_2" runat="server" ErrorMessage="휴대폰 번호 두번째 자리를 입력하지 않았습니다. <br/>" CssClass="text-danger ml-3 mt-2" ControlToValidate="txtbox_userPhoneNum_2" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="requiredValidation_phoneNum_3" runat="server" ErrorMessage="휴대폰 번호 세번째 자리를 입력하지 않았습니다." CssClass="text-danger ml-3"  ControlToValidate="txtbox_userPhoneNum_3" Display="Dynamic"></asp:RequiredFieldValidator>
                             </div>
                            
                        </div>
                        
                        <div class="form-group pb-5">
                            <label>주소</label>
                            <div class="row">

                                <div class="col-md-4 pr-1">
                                    <div class="input-group">
                                        <asp:DropDownList ID="ddList_address" runat="server" CssClass="w-100 form-control" AutoPostBack="True" OnSelectedIndexChanged="ddList_address_SelectedIndexChanged"></asp:DropDownList>
                                        
                                    </div>
                                </div>
                                <div class="col-md-8 pl-0">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtbox_signUp_userAddress" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="주소 입력" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <asp:TextBox ID="txtbox_signUp_detailAddress" runat="server" CssClass="form-control mt-1 mb-2" TextMode="SingleLine" placeholder="상세 주소 입력"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="requiredFieldValidator_userAddress" runat="server" ErrorMessage="주소를 입력하지 않았습니다. <br/>" CssClass="text-danger" ControlToValidate="txtbox_signUp_userAddress" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="requiredFieldValidator_detailAddress" runat="server" ErrorMessage="상세 주소를 입력하지 않았습니다." CssClass="text-danger"  ControlToValidate="txtbox_signUp_detailAddress" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        
                        <asp:Button ID="btn_signUp" runat="server" Text="회원가입" CssClass="btn btn-block btn-success btn-custom-h" OnClick="btn_signUp_Click"/> 
                    </div>
                </div>        
            </div>
        </div>
    </form>
</body>
</html>
