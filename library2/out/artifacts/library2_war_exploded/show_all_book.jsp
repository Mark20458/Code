<%@ page import="dao.BookDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Book" %>
<%@ page import="model.Student" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2022/6/26
  Time: 8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看全部图书</title>
    <script>
        function check(i) {
            if (i <= 0) {
                alert("图书数量不够！");
                return false;
            }
            return true;
        }
    </script>
</head>
<body style="background: url(images/page2.jpg);background-size:100% 100% ; background-attachment: fixed ">
<center><%
    BookDao bookDao = new BookDao();
    ArrayList<Book> list = bookDao.find("");
    if (list != null) {%>
    <font size="4">全部图书共有 <font size="5" color="red"><%=list.size()%>
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
            <td><a href="borrow.jsp?book_id=<%=list.get(i).getId()%>" onclick="return check(<%=list.get(i).getNum()%>)">借阅</a>
            </td>
        </tr>
        <% }
        } else {%></table>
    <font size="4">全部图书共有 <font size="5" color="red">0
    </font>本</font>
    <%}%>
</center>
</body>
</html>
