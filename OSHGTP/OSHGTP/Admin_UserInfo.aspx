<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_UserInfo.aspx.cs" Inherits="OSHGTP.Admin_UserInfo" %>

<%@ Register Src="~/Control/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/Control/Header.ascx" TagPrefix="uc1" TagName="Header" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户管理</title>
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
                <div style="width: 100%; height: 500px">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="15" HeaderStyle-BackColor="#DEE8F4" HeaderStyle-BorderColor="#9FB6D5" BorderStyle="Solid" BorderColor="#A1B6D5" OnRowDeleting="GridView1_RowDeleting" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <Columns>
                            <asp:BoundField HeaderText="用户id" DataField="UId" />
                            <asp:BoundField HeaderText="用户名" DataField="UName" />



                            <asp:BoundField HeaderText="电子邮件" DataField="UEmail" />
                            <asp:BoundField HeaderText="手机" DataField="UPhone" />


                            <asp:ButtonField CommandName="Delete" ButtonType="Button" Text="删除" HeaderText="操作" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <uc1:Footer runat="server" ID="Footer" />
        </div>
    </form>
</body>
</html>
