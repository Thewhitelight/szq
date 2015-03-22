<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminSignIn.aspx.cs" Inherits="OSHGTP.AdminSignIn" %>

<%@ Register Src="~/Control/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/Control/LeftMain.ascx" TagPrefix="uc1" TagName="LeftMain" %>
<%@ Register Src="~/Control/Right.ascx" TagPrefix="uc1" TagName="Right" %>
<%@ Register Src="~/Control/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>





<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>管理员登录</title>
    <style type="text/css">
        body {
            margin: 0 auto;
            width: 998px;
        }

        .style2 {
            width: 50px;
        }

        .style1 {
            width: 50px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <uc1:Header runat="server" ID="Header" />
            <div class="zuo">
                <uc1:LeftMain runat="server" ID="LeftMain" />
            </div>
            <div class="zhong">
                <table style="width: 300px;">
                    <tr>
                        <td class="style2">&nbsp;
                    用户名</td>
                        <td class="style2">
                            <asp:TextBox ID="txtUserName" runat="server" Width="150px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;
                    密&nbsp;码</td>
                        <td>
                            <asp:TextBox ID="txtPassWord" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>&nbsp;
                        </td>
                        <td>&nbsp;
                    <asp:Button ID="btnSignIn" runat="server" Text="登录" OnClick="btnSignIn_Click" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="you">
                <uc1:Right runat="server" ID="Right" />
            </div>
            <div style="margin-top: 602px;">
                <uc1:Footer runat="server" ID="Footer" />
            </div>
        </div>
    </form>
</body>
</html>
