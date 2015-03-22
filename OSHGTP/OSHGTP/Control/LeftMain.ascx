<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftMain.ascx.cs" Inherits="OSHGTP.Control.LeftMain" %>
<%@ Register Src="~/Control/SignIn.ascx" TagPrefix="uc1" TagName="SignIn" %>
<%@ Register Src="~/Control/GoodsItem.ascx" TagPrefix="uc1" TagName="GoodsItem" %>

<div class="kuang">
    <div class="zuo">
        <div class="zuo1">
            <div class="zuoa">用户登录</div>
            <div class="zuob">
                <uc1:SignIn runat="server" ID="SignIn" />
            </div>
        </div>
        <div style="margin-top: 20px"></div>
        <div class="zuoa">热门信息</div>
        <div class="zuob">
            <marquee direction="up" height="300px" scrollamount="2" scrolldelay="20" style="font-size: 9pt; height: 200%; line-height: 150%; margin-left: 3px;" width="94%" id="srcolltext" onmouseover="srcolltext.stop()" onmouseout="srcolltext.start()"> 
                              <uc1:GoodsItem runat="server" id="GoodsItem" />
                           </marquee>
        </div>
    </div>
</div>
