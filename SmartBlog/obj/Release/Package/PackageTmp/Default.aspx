﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartBlog.Default" %>

<%@ Register Src="~/Controls/AdminTop.ascx" TagName="AdminTop" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/AdminFoot.ascx" TagName="AdminFoot" TagPrefix="uc2" %>
<%@ Register Src="~/Controls/Login.ascx" TagName="Login" TagPrefix="uc3" %>
<%@ Register Src="~/Controls/AdminLeft.ascx" TagPrefix="uc1" TagName="AdminLeft" %>
<%@ Register Src="~/Controls/AdminMessage.ascx" TagPrefix="uc1" TagName="AdminMessage" %>
<%@ Register Src="~/Controls/UserMessage.ascx" TagPrefix="uc1" TagName="UserMessage" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%=name%></title>
    <link rel="shortcut icon" type="image/x-icon" href="Images/blog.ico" />
    <link href="Images/Style.css" rel="stylesheet" type="text/css" />
    <link href="css/top.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .Calendar {
            font-family: Verdana;
            font-size: 9pt;
            background-color: #EEE;
            text-align: center;
            width: 198px;
            height: 158px;
            padding: 10px;
            line-height: 1.5em;
            margin: 1px 1px 1px 40px;
        }

            .Calendar a {
                color: #0066CC;
            }

            .Calendar table {
                width: 100%;
                border: 0;
            }

                .Calendar table thead {
                    color: #acacac;
                }

                .Calendar table td {
                    font-size: 11px;
                    padding: 1px;
                }

        #idCalendarPre {
            cursor: pointer;
            float: left;
            padding-right: 5px;
        }

        #idCalendarNext {
            cursor: pointer;
            float: right;
            padding-right: 5px;
        }

        #idCalendar td.onToday {
            font-weight: bold;
            color: #C60;
        }

        #idCalendar td.onSelect {
            font-weight: bold;
        }
    </style>
    <script type="text/javascript">
        var $ = function (id) {
            return "string" == typeof id ? document.getElementById(id) : id;
        };
        var Class = {
            create: function () {
                return function () {
                    this.initialize.apply(this, arguments);
                }
            }
        }
        Object.extend = function (destination, source) {
            for (var property in source) {
                destination[property] = source[property];
            }
            return destination;
        }
        var Calendar = Class.create();
        Calendar.prototype = {
            initialize: function (container, options) {
                this.Container = $(container);//table结构容器
                this.Days = [];//日期列表 
                this.SetOptions(options);
                this.Year = this.options.Year;
                this.Month = this.options.Month;
                this.SelectDay = this.options.SelectDay ? new Date(this.options.SelectDay) : null;
                this.onSelectDay = this.options.onSelectDay;
                this.onToday = this.options.onToday;
                this.onFinish = this.options.onFinish;
                this.Draw();
            },

            SetOptions: function (options) {
                this.options = {//默认值 
                    Year: new Date().getFullYear(),
                    Month: new Date().getMonth() + 1,
                    SelectDay: null,//选择日期 
                    onSelectDay: function () { },
                    onToday: function () { },
                    onFinish: function () { }
                };
                Object.extend(this.options, options || {});
            },
            //上月 
            PreMonth: function () {
                //取得上月日期对象 
                var d = new Date(this.Year, this.Month - 2, 1);
                //设置属性 
                this.Year = d.getFullYear();
                this.Month = d.getMonth() + 1;
                //重绘日历 
                this.Draw();
            },
            //下一个月 
            NextMonth: function () {
                var d = new Date(this.Year, this.Month, 1);
                this.Year = d.getFullYear();
                this.Month = d.getMonth() + 1;
                this.Draw();
            },

            Draw: function () {
                //保存日期列表 
                var arr = [];
                //用当月第一天在一周中的日期值作为当月离第一天的天数 
                for (var i = 1, firstDay = new Date(this.Year, this.Month - 1, 1).getDay() ; i <= firstDay; i++) { arr.push(" "); }
                //用当月最后一天在一个月中的日期值作为当月的天数 
                for (var i = 1, monthDay = new Date(this.Year, this.Month, 0).getDate() ; i <= monthDay; i++) { arr.push(i); }
                // /
                var frag = document.createDocumentFragment();
                this.Days = [];
                while (arr.length > 0) {
                    //每个星期插入一个tr
                    var row = document.createElement("tr");
                    //星期 
                    for (var i = 1; i <= 7; i++) {
                        var cell = document.createElement("td");
                        cell.innerHTML = " ";
                        if (arr.length > 0) {
                            var d = arr.shift();
                            cell.innerHTML = d;
                            if (d > 0) {
                                this.Days[d] = cell;
                                //获取今日 
                                if (this.IsSame(new Date(this.Year, this.Month - 1, d), new Date())) { this.onToday(cell); }
                                //判断用户是否作了选择
                                if (this.SelectDay && this.IsSame(new Date(this.Year, this.Month - 1, d), this.SelectDay)) { this.onSelectDay(cell); }
                            }
                        }
                        row.appendChild(cell);
                    }
                    frag.appendChild(row);
                }
                //此先清空然后再插入(ie的table不能用innerHTML) 
                while (this.Container.hasChildNodes()) { this.Container.removeChild(this.Container.firstChild); }
                this.Container.appendChild(frag);
                this.onFinish();
            },
            //判断是否同一日
            IsSame: function (d1, d2) {
                return (d1.getFullYear() == d2.getFullYear() && d1.getMonth() == d2.getMonth() && d1.getDate() == d2.getDate());
            }
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div id="headPart">
            <uc1:AdminTop ID="AdminTop1" runat="server" />
        </div>
        <div id="Main">
            <div id="leftPart">
                <div id="lefttop">
                    <div class="Mtitle">
                        <h1><%=name%></h1>

                    </div>
                    <div class="Mcontent">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <div class="BlogItem">
                                    <div class="blogTitle">
                                        <a href="PostDetail.aspx?id=<%#Eval("BID") %>">
                                            <%#Eval("PostTitle")%></a>
                                    </div>
                                    <div class="BlogContent">
                                        <!--格式化输出html文本 #表示数据绑定 -->
                                        <%#Server.HtmlDecode(Eval("BContent","{0}"))%>
                                    </div>
                                    <div class="memo">
                                        <div class="author">
                                            <%#Eval("Author")%>
                                        </div>
                                        <div class="blogTime">
                                            <%#Eval("AddDateTime")%>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
        <div id="rightTop">
            <div id="rightPart">
                <uc3:Login ID="Login1" runat="server" />
            </div>
            <uc1:UserMessage runat="server" ID="UserMessage" />
            <uc1:AdminMessage runat="server" ID="AdminMessage" Visible="false" />
            <div class="Calendar">
                <div id="idCalendarPre"><<</div>
                <div id="idCalendarNext">>></div>
                <span id="idCalendarYear"></span>年 <span id="idCalendarMonth"></span>月 
                <table cellspacing="0">
                    <thead>
                        <tr>
                            <td>日</td>
                            <td>一</td>
                            <td>二</td>
                            <td>三</td>
                            <td>四</td>
                            <td>五</td>
                            <td>六</td>
                        </tr>
                    </thead>
                    <tbody id="idCalendar">
                    </tbody>
                </table>
            </div>
            <script type="text/javascript">
                var cale = new Calendar("idCalendar", {
                    SelectDay: new Date().setDate(10),
                    onSelectDay: function (o) { o.className = "onSelect"; },
                    onToday: function (o) { o.className = "onToday"; },
                    onFinish: function () {
                        $("idCalendarYear").innerHTML = this.Year; $("idCalendarMonth").innerHTML = this.Month;
                        var flag = [1, 31];
                        for (var i = 0, len = flag.length; i < len; i++) {
                            this.Days[flag[i]].innerHTML = "<a href='javascript:void(0);' onclick=\"alert('您选择的日期是：" + this.Year + "/" + this.Month + "/" + flag[i] + "');return false;\">" + flag[i] + "</a>";
                        }
                    }
                });
                $("idCalendarPre").onclick = function () { cale.PreMonth(); }
                $("idCalendarNext").onclick = function () { cale.NextMonth(); }
            </script>
        </div>
        <div id="footPart">
            <uc2:AdminFoot ID="AdminFoot1" runat="server" />
        </div>

    </form>
    <a id="returnTop" href="javascript:;">回到顶部</a>
    <script src="js/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script src="js/top.js" type="text/javascript"></script>
</body>
</html>
