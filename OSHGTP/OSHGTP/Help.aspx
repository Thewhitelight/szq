<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Help.aspx.cs" Inherits="OSHGTP.Help" %>

<%@ Register Src="~/Control/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/Control/Header.ascx" TagPrefix="uc1" TagName="Header" %>






<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>网站帮助</title>
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
            <div style="text-align: left">
                您在辨别信息真实性及双方交易时总有一些风险存在，我们提供几种安全措施，这些措施简便易行，供您在选择信息时避免不必要的风险：<br />
                <br />

                1)通过对外公布的个人信息，您就可以知道信息发布者的情况。例如：借助于信息发布者对外公布的联系电话，您可通过直接打电话与信息发布者联系。通过打电话，可以辨别发布的信息与信息描述是否一致，从而进行自己正确的选择。<br />
                <br />

                2)如果需要面对面的交易，尽可能带一个朋友一起去或在公共场所交易．建议您最好是进行同城交易．<br />
                <br />

                3)如果信息描述与现实差距比较大，或信息过于让人感觉不真实，最好斟酌一下，以防上当．因为本网站不保证所录信息的真实性．<br />
                <br />

                4)检查信息发布中价格的可信度，可以在相关信息中将最近的信息中物品价格作参考．<br />
                <br />

                5)在您进行物品交易时，请仔细核对成交物品与物品描述是否一致，是否属于违法销售或有害身心健康和财产安全的物品，所交易的物品是否属于国家禁止或限制买卖类物品．<br />
                <br />

                6)在您进行信息发布和物品交易时，请提高安全意识，加强自我保护！<br />
                <br />

                7)在查看信息时，请注意查询信息提供者的ＩＰ地址和手机号码所属地．<br />
                <br />

                8)在您进行交易时，请注意对所购物品进行相关性能参数的测试，以避免受到不良商贩的欺诈．<br />
                <br />
            </div>

            <div style="margin-top: auto;">
                <uc1:Footer runat="server" ID="Footer" />
            </div>
        </div>
    </form>
</body>
</html>
