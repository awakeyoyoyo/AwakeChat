<%--
  Created by IntelliJ IDEA.
  User: awakeyoyoyo
  Date: 2019-10-09
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>登陆页面</title>
</head>
<body>
<%
String username="";
username=request.getParameter("username");
    if (username==null){
        username="";
    }
String password="";
password=request.getParameter("password");
    if (password==null){
        password="";
    }
%>
<form ACTION="/javaweb02/login" METHOD="post">
    <table>
        <tr>
            <td>用户名：</td> <td><input type="text" name="username" ></td>
        </tr>
        <tr>
            <td>密码：</td> <td><input type="password" name="password" ></td>
        </tr>
        <tr>
            <td><input type="submit" value="登陆"></td>
        </tr>
    </table>
    <h1><%=username%></h1>
    <h1><%=password%></h1>
</form>
</body>
</html>
