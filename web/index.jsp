<%--
  Created by IntelliJ IDEA.
  User: awakeyoyoyo
  Date: 2019-10-09
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>$Title$</title>
  </head>
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
  <body>
  <table>
    <tr>
      <Td><a href="jsps/login.jsp"><h2>登陆页面</h2></a></Td>
      <Td><h2></h2></Td>
    </tr>
    <tr>
      <Td><a href="jsps/test.jsp"><h2>网上小测试程序</h2></a></Td>
    </tr>
    <tr>
      <Td><a href="/javaweb02/chat?username=<%=username%>"><h2>简单的聊天室</h2></a></Td>
    </tr>
  </table>
  <h1><%=username%></h1>
  <h1><%=password%></h1>
  </body>
</html>
