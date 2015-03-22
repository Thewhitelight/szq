<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserCenter.aspx.cs" Inherits="OSHGTP.UserCenter" %>

<%@ Register Src="~/Control/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/Control/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/Control/LeftMain.ascx" TagPrefix="uc1" TagName="LeftMain" %>
<%@ Register Src="~/Control/Right.ascx" TagPrefix="uc1" TagName="Right" %>





<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人中心</title>
    <style type="text/css">
        body {
            margin: 0 auto;
            width: 998px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <uc1:Header runat="server" ID="Header" />
            <div class="zuo">
                <uc1:LeftMain runat="server" id="LeftMain" />
            </div>
            <div class="zhong">
                <asp:DataList ID="MarketDetailDl" runat="server" Width="440px" Height="200px" RepeatColumns="1" HorizontalAlign="center" ShowHeader="false">

                    <ItemTemplate>
                        用户名:<%# DataBinder .Eval (Container.DataItem ,"UName") %><br />电子邮件:<%# DataBinder .Eval (Container.DataItem ,"UEmail") %><br />联系电话:<%# DataBinder .Eval (Container.DataItem ,"UPhone") %><br />
                    </ItemTemplate>
                </asp:DataList>
                新电话号码：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="确认修改" OnClick="Button1_Click" />
            </div>
            <div class="you">
                <uc1:Right runat="server" id="Right" />
            </div>
            <div style="margin-top: 602px;">
                <uc1:Footer runat="server" ID="Footer" />
            </div>
        </div>
    </form>
</body>
</html>
