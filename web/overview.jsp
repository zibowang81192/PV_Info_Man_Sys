<%--
  Created by IntelliJ IDEA.
  User: Pluto
  Date: 2021/6/30
  Time: 8:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>项目概况</title>
</head>
<body>

<div>
    <table>

        <c:forEach items="${list}" var="program">
            <tr>
                <td>项目号:</td>
                <td>${program.PNO}</td>

            </tr>
            <tr>
                <td>项目名称:</td>

                <td>${program.PNAME}</td>
            </tr>
            <tr>
                <td>项目类型:</td>
                <td>${program.PTYPE}</td>

            </tr>
            <tr>
                <td>项目阶段:</td>
                <td>${program.PTERM}</td>
            </tr>
            <tr>
                <td>项目业主:</td>
                <td>${program.POWNER}</td>

            </tr>
            <tr>
                <td>项目所属集团:</td>

                <td>${program.PFIRM}</td>
            </tr>
            <tr>
                <td>日期:</td>
                <td>${program.PYEAR}.${program.PMONTH}</td>
            </tr>

            <tr>
                <td>
                    <a href="siteInfo?id=${program.PNO}">厂址信息</a>
                </td>
                <td>
                    <a href="findByPNO?id=${program.PNO}">修改</a>
                </td>
                <td>
                    <a href="proList">返回</a>
                </td>
            </tr>

        </c:forEach>

    </table>

</div>

</body>
</html>
