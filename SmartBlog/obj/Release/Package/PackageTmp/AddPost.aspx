<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPost.aspx.cs" Inherits="SmartBlog.AddPost"
    ValidateRequest="false" %>

<%@ Register Src="Controls/AdminLeft.ascx" TagName="AdminLeft" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>发表博客</title>
    <link rel="shortcut icon" type="image/x-icon" href="Images/blog.ico" />
    <script src="ckeditor/ckeditor.js" type="text/javascript"></script>
    <style type="text/css">
        .ckeditor {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="100%">
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                标题：
                            </td>
                            <td>
                                <asp:TextBox ID="txtTitle" runat="server" Width="350px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                内容：
                            </td>
                            <td>
                                <asp:TextBox ID="txtContent" runat="server" Height="300px" TextMode="MultiLine" Width="100%"
                                    CssClass="ckeditor"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                标签
                            </td>
                            <td>
                                <asp:TextBox ID="txtTag" runat="server" Width="350px"></asp:TextBox>
                                *请以逗号隔开
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="btnPost" runat="server" OnClick="btnPost_Click" Text="发表" Style="width: 40px" />
                            </td>
                        </tr>
                    </table>
                    <%--        <script type="text/javascript">
            CKEDITOR.replace('txtContent');
        </script>--%>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
