<%@ page import="dao.BookDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Book" %>
<%@ page import="model.Student" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2022/6/26
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><%
    Student stu = (Student) request.getAttribute("stu");
    request.setAttribute("stu", stu);%>
    <title>查询结果</title>
</head>
<body style="background: url(images/page2.jpg);background-size:100% 100% ; background-attachment: fixed ">
<%
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("book_name");
    BookDao bookDao = new BookDao();
    ArrayList<Book> list = bookDao.find(name);
%>
<% if (list != null) {%>
<center>
    <font size="4">查询到的图书共有 <font size="5" color="red"><%=list.size()%>
    </font>本</font>
    <br>
    <br>
    <table border="2" bgcolor="white" width="650">
        <tr bgcolor="CCCCCC" align="center">
            <th>书号</th>
            <th>书名</th>
            <th>作者</th>
            <th>介绍</th>
            <th>数量</th>
            <th></th>
        </tr>
        <%
            for (int i = 0; i < list.size(); i++) { %>
        <tr align="center">
            <td><%= list.get(i).getId()%>
            </td>
            <td><%= list.get(i).getName() %>
            </td>
            <td><%= list.get(i).getAuthor() %>
            </td>
            <td><%= list.get(i).getIntro() %>
            </td>
            <td><%=list.get(i).getNum()%>
            </td>
            <td><a href="borrow.jsp?book_id=<%=list.get(i).getId()%>">借阅</a>
            </td>
        </tr>
        <% }%></table>
</center>
<%} else {%>
<center>
    查询到的图书共有 <font size="5" color="red">0
</font>本
    <%}%>
</center>
</body>
</html>
