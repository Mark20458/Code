<%@ page import="dao.BorrowDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Borrow" %>
<%@ page import="model.Book" %>
<%@ page import="dao.BookDao" %>
<%@ page import="model.Student" %>
<%@ page import="dao.StudentDao" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2022/6/28
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>借阅信息</title>
</head>
<body style="background: url(images/page2.jpg);background-size:100% 100% ; background-attachment: fixed ">
<%
    BorrowDao borrowDao = new BorrowDao();
    ArrayList<Borrow> list = borrowDao.findAll();
    Student student;
    StudentDao studentDao = new StudentDao();
    Book book;
    BookDao bookDao = new BookDao();
%>
<center>
    <%if (list != null) {%>
    <font size="4">共有 <font size="5" color="red"><%=list.size()%>
    </font>本图书被借阅</font>
    <br>
    <br>
    <table border="2" bgcolor="white" width="650">
        <tr bgcolor="CCCCCC" align="center">
            <th>书号</th>
            <th>书名</th>
            <th>作者</th>
            <th>介绍</th>
            <th>借阅人</th>
            <th>借阅人ID</th>
            <th>借阅时间</th>
            <th>归还时间</th>
            <th></th>
        </tr>
        <%
            for (int i = 0; i < list.size(); i++) {
                book = bookDao.find(list.get(i).getBook_id());
                student = studentDao.find(list.get(i).getStu_id());
        %>
        <tr align="center">
            <td><%=book.getId()%>
            </td>
            <td><%=book.getName() %>
            </td>
            <td><%=book.getAuthor() %>
            </td>
            <td><%=book.getIntro() %>
            </td>
            <td><%=student.getName()%>
            </td>
            <td><%=student.getId()%>
            </td>
            <td><%=list.get(i).getT1()%>
            </td>
            <td><%=list.get(i).getT2()%>
            </td>
            <td><a href="ReturnBook?book_id=<%=book.getId()%>&stu_id=<%=student.getId()%>">强制还书</a>
            </td>
        </tr>
        <% }%></table>
    <%} else {%>
    <font size="4">共有 <font size="5" color="red">0
    </font>本图书被借阅</font>
    <%}%>
</center>
</body>
</html>
