<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="SmartBlog.UserList" %>

<%@ Register Src="~/Controls/AdminMessage.ascx" TagPrefix="uc1" TagName="AdminMessage" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户列表</title>
    <link href="Images/Style.css" rel="stylesheet" />
    <link rel="shortcut icon" type="image/x-icon" href="Images/blog.ico" />
    <style type="text/css">
        #left {
            float: left;
        }

        #right {
            float: left;
        }
    </style>
</head>
<body>

    <form id="form2" runat="server">
        <div>

            <div id="left">
                <uc1:AdminMessage runat="server" ID="AdminMessage" />
            </div>
            <div id="right">
                <table style="width: 100%" class="TPostL">
                    <tr>
                        <td><%=outputStream%></td>

                    </tr>

                </table>
            </div>







        </div>
    </form>
</body>
</html>
