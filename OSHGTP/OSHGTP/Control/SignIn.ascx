<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SignIn.ascx.cs" Inherits="OSHGTP.Control.SignIn" %>

<div style="margin-left: 50px"></div>
<asp:Label ID="UserInfo" runat="server" Text="欢迎您,请登录!"></asp:Label>
<asp:Panel ID="WelPanel" runat="server" Height="136px" Width="200px">
    <p style="font-size: 12px">&nbsp;用户名:<asp:TextBox ID="txtUserName" runat="server" BorderStyle="Groove" Width="96px"></asp:TextBox></p>
    <p style="font-size: 12px">&nbsp;密码:&nbsp;
        <asp:TextBox ID="txtPassword" runat="server" BorderStyle="Groove" Width="96px" TextMode="Password"></asp:TextBox></p>
    &nbsp;&nbsp;<asp:ImageButton ID="LoginButton" runat="server" ImageUrl="~/Images/in_an_01.gif" OnClick="LoginButton_Click" CausesValidation="False" />&nbsp;&nbsp;<asp:ImageButton ID="RegInfoButton"
        runat="server" ImageUrl="~/Images/in_an_02.gif" OnClick="RegInfoButton_Click" CausesValidation="False" />
</asp:Panel>
<asp:Panel ID="UserDetails" runat="server" Height="128px" Width="144px" Visible="false">
    <p style="line-height: 32px; padding-left: 25px; font-size: 12px">
        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" CausesValidation="false">已发布信息</asp:LinkButton><br />
        <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click" CausesValidation="false">个人中心</asp:LinkButton><br />
        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" CausesValidation="false">更改密码</asp:LinkButton><br />
        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" OnClick="LinkButton1_Click">退出登录</asp:LinkButton><br />
    </p>
</asp:Panel>
