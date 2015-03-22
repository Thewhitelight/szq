<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GoodsDonate.aspx.cs" Inherits="OSHGTP.GoodsDonate" %>

<%@ Register Src="~/Control/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/Control/LeftMain.ascx" TagPrefix="uc1" TagName="LeftMain" %>
<%@ Register Src="~/Control/Right.ascx" TagPrefix="uc1" TagName="Right" %>
<%@ Register Src="~/Control/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>





<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>捐献商品</title>
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
                <asp:Panel ID="Panel1" runat="server" Height="128px" Width="120px" HorizontalAlign="left">
                    <asp:DataList ID="HotProDl" runat="server" RepeatColumns="3" HorizontalAlign="center" Width="460px">
                        <ItemTemplate>
                            <a href='GoodsDetail.aspx?GId=<%#DataBinder.Eval(Container.DataItem,"GId") %>' style="text-decoration: none; line-height: 30px">
                                <%#Limit ((string)DataBinder.Eval(Container.DataItem, "GName"),DataBinder.Eval(Container.DataItem, "GBSD").ToString ())%></a>
                            <%-- <img src="../Images/jsq.gif" />--%>
                        </ItemTemplate>
                    </asp:DataList>
                </asp:Panel>
            </div>
            <div class="you">
                <uc1:Right runat="server" ID="Right" />
            </div>
            <div style="margin-top: 602px">
                <uc1:Footer runat="server" ID="Footer" />
            </div>
        </div>
    </form>
</body>
</html>
