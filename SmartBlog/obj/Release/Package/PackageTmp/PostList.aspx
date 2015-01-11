<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostList.aspx.cs" Inherits="SmartBlog.PostList" %>

<%@ Register Src="~/Controls/AdminMessage.ascx" TagPrefix="uc1" TagName="AdminMessage" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>编辑博客</title>
    <link rel="shortcut icon" type="image/x-icon" href="Images/blog.ico" />
    <link href="Images/Style.css" rel="stylesheet" />
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
                <uc1:AdminMessage runat="server" ID="AdminMessage1" />
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
