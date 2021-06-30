<%--
  Created by IntelliJ IDEA.
  User: Pluto
  Date: 2021/6/29
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Program List</title>
</head>
<body>

    <div class="title">
        <p>项目列表</p>
    </div>
    <div>
        <table>
            <tr>
                <td>项目号</td>
                <td>项目名称</td>
                <td>设计单位</td>

            </tr>
            <c:forEach items="${list}" var="brief">
            <tr>
                <td>${brief.PNO}</td>
                <td>${brief.PNAME}</td>
                <td>${brief.DNAME}</td>
                <td class="content link">
                    <a href="overview?id=${brief.PNO}">详情</a>
                    <a href="delete?id=${brief.PNO}">删除</a>

                    <%--
                     <form action="overview" method="get">
                        <input type="button" value="详情" name="name" id="${brief.PNO}">
                    </form>

                    --%>
                </td>

            </tr>
            </c:forEach>
        </table>
    </div>

</body>
</html>
