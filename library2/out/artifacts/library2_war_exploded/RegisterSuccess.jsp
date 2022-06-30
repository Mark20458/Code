<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2022/6/26
  Time: 0:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册成功</title>
</head>
<body style="background: url(images/page7.jpg);background-size:100% 100% ; background-attachment: fixed ">
<% request.setCharacterEncoding("UTF-8");
    String id = (String) request.getAttribute("ID");
%>
<font size="5" color="white">
您的账号已注册成功！<br>
账号ID：<%=id%><br>
请牢记您的账号ID<a href="index.jsp">返回登录</a>
</font>
</body>
</html>
