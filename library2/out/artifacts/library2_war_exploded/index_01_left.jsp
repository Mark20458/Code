<%@ page import="model.Student" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2022/6/26
  Time: 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("UTF-8");
    Student stu = (Student) session.getAttribute("student");
    if (stu == null)
        stu = (Student) request.getAttribute("student");
%>
<html>
<head>
    <title>菜单页面</title>
</head>
<body style="background-color:#F0F8FF;">
欢迎你<%=stu.getName()%><%if (stu.isIdentity()) {%>
（管理员）
<%}%>!
<br>
<br><br><br>
<p><a href="show_all_book.jsp" target="right">查看全部图书</a></p>
<p><a href="find_book.jsp" target="right">搜索书籍</a></p>
<%if (stu.isIdentity()) {%>
<p><a href="show_all_borrow.jsp" target="right">查看全部借阅信息</a></p>
<p><a href="add_book.jsp" target="right">添加图书</a></p>
<%} else {%>
<p><a href="show_my_book.jsp" target="right">查看我的书籍</a></p>
<%}%>
<p><a href="update.jsp" target="right">修改个人信息</a></p>
<%
    session.setAttribute("student", stu);
%>
</body>
</html>
