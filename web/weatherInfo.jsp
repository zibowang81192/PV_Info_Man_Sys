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

        <c:forEach items="${list}" var="WEATHER">
            <tr>
                <td>编号:</td>
                <td>${WEATHER.WNO}</td>

            </tr>
            <tr>
                <td>水平太阳总辐射（MJ）:</td>

                <td>${WEATHER.LSRA_MJ}</td>
            </tr>
            <tr>
                <td>水平太阳总辐射（KWH）:</td>

                <td>${WEATHER.LSRA_KWH}</td>
            </tr>
            <tr>
                <td>多年平均气温:</td>

                <td>${WEATHER.YMAT}</td>
            </tr>
            <tr>
                <td>多年极端最高气温:</td>
                <td>${WEATHER.YHT}</td>

            </tr>
            <tr>
                <td>多年极端最低气温:</td>
                <td>${WEATHER.YLT}</td>
            </tr>
            <tr>
                <td>最热月平均气温:</td>
                <td>${WEATHER.HMMT}</td>

            </tr>
            <tr>
                <td>多年最大冻土深度:</td>

                <td>${WEATHER.MDFS}</td>
            </tr>
            <tr>
                <td>多年平均风速:</td>
                <td>${WEATHER.AWS}</td>
            </tr>
            <tr>
                <td>多年极大风速:</td>
                <td>${WEATHER.EWS}</td>
            </tr>
            <tr>
                <td>多年平均雷暴日数:</td>
                <td>${WEATHER.ATD}</td>
            </tr>
            <tr>
                <td>污秽等级:</td>
                <td>${WEATHER.PC}</td>
            </tr>
        </c:forEach>
        <tr>
            <td>
                <a href="siteInfo?id=${FNO}">返回</a>
            </td>
        </tr>

    </table>

</div>

</body>
</html>
