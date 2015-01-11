<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartBlog.Default" %>

<%@ Register Src="~/Controls/AdminTop.ascx" TagName="AdminTop" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/AdminFoot.ascx" TagName="AdminFoot" TagPrefix="uc2" %>
<%@ Register Src="~/Controls/Login.ascx" TagName="Login" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Images/Style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="headPart">
        <uc1:AdminTop ID="AdminTop1" runat="server" />
    </div>
    <div id="Main">
        <div id="leftPart">
            <div class="Mtitle">
                <h1>
                    博客列表
                </h1>
            </div>
            <div class="Mcontent">
                <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                <div class="BlogItem">
                    <div class="blogTitle">
                        <a href="PostDetail.aspx?id=<%#Eval("BID") %>"> 
                       <%#Eval("PostTitle")%></a>
                    </div>
                    <div class="BlogContent">
                    <!--格式化输出html文本
                    #表示数据绑定
                    -->
                    <%#Server.HtmlDecode(Eval("BContent","{0}"))%>
                    </div>
                    <div class="memo">
                        <div class="author">
                        <%#Eval("Author")%>
                        </div>
                        <div class="blogTime">
                         <%#Eval("AddDateTime")%>
                           
                        </div>
                    </div>
                </div>
                </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div id="rightPart">
            <table style="width: 100%;">
                <tr>
                    <td>
                        <uc3:Login ID="Login1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="footPart">
        <uc2:AdminFoot ID="AdminFoot1" runat="server" />
    </div>
 
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="AddPost.aspx">发表博客</asp:LinkButton>
    </form>
</body>
</html>
