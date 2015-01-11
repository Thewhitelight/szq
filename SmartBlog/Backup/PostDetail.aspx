<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostDetail.aspx.cs" Inherits="SmartBlog.PostDetail" %>

<%@ Register src="Controls/AdminTop.ascx" tagname="AdminTop" tagprefix="uc1" %>

<%@ Register src="Controls/BlogComment.ascx" tagname="BlogComment" tagprefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Images/Style.css" rel="stylesheet" type="text/css" />
     <script type="text/JavaScript"  src="ViewCount.aspx?BID=<%=id %>"></script>
    <style type="text/css">
        .style1
        {
            width: 127px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
<div class="DetailBlog">
    <div class="BlogTop">
        
        <uc1:AdminTop ID="AdminTop1" runat="server" />
        
    </div>
    <div class="BlogContent">
        <div class="BlogTitle">
          
     <%=title %>
    
        </div>
        <div class="BlogInfo">
             
     作者：<%=author %> &nbsp;&nbsp;发表时间：<%=datetime%>&nbsp;&nbsp;浏览 <%=vCount+1%>次
 
        </div>
        <div class="ContentDetail">
        
    <%=Server.HtmlDecode(content) %>
   
        </div>
        <div class="Comment">
            <h1>评论
            </h1>
            
            <uc2:BlogComment ID="BlogComment2" runat="server" BlogID="2" />
            
            <uc2:BlogComment ID="BlogComment1" runat="server" />
            
            <table style="width: 100%;">
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                    <td>
                        &nbsp;
                        <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                        <asp:Button ID="btnSubmit" runat="server" Text="评论" onclick="btnSubmit_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>



    </form>
</body>
</html>
