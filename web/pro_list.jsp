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
                <td>项目类型</td>
                <td>项目阶段</td>
                <td>项目业主</td>
                <td>项目所属集团</td>
                <td>年</td>
                <td>月</td>
            </tr>
            <c:forEach items="${list}" var="program">
            <tr>
                <td>${program.PNO}</td>
                <td>${program.PNAME}</td>
                <td>${program.PTYPE}</td>
                <td>${program.PTERM}</td>
                <td>${program.POWNER}</td>
                <td>${program.PFIRM}</td>
                <td>${program.PYEAR}</td>
                <td>${program.PMONTH}</td>
            </tr>
            </c:forEach>
        </table>
    </div>

</body>
</html>
