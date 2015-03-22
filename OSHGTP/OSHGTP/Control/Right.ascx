<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Right.ascx.cs" Inherits="OSHGTP.Control.Right" %>
<div class="kuang">
    <div class="zuo">


        <div class="zuoa">网站公告</div>
        <div class="zuob">
            <marquee direction="up" height="300px" scrollamount="2" scrolldelay="20" style="font-size: 9pt; height: 345%; line-height: 150%; margin-left: 3px;" width="100%" id="srcolltext" onmouseover="srcolltext.stop()" onmouseout="srcolltext.start()"> 
                             <asp:Panel ID="Panel1" runat="server" Height="128px" Width="100%" HorizontalAlign="left">
    <asp:DataList ID="HotProDl" runat="server" RepeatColumns="3" HorizontalAlign="center" Width="100%">
        <ItemTemplate>
            <a href='Notice_Detail.aspx?NId=<%#DataBinder.Eval(Container.DataItem,"NId") %>' style="text-decoration: none; line-height: 30px">
                <%#Limit ((string)DataBinder.Eval(Container.DataItem, "NTitle"),DataBinder.Eval(Container.DataItem, "NDate").ToString ())%></a><br/>
            <%-- <img src="../Images/jsq.gif" />--%>
        </ItemTemplate>
       
    </asp:DataList> <br/>
</asp:Panel>
                           </marquee>
        </div>
    </div>
</div>
