<%--
  Created by IntelliJ IDEA.
  User: Pluto
  Date: 2021/6/29
  Time: 9:36
  To change this template use File | Settings | File Templates.
  explanation: login
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>login</title>
  <!--清除边距-->
  <link type="text/css" rel="stylesheet" href="image/index.css"/>
</head>
<body>
<form action="login" method="get">

  <div class="main">
    <!--登录框-->
    <div class="loginFrame">
      <!--标题-->
      <p class="loginTitle">Login</p>
      <!--用户名-->
      <div class="user">
        <input type="text" placeholder="   UserName" name="username">
      </div>
      <!--密码-->
      <div class="password">
        <input type="password" placeholder="   PassWord" name="password">
      </div>
      <!--登录按钮-->
      <div>
        <button name="user" value="admin">管理员登入</button>
      </div>
      <div>
        <button name="user" value="student">学生登入</button>
      </div>

    </div>

  </div>

</form>
</body>
</html>

