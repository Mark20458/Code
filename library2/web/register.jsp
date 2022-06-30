<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2022/6/25
  Time: 23:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册页面</title>
    <script>
        function check(form) {
            if (form.user_name.value == "") {
                alert("用户名不能为空！");
                return false;
            }
            if (form.user_pass.value == "") {
                alert("密码不能为空！");
                return false;
            }
            if (form.confirm_user_pass.value == "") {
                alert("请确认密码！");
                return false;
            }
            if (form.user_pass.value != form.confirm_user_pass.value) {
                alert("两次输入的密码不同！");
                return false;
            }
            return true;
        }
    </script>
</head>
<body style="background: url(images/page7.jpg);background-size:100% 100% ; background-attachment: fixed ">
<center>
    <br><br><br><br><br><br><br><br>
    <h1><font color="white" size="6">注册账号</font></h1><br>
    <form name="Register" action="Register" method="post" onsubmit="return check(this)">
        <table border="0" width="300" height="100">
            <tr>
                <td align="right"><font color="white" size="4">用户名：</font>
                <td><input type="text" name="user_name"><br></td>
            <tr>
                <td align="right"><font color="white" size="4">用户密码：</font>
                <td><input type="password" name="user_pass"><br></td>
            <tr>
                <td align="right"><font color="white" size="4">确认密码：</font>
                <td><input type="password" name="confirm_user_pass"><br></td>
        </table>
        <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" value="注册">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"><br>
        <br>
        &nbsp;&nbsp;&nbsp;<font color="white" size="4"> 如果你已有账号请<a href="index.jsp">返回登录</a>！</font>
    </form>
</center>
</body>
</html>
