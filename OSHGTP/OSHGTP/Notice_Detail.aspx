<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notice_Detail.aspx.cs" Inherits="OSHGTP.Notice_Detail" %>

<%@ Register Src="~/Control/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/Control/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/Control/LeftMain.ascx" TagPrefix="uc1" TagName="LeftMain" %>
<%@ Register Src="~/Control/Right.ascx" TagPrefix="uc1" TagName="Right" %>





<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>网站公告</title>
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
                <uc1:LeftMain runat="server" ID="LeftMain" />
            </div>
            <div class="zhong">
                <asp:DataList ID="MarketDetailDl" runat="server" Width="440px" Height="200px" RepeatColumns="1" HorizontalAlign="center" ShowHeader="false">

                    <ItemTemplate>
                        公告标题:<%# DataBinder .Eval (Container.DataItem ,"NTitle") %><br />
                         发布时间:<%# DataBinder .Eval (Container.DataItem ,"NDate") %><br />
                        </br>
                        公告内容:<%# DataBinder .Eval (Container.DataItem ,"NContent") %><br />
                       
                    </ItemTemplate>
                </asp:DataList>
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
