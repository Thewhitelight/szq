<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SmartBlog.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            height: 20px;
        }
        .style2
        {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>
        用户登录
        </h1>
        <table style="width: 100%;">
            <tr>
                <td class="style2">
                    &nbsp;
                    用户名</td>
                <td class="style2">
                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                    密&nbsp; 码</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;&nbsp;验证码</td>
                <td class="style1">
                    <asp:TextBox ID="txtValidCode" runat="server"></asp:TextBox>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/ValidateCode.aspx" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                    <asp:Button ID="btnLogin" runat="server" Text="登录" onclick="btnLogin_Click" 
                        style="height: 21px" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
