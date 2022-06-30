<%@ page import="model.Student" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2022/6/26
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        Student stu = (Student) request.getAttribute("stu");
        request.setAttribute("stu", stu);%>
    <title>添加失败</title>
</head>
<body style="background: url(images/page2.jpg);background-size:100% 100% ; background-attachment: fixed ">
<font color="white" size="4">添加失败！<a href="index_01_right.jsp">返回</a></font>
</body>
</html>
