<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddGoodsInfo.aspx.cs" Inherits="OSHGTP.AddGoodsInfo" %>

<%@ Register Src="~/Control/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/Control/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/Control/LeftMain.ascx" TagPrefix="uc1" TagName="LeftMain" %>
<%@ Register Src="~/Control/Right.ascx" TagPrefix="uc1" TagName="Right" %>






<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>商品求购</title>
    <style type="text/css">
        body {
            margin: 0 auto;
            width: 998px;
        }
    </style>
    <script src="JavaScript/Calendar.js"></script>
    <script type="text/javascript">

        var oCalendarEn = new PopupCalendar("oCalendarEn");    //初始化控件时,请给出实例名称如:oCalendarEn
        oCalendarEn.Init();


        var oCalendarChs = new PopupCalendar("oCalendarChs");    //初始化控件时,请给出实例名称:oCalendarChs
        oCalendarChs.weekDaySting = new Array("日", "一", "二", "三", "四", "五", "六");
        oCalendarChs.monthSting = new Array("一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月");
        oCalendarChs.oBtnTodayTitle = "今天";
        oCalendarChs.oBtnCancelTitle = "取消";
        oCalendarChs.Init();</script>
    <style type="text/css">
        body {
            margin: 0 auto;
            width: 998px;
        }
    </style>


    <style type="text/css">
        .newPro {
            list-style: none;
            margin: 20px 0 0 20px;
        }

        .details {
            height: 30px;
            width: 440px;
        }

        #txtContent {
            width: 214px;
            height: 50px;
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
                <div id="">

                    <div class="title" style="border-bottom: 1px #ff6600 solid">
                        <%--<img alt="pic" src="images/fe_ce_top_02.gif" style="display: block; float: left;" />--%>发布新的产品
                    </div>

                    <ul class="newPro">
                        <a>
                            <asp:Label ID="Label1" runat="server" Text="提示:登录后才能发布信息,求购商品与捐献商品时无须填写价格与时间" ForeColor="Red"></asp:Label></a>
                        <li class="details">商品<span class="detailName">名称:</span><input type="text" id="txtGName" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(必要栏位)" ControlToValidate="txtGName" SetFocusOnError="false"></asp:RequiredFieldValidator></li>

                        <li class="details"><span class="detailName">交易地址:</span><input type="text" id="txtAddress" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="(必要栏位)" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                        </li>
                        <li class="details"><span class="detailName">新旧水平:</span><input type="text" id="txtLevel" runat="server" />

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="dynamic" runat="server" ErrorMessage="(必要栏位)" ControlToValidate="txtLevel"></asp:RequiredFieldValidator>
                        </li>

                        <li class="details">交易<span class="detailName">方式:</span><select id="dropBuySell" runat="server">
                            <option value="供">供</option>
                            <option value="求">求</option>
                            <option value="捐">捐</option>
                        </select></li>
                        <li class="details"><span class="detailName">购买价格:</span><input type="text" id="txtPPrice" runat="server" />

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="dynamic" runat="server" ErrorMessage="(必要栏位)" ControlToValidate="txtPPrice"></asp:RequiredFieldValidator>
                        </li>
                        <li class="details"><span class="detailName">出售价格:</span><input type="text" id="txtRPrice" runat="server" />

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="dynamic" runat="server" ErrorMessage="(必要栏位)" ControlToValidate="txtRPrice"></asp:RequiredFieldValidator>
                        </li>

                        <li class="details">
                            <span class="detailName">所属类别:</span>;                 
                           <select id="txtGTypeId" runat="server">
                               <option value="1">书籍材料类</option>
                               <option value="2">生活用品类</option>
                               <option value="3">体育用品类</option>
                               <option value="4">电子设备类</option>
                           </select>
                        </li>
                        <li class="details"><span class="detailName">上传图片:</span>
                            <asp:FileUpload ID="FileUp" runat="server" />
                        </li>
                        <li class="details"><span class="detailName">购买时间:</span><input type="text" id="txtBDate" runat="server" readonly="readonly" onfocus="getDateString(this,oCalendarChs)" /></li>
                        <li class="details"><span class="detailName">出售时间:</span><input type="text" id="txtSDate" runat="server" readonly="readonly" onfocus="getDateString(this,oCalendarChs)" /></li>
                        <li class="details" style="height: 65px"><span class="detailName">详细内容:</span>
                            <textarea id="txtContent" runat="server"></textarea>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="(必要栏位)" ControlToValidate="txtContent"></asp:RequiredFieldValidator>
                        </li>
                        <li class="details"><span class="detailName"></span>
                            <asp:Button ID="btSave" runat="server" Text="保存" OnClick="btSave_Click" /></li>
                    </ul>
                    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lbinforn" runat="server" ForeColor="Red"></asp:Label>
                </div>

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
