<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Notice.aspx.cs" Inherits="OSHGTP.Admin_Notice" %>

<%@ Register Src="~/Control/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/Control/LeftMain.ascx" TagPrefix="uc1" TagName="LeftMain" %>
<%@ Register Src="~/Control/Right.ascx" TagPrefix="uc1" TagName="Right" %>
<%@ Register Src="~/Control/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>





<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>公告发布</title>
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

            <div style="text-align: center;">
                <h2>后台管理</h2>
                <a href="Admin_UserInfo.aspx">用户管理</a>
                <a href="Admin_Default.aspx">商品信息管理</a>
                <a href="Admin_Notice.aspx">公告发布</a>
                <table>
                    <tr>
                        <td>公告标题</td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" Width="348px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>公告内容</td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Height="174px" Width="346px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="发布公告" OnClick="Button1_Click" /></td>
                    </tr>
                </table>
            </div>
            <div style="width: 100%; height: 500px">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="15" HeaderStyle-BackColor="#DEE8F4" HeaderStyle-BorderColor="#9FB6D5" BorderStyle="Solid" BorderColor="#A1B6D5" OnRowDeleting="GridView1_RowDeleting" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <Columns>
                        <asp:BoundField HeaderText="公告Id" DataField="NId" />
                        <asp:BoundField HeaderText="公告标题" DataField="NTitle" />



                        <asp:BoundField HeaderText="公告内容" DataField="NContent" />
                        <asp:BoundField HeaderText="发布时间" DataField="NDate" />


                        <asp:ButtonField CommandName="Delete" ButtonType="Button" Text="删除" HeaderText="操作" />
                    </Columns>
                </asp:GridView>
            </div>
            <div style="margin-top: 602px;">
                <uc1:Footer runat="server" ID="Footer" />
            </div>
        </div>
    </form>
</body>
</html>
