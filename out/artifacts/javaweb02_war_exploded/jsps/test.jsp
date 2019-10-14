<%--
  Created by IntelliJ IDEA.
  User: awakeyoyoyo
  Date: 2019-10-09
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>小测试</title>
</head>
<form action="/javaweb02/test" method="get">
<br>1.周四晚上国足能否战胜关岛?</br>
<h5><input type="radio" name="test01" value="yes">能</h5>
<h5><input type="radio" name="test01" value="false">不能</h5>

<br>2.以下谁不是国足中的一员?</br>
<h5><input type="radio" name="test02" value="gaolin">郜林思曼</h5>
<h5><input type="radio" name="test02" value="wulei">吴所不磊</h5>
<h5><input type="radio" name="test02" value="weishihao">WEST.世豪</h5>
<h5><input type="radio" name="test02" value="rose">罗斯</h5>

<br>3.国足可以战胜一下的哪些队伍?</br>
<h5><input type="checkbox" name="test03" value="baxi">巴西</h5>
<h5><input type="checkbox" name="test03" value="deguo">德国</h5>
<h5><input type="checkbox" name="test03" value="riben">日本</h5>
<h5><input type="checkbox" name="test03" value="putaoya">葡萄牙</h5>
<h5><input type="checkbox" name="test03" value="agenting">阿根廷</h5>

<br>4.中国有哪些著名的球星</br>
<input type="text" name="test04">

<br>5.中国亚冠最多的队伍是<input type="text" name="test05">,他位于主场广州</br>
    <h3><input type="submit" value="提交"></h3>
</form>
</body>
</html>
