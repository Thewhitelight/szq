<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminLeft.ascx.cs" Inherits="SmartBlog.Controls.AdminLeft" %>
<table class="menu">
    <tr>
        <td class="title">博文列表
        </td>
    </tr>
    <tr>
        <td class="menuItem">
            <ul>
                <%=outputStream%>

            </ul>
        </td>
    </tr>
    <tr>
        <td class="title">博文存档
        </td>
    </tr>
    <tr>
        <td class="menuItem">
            <ul>
               <%=outputTime%>
            </ul>
        </td>
    </tr>
    <tr>
        <td class="title">友情链接
        </td>
    </tr>
    <tr>
        <td class="menuItem">
            <ul>
               <%=outputLinks%>
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
