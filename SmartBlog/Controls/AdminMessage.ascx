<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminMessage.ascx.cs" Inherits="SmartBlog.Controls.AdminMessage" %>
<table class="menu">
    <tr>
        <td class="title">网站管理
        </td>
    </tr>
    <tr>
        <td class="menuItem">
            <ul>
                <li><a href="../Default.aspx">主页</a></li>
                <li><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">博客名称</asp:LinkButton></li>
                <li><a href="../MyLinks.aspx">编辑友链</a></li>
            </ul>
        </td>
    </tr>
    <tr>
        <td class="title">博文操作
        </td>
    </tr>
    <tr>
        <td class="menuItem">
            <ul>

                <li><a href="../AddPost.aspx">添加博客</a></li>
                <li><a href="../PostList.aspx">编辑博文</a></li>
            </ul>
        </td>
    </tr>
    <tr>
        <td class="title">用户管理
        </td>
    </tr>
    <tr>
        <td class="menuItem">
            <ul>
                <li><a href="../UserList.aspx">删除用户</a></li>
            </ul>
        </td>
    </tr>


    <tr>
        <td class="title">版权信息
        </td>
    </tr>
    <tr>
        <td>SmartBlog V3.0
        </td>
    </tr>
</table>
