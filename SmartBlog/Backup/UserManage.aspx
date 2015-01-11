<%@ Page Title="" Language="C#" MasterPageFile="~/Manage.Master" AutoEventWireup="true"
    CodeBehind="UserManage.aspx.cs" Inherits="SmartBlog.UserManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
    <table style="width: 100%;">
        <thead>
            <tr>
                <td>
                    用户名
                </td>
                <td>
                    邮箱
                </td>
                <td>
                    注册时间
                </td>
                <td>
                    操作
                </td>
            </tr>
        </thead>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <tr>
                    <td>
                        <%--Eval是单向的,Bind是双向的.就是说用Eval绑定的数据不会自动回发到服务端,而用Bind绑定的数据可以自动回发到服务端去!
                        --%>
                        <%#Eval("UserName")%>
                    </td>
                    <td>
                        <%#Eval("Email")%>
                    </td>
                    <td>
           <%--             <%#Eval("AddDateTime")%>--%>
                        <%# DataBinder.Eval(Container.DataItem, "AddDateTime", "{0:d}")%>
                    </td>
                    <td>
                        <a href="EditUser.aspx?id='<%#Eval("UID")%>'">编辑</a>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
</asp:Content>
