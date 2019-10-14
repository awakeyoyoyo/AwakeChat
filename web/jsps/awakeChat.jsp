<%@ page import="com.awakeyo.socket.UserManager" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fasterxml.jackson.core.type.TypeReference" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%--
  Created by IntelliJ IDEA.
  User: awakeyoyoyo
  Date: 2019-10-10
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <!-- Bootstrap -->
    <!--引入相关的js文件-->
    <script type="text/javascript" src="/javaweb02/js/jquery-3.4.1.min.js"></script>
    <link href="/javaweb02/css/bootstrap.min.css" rel="stylesheet" media="screen">

    <script src="/javaweb02/js/bootstrap.min.js"></script>

    <title>Awake的Chat</title>
</head>
<%
String username="";
username=request.getParameter("username");
if (username==null){
    username="";
}

    String json=(String)request.getAttribute("names");
    ObjectMapper mapper=new ObjectMapper();
    ArrayList<String> usernames=mapper.readValue(json, new TypeReference<ArrayList<String>>() {});
//    out.print(json);
%>
<style>
    *{
        margin: 0;
        padding: 0;
    }
    .adiv {
        border: 1px black solid;
    }
</style>
<body>
<div class="page-header center-block">
    <h1>Awakeyo Chat Room<small> by lqhao</small></h1>
</div>
<div class="alert alert-warning alert-dismissible" role="alert">
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
<strong>注意事项！</strong>  纯碎刷下纯在感～
</div>
<div class="container">
    <div class="row adiv">
        <div class="col-md-3 adiv" style="height: 400px;">

            <table class="table table-striped" id="userList">
                <h3>在线用户列表</h3>
                <tr class="active"><td>lqhao----测试样例</td></tr>
                <tr class="active"><td>zpwei----测试样例</td></tr>
                <c:forEach var="name" items="<%=usernames%>">
                    <tr class="active"><td>${name}</td></tr>
                </c:forEach>
            </table>


        </div>
        <div class="col-md-9 adiv" style="height: 400px" id="chatlist">
                <h3>----</h3>
                <p class="bg-info">2019-10-12 15:14 lqhao:hahahahaha----测试样例</p>
                <p class="bg-info">2019-10-12 15:14 zpwei:lalalalala----测试样例</p>
        </div>
    </div>
    <div class="row ">
        <div class="col-md-3 adiv" style="border: 2px solid black">
            <p class="lead" id="peopler_num">在线人数：1</p>
            <p class="lead"><%=username%></p>
        </div>
        <div class="col-md-9 adiv" style="border: 2px solid black">
            <textarea class="form-control" rows="3" id="message"></textarea>
            <button type="button" class="btn btn-info" onclick="test()">发送信息</button>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    var websocket = null;
    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        websocket = new WebSocket("ws://localhost:8080/javaweb02/websocket/<%=username%>");

        //连接成功建立的回调方法
        websocket.onopen = function () {
           // websocket.send("客户端链接成功");
        }

        //接收到消息的回调方法
        websocket.onmessage = function (event) {
            var msg=event.data;
          //  alert(msg);
            if (msg.split("|")[0]=="msg"){
                // 信息
                var messageItem=" <p class=\"bg-info\">" +
                    msg.split("|")[1] +
                    "</p>";
                $("#chatlist").append(messageItem);
            }
            if (msg.split("|")[0]==("numberadd")){
               $("#peopler_num").text("在线人数："+msg.split("|")[1]);

                var user=" <tr class=\"active\" id=\""+msg.split("|")[2]+
                    "\"><td>" +
                    msg.split("|")[2] +
                    "</td></tr>";
                $("#userList").children().append(user);

            }
            if (msg.split("|")[0]==("numberremove")){
                var number=document.getElementById("peopler_num");
                number.innerHTML="在线人数："+msg.split("|")[1];
                var user=document.getElementById(msg.split("|")[2]);
                user.remove();
            }
        }

        //连接发生错误的回调方法
        websocket.onerror = function () {
            alert("WebSocket连接发生错误");
        };

        //连接关闭的回调方法
        websocket.onclose = function () {
            alert("WebSocket连接关闭");
        }

        //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
        window.onbeforeunload = function () {
            closeWebSocket();
        }

    }
    else {
        alert('当前浏览器 Not support websocket')
    }
    //关闭WebSocket连接
    function closeWebSocket() {
        websocket.close();
    }
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg);  //匹配目标参数

        if (r != null)
            return decodeURIComponent(r[2]);
        else
            return null; //返回参数值
    }
    function test() {
        var msg=$("#message").val();
        $("#message").val("");
        var j={};
        j.msg=msg;
        j.username=getUrlParam("username");
        j.sendTime=new Date().valueOf();
        var a=JSON.stringify(j);
        websocket.send(a);
    }
</script>
</html>
