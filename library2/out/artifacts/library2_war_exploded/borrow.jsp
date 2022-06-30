<%@ page import="model.Student" %>
<%@ page import="java.sql.Date" %>
<%@ page import="servlets.SignIn" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2022/6/26
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        request.setCharacterEncoding("UTF-8");
        String book_id = request.getParameter("book_id");
    %>
    <title>借阅图书</title>
    <script>
        function check(form) {
            let t = form.t2.value;
            let t1 = new Date();
            let t2 = new Date(Date.parse(t.replace(/-/g, "/")));
            if (t1 >= t2) {
                alert("借书必须超过一天！");
                return false;
            }
            return true;
        }
    </script>
</head>
<body style="background: url(images/page2.jpg);background-size:100% 100% ; background-attachment: fixed ">
<%
    Student stu = (Student) session.getAttribute("student");
%>
<center>
    <form name="Borrow" action="BorrowServlet" method="post" onsubmit="return check(this)">
        <table border="0" width="300" height="150">
            <tr>
                <td align="right"><font color="white" size="4">用户ID：</font><input type="text" value="<%=stu.getId()%>"
                                                                                  name="stu_id" readonly="readonly">
                </td>
            </tr>
            <br><br>
            <tr>
                <td align="right"><font color="white" size="4">图书编号：</font><input type="text" value="<%=book_id%>"
                                                                                  name="book_id" readonly="readonly">
                </td>
            </tr>
            <br><br>
            <tr>
                <td align="right"><font color="white" size="4">归还日期：</font><input type="text" name="t2"></td>
            </tr>
        </table>
        <br>
        <input type="submit" name="提交">
    </form>
</center>
<%
    session.setAttribute("student", stu);
%>
</body>
</html>