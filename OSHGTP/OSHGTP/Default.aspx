<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OSHGTP.Default" %>


<%@ Register Src="~/Control/Footer.ascx" TagName="Footer" TagPrefix="Footer" %>
<%@ Register Src="~/Control/Header.ascx" TagName="Header" TagPrefix="Header" %>
<%@ Register Src="~/Control/LeftProduct.ascx" TagName="LeftProduct" TagPrefix="LeftProduct" %>
<%@ Register Src="~/Control/LeftMain.ascx" TagPrefix="LeftMain" TagName="LeftMain" %>
<%@ Register Src="~/Control/Right.ascx" TagPrefix="Right" TagName="Right" %>
<%@ Register Src="~/Control/GoodsItem.ascx" TagPrefix="GoodsItem" TagName="GoodsItem" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>校园二手交易系统</title>
    <style type="text/css">
        body {
            margin: 0 auto;
            width: 998px;
        }
    </style>
    <link href="Css/Main.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="top">

                <Header:Header ID="Header1" runat="server" />


            </div>
            <div class="zuo">
                <LeftMain:LeftMain runat="server" ID="LeftMain1" />
            </div>
            <div class="zhong"> <GoodsItem:GoodsItem runat="server" ID="GoodsItem1" /></div>
           
            <%-- <LeftProduct:LeftProduct ID="LeftProduct1" runat="server" />--%>
            <div class="you">
                <Right:Right runat="server" ID="Right1" />
            </div>

            <div style="margin-top: 602px">
                <Footer:Footer ID="Footer1" runat="server" />
            </div>


        </div>
    </form>
</body>
</html>
