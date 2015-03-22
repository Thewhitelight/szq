<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="OSHGTP.SignUp" %>

<%@ Register Src="~/Control/LeftMain.ascx" TagPrefix="uc1" TagName="LeftMain" %>
<%@ Register Src="~/Control/Right.ascx" TagPrefix="uc1" TagName="Right" %>
<%@ Register Src="~/Control/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/Control/Header.ascx" TagPrefix="uc1" TagName="Header" %>





<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户注册</title>
    <style type="text/css">
        body {
            margin: 0 auto;
            width: 998px;
        }
    </style>
    <style type="text/css">
        .fillTitle {
            float: left;
            width: 80px;
            display: block;
        }

        li {
            height: 40px;
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
                <div id="body1middle">
                    <div class="title" style="border-bottom: 1px #FF6600 solid">
                        <img src="images/fe_ce_top_02.gif" style="display: block; float: left;" />个人资料注册
                    </div>
                    <ul class="fillTable">
                        <li><span class="fillTitle">用户名</span><input id="txtName" type="text" runat="server" />
                            <asp:RequiredFieldValidator ID="rvName" runat="server" EnableClientScript="true" ControlToValidate="txtName" Text="(必要栏位)"></asp:RequiredFieldValidator>
                        </li>
                        <li><span class="fillTitle">密码</span><input id="txtPassword" type="password" runat="server" />
                            <asp:RequiredFieldValidator ID="rvPassword" runat="server" EnableClientScript="true" ControlToValidate="txtPassword" Text="(必要栏位)"></asp:RequiredFieldValidator>
                        </li>
                        <li><span class="fillTitle">确认密码</span><input id="txtConfirmPassword" type="password" runat="server" />
                            <asp:RequiredFieldValidator ID="rvConfirm" runat="server" EnableClientScript="true" ControlToValidate="txtConfirmPassword" Text="(必要栏位)"></asp:RequiredFieldValidator>
                        </li>
                        <li><span class="fillTitle">手机号码</span><input id="txtPhone" type="text" runat="server" />
                            <asp:RegularExpressionValidator ID="rvPhone" runat="server" ErrorMessage="请输入数字,并且保证位数!" ControlToValidate="txtPhone" Type="Double" ValidationExpression="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$) "></asp:RegularExpressionValidator>
                        </li>

                        <li><span class="fillTitle">电子邮件</span><input id="txtEMail" type="text" runat="server" />
                            <asp:RegularExpressionValidator ID="rvMail" runat="server" ErrorMessage="(E-Mail格式错误!)" ControlToValidate="txtEMail" ValidationExpression="^[a-zA-Z0-9]{1,}@[a-zA-Z0-9]{1,}\.(com|net|org|edu|mil|cn|cc)$"></asp:RegularExpressionValidator>
                        </li>
                    </ul>

                    <asp:Button ID="Button1" runat="server" Text="注册" OnClick="Button1_Click" />
                    <asp:Label ID="lbInfo" runat="server" Text="" ForeColor="Red"></asp:Label>
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
