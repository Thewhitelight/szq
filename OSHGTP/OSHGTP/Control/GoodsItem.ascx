<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GoodsItem.ascx.cs" Inherits="OSHGTP.Control.GoodsItem" %>
<asp:Panel ID="Panel1" runat="server" Height="128px" Width="120px" HorizontalAlign="left">
    <asp:DataList ID="HotProDl" runat="server" RepeatColumns="3" HorizontalAlign="center" Width="460px">
        <ItemTemplate>
            <a href='GoodsDetail.aspx?GId=<%#DataBinder.Eval(Container.DataItem,"GId") %>' style="text-decoration: none; line-height: 30px">
                <%#Limit ((string)DataBinder.Eval(Container.DataItem, "GName"),DataBinder.Eval(Container.DataItem, "GBSD").ToString ())%></a>
            <%-- <img src="../Images/jsq.gif" />--%>
        </ItemTemplate>
    </asp:DataList>
</asp:Panel>
