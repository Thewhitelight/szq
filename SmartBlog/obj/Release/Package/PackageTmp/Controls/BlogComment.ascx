<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlogComment.ascx.cs" Inherits="SmartBlog.Controls.BlogComment" %>
<style type="text/css">
li{ display:block; height:35px;  border-bottom-style:dotted; border-bottom-width:thin;  margin-top:10px; }
</style>
<ul>
<asp:Repeater ID="Repeater1" runat="server">
<ItemTemplate>
 <li><%#Eval("Layer") %>楼的<%#Eval("UserID")%>于<%#Eval("AddDateTime")%>说“<%#Eval("CContent")%>”</li>
</ItemTemplate>
</asp:Repeater>
   
</ul>

