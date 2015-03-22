<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Default.aspx.cs" Inherits="OSHGTP.Admin_Default" %>

<%@ Register Src="~/Control/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/Control/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>商品管理</title>
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
            <div style="text-align: center; width:998px;" >
                <h2>后台管理</h2>
                <a href="Admin_UserInfo.aspx">用户管理</a>
                <a href="Admin_Default.aspx">商品信息管理</a>
                <a href="Admin_Notice.aspx">公告发布</a>

                <div style="width: 998px; height: 500px">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="5" HeaderStyle-BackColor="#DEE8F4" HeaderStyle-BorderColor="#9FB6D5" BorderStyle="Solid" BorderColor="#A1B6D5" OnRowDeleting="GridView1_RowDeleting" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <Columns>
                            <asp:BoundField HeaderText="商品Id" DataField="GId" />
                            <asp:BoundField HeaderText="商品名称" DataField="GName" />
                            <asp:BoundField HeaderText="内容" DataField="GContent" />
                            <asp:BoundField HeaderText="联系人" DataField="UName" />
                            <asp:BoundField HeaderText="电话" DataField="UPhone" />
                            <asp:BoundField HeaderText="电子邮件" DataField="UEmail" />
                            <asp:BoundField HeaderText="地址" DataField="GAddress" />
                            <asp:BoundField HeaderText="供求捐" DataField="GBSD" />
                            <asp:BoundField HeaderText="价格" DataField="GPPrice" />
                            <asp:BoundField HeaderText="新旧水平" DataField="GLevel" />
                            <asp:BoundField HeaderText="出售日期" DataField="GSDate" DataFormatString="{0:yyyy-M-d}" HtmlEncode="False" />
                             <asp:BoundField HeaderText="商品类型" DataField="GTypeName" />
                            <asp:ButtonField CommandName="Delete" ButtonType="Button" Text="删除" HeaderText="操作" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div style="margin-top:auto;padding-top:100px"> <uc1:Footer runat="server" ID="Footer" /></div>
           
        </div>
    </form>
</body>
</html>
