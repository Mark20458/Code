<%@ page import="dao.BookDao" %>
<%@ page import="model.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.BorrowDao" %>
<%@ page import="model.Borrow" %>
<%@ page import="model.Student" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2022/6/26
  Time: 8:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看我借阅的书籍</title>
</head>
<body style="background: url(images/page2.jpg);background-size:100% 100% ; background-attachment: fixed ">
<%
    Student stu = (Student) session.getAttribute("student");
    BorrowDao borrowDao = new BorrowDao();
    ArrayList<Borrow> list = borrowDao.find(stu.getId());
    BookDao bookDao = new BookDao();
    Book book;
%>
<center>
    <%if (list != null) {%>
    <font size="4">您借阅的图书共 </font>
    <font size="5" color="red"><%=list.size()%>
    </font>
    </font>本</font>
    <br>
    <br>
    <table border="2" bgcolor="white" width="650">
        <tr bgcolor="CCCCCC" align="center">
            <th>书号</th>
            <th>书名</th>
            <th>作者</th>
            <th>介绍</th>
            <th>借阅时间</th>
            <th>归还时间</th>
        </tr>
        <%
            for (int i = 0; i < list.size(); i++) {
                book = bookDao.find(list.get(i).getBook_id());
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
            <td><%=list.get(i).getT1()%>
            </td>
            <td><%=list.get(i).getT2()%>
            </td>
            <td><a href="ReturnBook?book_id=<%=book.getId()%>&stu_id=<%=stu.getId()%>">还书</a>
            </td>
        </tr>
        <%}%>
    </table>
    <%} else {%>
    <font size="4">您借阅的图书共 </font>
    <font size="5" color="red">0
    </font>
    </font>本</font>
    <%}%>
</center>
</body>
</html>
