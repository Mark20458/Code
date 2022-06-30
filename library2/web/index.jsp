<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2022/6/25
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <script>
        function check(form) {
            if (form.user_id.value == "") {
                alert("用户ID不能为空！");
                return false;
            }
            if (form.user_pass.value == "") {
                alert("用户密码不能为空！");
                return false;
            }
            return true;
        }
    </script>
</head>
<body style="background: url(images/page8.jpg);background-size:100% 100% ; background-attachment: fixed ">

<center>
    <br><br><br><br><br><br><br><br>
    <h1><font color="white" size="6">登录页面</font></h1><br>
    <form name="Sign" action="SignIn" method="post" onsubmit="return check(this)">
        <table border="0" width="300" height="100">
            <tr>
                <td align="right"><font color="white" size="4">用户ID：</font>
                <td><input type="text" name="user_id"><br></td>
            <tr>
                <td align="right"><font color="white" size="4">用户密码：</font>
                <td><input type="password" name="user_pass"><br></td>
        </table>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <font size="4"><input type="submit" value="确定">&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="reset" value="重置"><br></font>
    </form>
    <br>
    <font color="white" size="4">如果你还没有账号请<a href="register.jsp">点击注册</a>！</font>
</center>
</body>
</html>