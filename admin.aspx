<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/List.css" rel="stylesheet"/>
    <script src="Scripts/bootstrap.min.js" ></script>
    <title>관리자 페이지</title>
</head>
<body>
    <form id="form_admin" runat="server">
        <div class="container-fluid p-0 overflow-hidden">
            <div class="row min-vh-100 overflow-auto">
                <div class="col-md-2 col-lg-2 text-light" style="background-color : #0B3861">
                    <asp:Label ID="lbl_listTitle" runat="server" Text="회원 관리" Font-Size="XX-Large" CssClass="pl-3 pb-3 font-weight-bold" Font-Bold="True"></asp:Label>
                    <div class="user-status">
                        <asp:Label ID="lbl_userStatus" runat="server" CssClass="dot ml-3"></asp:Label>
                        <asp:Label ID="lbl_username" runat="server" CssClass="ml-2 font-weight-bold"></asp:Label>
                    </div>
                    <asp:Button ID="btn_exit" runat="server" Text="나가기" CssClass="btn btn-danger ml-3 mt-2 w-75" OnClick="btn_exit_Click" />
                </div>
                <div class="col-md-10 col-lg-10 pl-0" style="background-color : #0B3861">
                     <div class="row w-100 justify-content-center">
                         <asp:GridView ID="gridView_userlist" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID,EmailAddress" DataSourceID="SqlDataSource1" Width="1100px" CssClass="mt-4 ml-4 table table-striped table-dark">
                             <Columns>
                                 <asp:BoundField DataField="UserID" HeaderText="사용자 ID" ReadOnly="True" SortExpression="UserID">
                                     <HeaderStyle Width="10%" />
                                 </asp:BoundField>
                                 <asp:BoundField DataField="EmailAddress" HeaderText="사용자 이메일" ReadOnly="True" SortExpression="EmailAddress">
                                     <HeaderStyle Width="20%" />
                                 </asp:BoundField>
                                 <asp:BoundField DataField="UserName" HeaderText="사용자명" SortExpression="UserName">
                                     <HeaderStyle Width="10%" />
                                 </asp:BoundField>
                                 <asp:BoundField DataField="Password" HeaderText="비밀번호" SortExpression="Password">
                                     <HeaderStyle Width="10%" />
                                 </asp:BoundField>
                                 <asp:BoundField DataField="PhoneNum" HeaderText="전화번호" SortExpression="PhoneNum">
                                     <HeaderStyle Width="15%" />
                                 </asp:BoundField>
                                 <asp:BoundField DataField="Address" HeaderText="주소" SortExpression="Address">
                                     <HeaderStyle Width="25%" />
                                 </asp:BoundField>
                             </Columns>

                         </asp:GridView>
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InWordEditorConnectionString2 %>" SelectCommand="SELECT * FROM [Member] WHERE ([UserID] NOT LIKE '%' + @UserID + '%')">
                             <SelectParameters>
                                 <asp:Parameter DefaultValue="dfg3790" Name="UserID" Type="String" />
                             </SelectParameters>
                         </asp:SqlDataSource>
                     </div>
                     <div class="row w-100 justify-content-center mb-5">
                         <asp:Label ID="lbl_deleteInfo" runat="server" Text="해당 사용자가 작성한 글도 같이 삭제됩니다." CssClass="text-warning font-weight-bold"></asp:Label>
                     </div>
                     <div class="row w-100 justify-content-center">
                         <asp:Label ID="lbl_inputID" runat="server" Text="탈퇴할 ID 입력" CssClass="text-white font-weight-bold" Font-Size="X-Large"></asp:Label>
                         <asp:TextBox ID="txtbox_inputID" runat="server" CssClass="form-control w-25 ml-5 mr-5"></asp:TextBox>
                         <asp:Button ID="btn_deleteUser" runat="server" CssClass="btn btn-danger" Text="회원 탈퇴" OnClick="btn_deleteUser_Click" />
                     </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
