<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="SmartBlog.Controls.Login" %>
<style type="text/css">

        .style2
        {
            width: 50px;
        }
        .style1
        {
            width: 50px;
        }
        </style>
        <table style="width: 300px;">
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
                    密&nbsp;码</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp; 验证码</td>
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
                     <asp:Button ID="btnzhuce" runat="server" Text="注册"
                        style="height: 21px" OnClick="btnzhuce_Click" />
                </td>
            </tr>
        </table>
    
