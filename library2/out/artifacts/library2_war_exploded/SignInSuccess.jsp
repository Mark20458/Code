<%@ page import="model.Student" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2022/6/25
  Time: 23:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录成功</title>
    <meta http-equiv="refresh" content="3;url=index_01.jsp">
</head>
<body style="background: url(images/page6.jpg);background-size:100% 100% ; background-attachment: fixed ">
<%
    request.setCharacterEncoding("UTF-8");
    Student stu = (Student) request.getAttribute("student");
    session.setAttribute("student", stu);
%>
<font size="4" color="white">登录成功！3秒后自动跳转……<a href="index_01.jsp">立即进入</a></font>
</body>
</html>
