<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="OSHGTP.About" %>

<%@ Register Src="~/Control/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/Control/Header.ascx" TagPrefix="uc1" TagName="Header" %>






<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>关于网站</title>
    <style type="text/css">
        body {
            margin: 0 auto;
            width: 998px;
            background-image: url('../Images/img.jpg');
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <uc1:Header runat="server" ID="Header" />

            <div style="text-align:left;">
                第一条 必要的说明<br>
                跳蚤市场（www.whptu.ah.cn）的各项互联网功能、资源、服务的所有权和运作权归信息学院信息05-3所有。<br>
                跳蚤市场用户，指在跳蚤市场的信息发布者和信息浏览者，在享有本站跳蚤市场的有关功能、资源、服务（包括但不限于信息发布、信息浏览、信息搜索、信息删除、联络服务等）之前，必须首先注册成为会员用户，并且完全同意和接受跳蚤市场的各项服务条款和规则（即本服务条约）。有关功能与服务仅限用户本人。 
          <br>
                本站提供的各项互联网功能、资源、服务，包括今后增加或增强的新功能及新产品，以及本用户条约的相关联文件，均属于本用户条约的有效组成部分。<p>
                    第二条 用户权力<br>
                    1、 注册成为会员用户，发布、删除自己提交的分类信息，发布个人的联络信息和身份信息。<br>
                    2、 浏览、搜索分类信息，并可通过信息发布者提供的的联系方式与之取得联络。<br>
                    3、 信息发布者有权保护自己的隐私，选择个人信息的显示情况。<br>
                    4、 通过电子邮件、电话等联络方式向本站提出意见、建议、咨询和投诉。
                </p>
                <p>
                    第三条 用户义务<br>
                    1、 信息发布者必须提供真实、准确、最新及完整的用户资料。<br>
                    2、 信息发布者必须发布合法、真实、准确、完整、规范的分类信息，并且对发布的信息内容承担一切责任。<br>
                    3、 
          信息发布者必须对会员名和密码的安全负全部责任，由于个人原因造成密码被他人得知而造成的所有损害，由个人承担全部责任。若发现自己的会员名被冒用或存在其他无故隐私泄露情况，请立即通知
          管理员。<br>
                    4、 
          信息浏览者不可以通过信息发布者留下的各种联系方式对其进行直接或者间接的骚扰、诽谤、诋毁等伤害，有关的法律责任、经济赔偿等由信息浏览者全部承担。
                </p>
                <p>
                    第四条 信息发布与管理维护规则<br>
                    接受并且遵守本站跳蚤市场的《信息发布与管理维护规则》。 第五条 服务的修改和终止<br>
                    1、 
          本站有权在任何时间暂时或永久修改、暂停或终止服务（或其任何部分），无论通知与否，其任何修改、暂停或终止对用户或任何第三人均不承担责任。<br>
                    2、 
          在认为用户违反本服务条约的情况下（包含但不限于此理由），本站有权终止用户的会员名以及各项功能与服务的使用，有权将用户在本站发布的任何信息加以删除，有权配合公安、法律机关对该用户追求、调查有关的责任。 
                </p>
                <p>
                    第六条 用户信息隐私声明<br>
                    本站享有直接或间接使用以及分析、删除的权利。
                </p>
                <p>本站保留对以上条款的解释权和修改权。</p>
                <p>
                    <br>
            </div>

            <div style="margin-top:auto;">
                <uc1:Footer runat="server" ID="Footer" />
            </div>
        </div>
    </form>
</body>
</html>
