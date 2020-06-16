<%@ Page Language="C#" AutoEventWireup="true" CodeFile="List.aspx.cs" Inherits="List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/List.css" rel="stylesheet"/>
    <script src="Scripts/bootstrap.min.js" ></script>
    <title></title>
</head>
<body>
    <form id="form_list" runat="server">
        <div class="container-fluid p-0 overflow-hidden">

            <div class="row min-vh-100 overflow-auto">
                <div class="col-md-2 col-lg-2 text-light" style="background-color : #0B3861">
                    <asp:Label ID="lbl_listTitle" runat="server" Text="문의사항" Font-Size="XX-Large" CssClass="pl-3 pb-3 font-weight-bold" Font-Bold="True"></asp:Label>
                    <div class="user-status">
                        <asp:Label ID="lbl_userStatus" runat="server" CssClass="dot ml-3"></asp:Label>
                        <asp:Label ID="lbl_username" runat="server" CssClass="ml-2 font-weight-bold"></asp:Label>
                    </div>
                    <div class="explain_login ml-3 mt-4">
                        <asp:Label ID="lbl_loginExplain" runat="server" Text="로그인 하시면 <br/> 문의게시판을 <br/>이용할 수 있습니다." Font-Size="Smaller"></asp:Label>
                    </div>
                    <div class="btn_logindiv">
                        <asp:Button ID="btn_login" runat="server" Text="로그인하기" CssClass="btn btn-success ml-3 mt-2 w-75" OnClick="btn_login_Click"/>
                    </div>
                    <div class="btn_exitdiv">
                        <asp:Button ID="btn_exit" runat="server" Text="돌아가기" CssClass="btn btn-danger ml-3 mt-2 w-75" OnClick="btn_exit_Click" />
                    </div>
                </div>
                <div class="col-md-10 col-lg-10 pl-0" style="background-color : #0B3861">
                    <div class="row w-100 justify-content-center    ">
                        <asp:GridView ID="gridView_list" runat="server" AutoGenerateColumns="False" DataSourceID="sqldataSource_list" Width="1100px" CssClass="mt-4 ml-4 table table-striped table-dark">
                            <Columns>
                                <asp:BoundField DataField="num" HeaderText="글번호" SortExpression="num">
                                    <HeaderStyle Width="10%" />
                                </asp:BoundField>                    
                                <asp:BoundField DataField="name" HeaderText="작성자" SortExpression="name">
                                    <HeaderStyle Width="20%" />
                                </asp:BoundField>
                    
                                <asp:TemplateField HeaderText="제목">
                                    <ItemTemplate>
                                        <%# SetSpace((int)Eval("depth")) %>
                                        <a href ="<%# "View.aspx?No=" + Eval("num") %>"><%# Eval("Title") %></a>
                                    </ItemTemplate>
                                    <HeaderStyle Width="40%" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="writedate" HeaderText="작성일" SortExpression="writedate">
                                    <HeaderStyle Width="15%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="readcount" HeaderText="조회수" SortExpression="readcount">
                                     <HeaderStyle Width="15%" />
                                </asp:BoundField>

                            </Columns>

                        </asp:GridView>
                 
                         <asp:SqlDataSource ID="sqldataSource_list" runat="server" ConnectionString="<%$ ConnectionStrings:InWordEditorConnectionString %>" SelectCommand="SELECT [num], [name], [id], [email], [title], [writedate], [readcount], [depth] FROM [QuestionBoard] ORDER BY [pos] DESC"></asp:SqlDataSource>
                    </div>
                    <div class="row w-100 justify-content-center mt-5">
                        
                       <asp:Button ID="btn_write" runat="server" Text="글쓰기" OnClick="btn_write_Click" CssClass="btn-success btn btn-lg"/>
                        
                    </div>
                 
            </div>

        </div>
        
        </div>
            
            
         
            
       
        
    </form>
</body>
</html>
