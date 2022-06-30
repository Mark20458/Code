<%@ page import="model.Student" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2022/6/26
  Time: 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="background: url(images/page2.jpg);background-size:100% 100% ; background-attachment: fixed ">
<center>
<br><br>
    <h1><font size="5">输入图书的名字</font></h1>
    <form name="find" action="FindBook.jsp" method="post">
        <label>
            <input type="text" style="width: 30%" name="book_name">
        </label>
        <input type="submit" value="搜索">
    </form>
</center>
</body>
</html>
