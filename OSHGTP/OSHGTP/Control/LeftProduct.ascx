<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftProduct.ascx.cs" Inherits="OSHGTP.Control.Left" %>
<%@ Register Src="~/Control/SignIn.ascx" TagPrefix="uc1" TagName="SignIn" %>

<div class="kuang">
    <div class="zuo">
        <div class="zuo1">
            <div class="zuoa">用户登录</div>
            <div class="zuob">
                <uc1:SignIn runat="server" ID="SignIn" />
            </div>
        </div>
        <div class="zuo2"><a href="GoodsBooks.aspx">书籍材料</a></div>
        <div class="zuo2"><a href="GoodsLive.aspx">生活用品</a></div>
        <div class="zuo2"><a href="GoodsSports.aspx">体育用品</a></div>
        <div class="zuo2"><a href="GoodsAvionics.aspx">电子设备</a></div>
    </div>
</div>
