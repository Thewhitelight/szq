<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyLinks.aspx.cs" Inherits="SmartBlog.MyLinks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>博客编辑</title>
    <link rel="shortcut icon" type="image/x-icon" href="Images/blog.ico" />
    <style type="text/css">
        #linktable {
            margin-left: 300px;
        }

        .auto-style1 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table style="width: 100%;" id="linktable">
                <tr>
                    <td class="auto-style1">博客名称<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>

                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="确定" />
                    </td>

                </tr>
                <tr>
                    <td class="auto-style1">友链名称<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>

                </tr>
                <tr>
                    <td>友链网址<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>

                </tr>

                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="添加友链" OnClick="Button1_Click" />
                        <asp:Button ID="Button2" runat="server" Text="更新友链" OnClick="Button2_Click" />
                    </td>

                </tr>
            </table>

        </div>
    </form>
</body>
</html>
