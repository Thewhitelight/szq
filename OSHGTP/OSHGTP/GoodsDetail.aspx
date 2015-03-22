<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GoodsDetail.aspx.cs" Inherits="OSHGTP.GoodsDetail" %>

<%@ Register Src="~/Control/Footer.ascx" TagName="Footer" TagPrefix="Footer" %>
<%@ Register Src="~/Control/Header.ascx" TagName="Header" TagPrefix="Header" %>
<%@ Register Src="~/Control/LeftMain.ascx" TagPrefix="LeftMain" TagName="LeftMain" %>
<%@ Register Src="~/Control/Right.ascx" TagPrefix="Right" TagName="Right" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>商品详情</title>
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
            <div class="top">

                <Header:Header ID="Header1" runat="server" />


            </div>
            <div class="zuo">
                <LeftMain:LeftMain runat="server" ID="LeftMain1" />
            </div>

            <div class="zhong">
                <asp:DataList Visible="true" ID="MarketDetailDl" runat="server" Width="440px" Height="200px" RepeatColumns="1" HorizontalAlign="center" ShowHeader="false">

                    <ItemTemplate>
                        商品图片<br />
                        <img src='<%# Checked(DataBinder.Eval(Container.DataItem,"GPicPath").ToString ()) %>' height="220" width="200" onclick="openwin(<%# DataBinder.Eval(Container.DataItem,"GId") %>)" title="" style="cursor: hand; float: left; margin-right: 30px" />
                        <%-- <input id="BigPic" type="button" onclick='openwin(<%# DataBinder.Eval(Container.DataItem,"GId") %>)' value="单击放大" style="position: absolute; left: 15px; top: 265px; border-style: none; width: 100px" />--%>
                        名称:<%# DataBinder .Eval (Container.DataItem ,"GName") %><br />
                        交易方式:<%# DataBinder .Eval (Container.DataItem ,"GBSD") %><br />

                        原价(元):<%# DataBinder .Eval (Container.DataItem ,"GPPrice") %><br />

                        售价(元):<%# DataBinder .Eval (Container.DataItem ,"GRPrice") %><br />
                        购买日期:<%# DataBinder .Eval (Container.DataItem ,"GBDate") %><br />
                        出售日期:<%# DataBinder .Eval (Container.DataItem ,"GSDate") %><br />

                        新旧水平:<%# DataBinder .Eval (Container.DataItem ,"GLevel") %><br />
                        交易地点:<%# DataBinder .Eval (Container.DataItem ,"GAddress") %><br />
                        商品类型:<%# DataBinder .Eval (Container.DataItem ,"GTypeName") %><br />
                        姓名:<%# DataBinder .Eval (Container.DataItem ,"UName") %><br />
                        联系电话:<%# DataBinder .Eval (Container.DataItem ,"Uphone") %><br />
                        电子邮件:<%# DataBinder .Eval (Container.DataItem ,"UEmail") %><br />
                        内容: <%# DataBinder .Eval (Container.DataItem ,"GContent") %>
                    </ItemTemplate>
                </asp:DataList>
            </div>

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
