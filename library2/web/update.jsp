<%@ page import="model.Student" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2022/6/28
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="model.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户信息</title>
    <%
        Student student = (Student) session.getAttribute("student");
    %>
    <script>
        function check(f) {
            if (f.name.value == "") {
                alert("昵称不能为空！")
                return false;
            }
            if (f.pass.value == "") {
                alert("密码不能为空！");
                return false;
            }
            if (f.pass.value != f.confim_pass.value) {
                alert("两次输入的密码不一致！");
                return false;
            }
            return true;
        }
    </script>
</head>
<body style="background: url(images/page2.jpg);background-size:100% 100% ; background-attachment: fixed ">
<center>
    <form method="post" name="f" action="Update" onsubmit="return check(this)">
        <table border="0" width="300" height="150">
            <input type="hidden" name="id" value="<%=student.getId()%>"><br>
            <tr>
                <td align="right"><font color="white" size="4">新昵称：<input type="text" name="name"><br></font></td>
            <tr><br>
                <td align="right"><font color="white" size="4">新密码：<input type="password" name="pass"><br></font></td>
            <tr><br>
                <td align="right"><font color="white" size="4">确认密码：<input type="password"
                                                                           name="confim_pass"><br></font></td>
                <br>
        </table>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <input type="submit" value="确定">&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="reset" value="重置"><br>
    </form>

</center>
</body>
</html>