<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SmartBlog.Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>注册博客</title>
 <link rel="shortcut icon" type="image/x-icon" href="Images/blog.ico" />

    <script type="text/javascript">

          //显示提示结果
        function showHint(str) {

            if (str.length == 0) {
                document.getElementById("txtHint").innerHTML = "";
                return;
            }

            xmlHttp = GetXmlHttpObject()

            if (xmlHttp == null) {
                alert("您的浏览器不支持AJAX！");
                return;
            }

            var url = "ValidUser.aspx";
            url = url + "?user=" + str;
            url = url + "&sid=" + Math.random();
            xmlHttp.onreadystatechange = stateChanged;
            xmlHttp.open("GET", url, true);
            xmlHttp.send(null);
        }


        function GetXmlHttpObject() {
            var xmlHttp = null;
            try {
                // Firefox, Opera 8.0+, Safari
                xmlHttp = new XMLHttpRequest();
            }
            catch (e) {
                // Internet Explorer
                try {
                    xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                }
                catch (e) {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
            }
            return xmlHttp;
        }


        function stateChanged() {
            if (xmlHttp.readyState == 4) {
                
                document.getElementById("txtHint").innerHTML = xmlHttp.responseText;
            }
        }


        function ConfirmPassword() {
            with (document.all) {
                if (txtConfirm.value != txtPassword.value) {
                    alert("密码不一致");
                    txtConfirm.value = "";
                    txtPassword.value = "";
                }
 

            }


        }

        function ChangeValidCode() {
            document.getElementById("Image1").setAttribute("src", "/ValidateCode.aspx?flag="+Math.random());
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <h1>
        用户注册
        </h1>
        <table style="width:100%;">
            <tr>
                <td>
                    用户名</td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
  <span id="txtHint"></span> 

            </tr>
            <tr>
                <td>
                    密码</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    确认密码</td>
                <td>
                    <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    邮箱</td>
                <td class="style1">
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    验证码</td>
                <td class="style1">
           
                    <asp:TextBox ID="txtValidCode" runat="server"></asp:TextBox>         <asp:Image ID="Image1" runat="server" 
                        ImageUrl="~/ValidateCode.aspx"   />
                </td>
                </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnRegister" runat="server" onclick="btnRegister_Click" 
                        Text="注册" />
&nbsp;<asp:CheckBox ID="CheckBox1" runat="server" Checked="True" Text="同意注册协议" />
                </td>
            </tr>
        </table>
        <br />

    </div>
    </form>
</body>
</html>
