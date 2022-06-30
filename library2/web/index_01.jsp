<%@ page import="model.Student" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2022/6/26
  Time: 8:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>图书管理系统</title></head>
<frameset rows="80,*">
    <frame src="index_01_title.jsp" scrolling="no">
    <frameset cols="200,*">
        <frame src="index_01_left.jsp" scrolling="no">
        <frame src="show_all_book.jsp" name="right" scrolling="auto">
    </frameset>
</frameset>
</html>
