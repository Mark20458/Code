<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2022/6/28
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加图书</title>
    <script>
        function check(f) {
            if (f.id.value == "") {
                alert("书号不能为空！");
                return false;
            }
            if (f.name.value == "") {
                alert("书名不能为空！");
                return false;
            }
            if (f.author.value == "") {
                alert("作者不能为空！");
                return false;
            }
            if (f.num.value == "" || f.num.value <= 0) {
                alert("数量必须大于0");
                return false;
            }
            return true;
        }
    </script>
</head>
<body style="background: url(images/page2.jpg);background-size:100% 100% ; background-attachment: fixed ">
<center>
    <form method="post" action="AddBook" name="f" onsubmit="return check(this)">
        <table border="0" width="300" height="200">
            <tr>
                <td align="right"><font color="white" size="4"> 书号：<input type="text" name="id"><br></font></td>
            </tr>
            <tr><br>
                <td align="right"><font color="white" size="4"> 书名：<input type="text" name="name"><br></font></td>
            </tr>
            <tr><br>
                <td align="right"><font color="white" size="4"> 作者：<input type="text" name="author"><br></font></td>
            </tr>
            <tr><br>
                <td align="right"><font color="white" size="4"> 简介：<input type="text" name="intro"><br></font></td>
            </tr>
            <tr><br>
                <td align="right"><font color="white" size="4"> 数量：<input type="text" name="num"><br></font></td>
            </tr>
            <br>
        </table>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" value="确定">&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="reset" value="重置"><br>
    </form>
</center>
</body>
</html>
