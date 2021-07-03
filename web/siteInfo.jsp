<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Pluto
  Date: 2021/6/30
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>厂址信息</title>
</head>
<body>
<c:forEach items="${list}" var="site">
    <table>

        <tr>
            <td>厂址号:</td>
            <td>${site.FNO}</td>

        </tr>
        <tr>
            <td>位置:</td>

            <td>${site.LOC}</td>
        </tr>
        <tr>
            <td>厂址特征:</td>
            <td>${site.FCHARACTER}</td>

        </tr>
        <tr>
            <td>省份:</td>
            <td>${site.PROVINCE}</td>
        </tr>
        <tr>
            <td>城市:</td>
            <td>${site.CITY}</td>

        </tr>
        <tr>
            <td>县区:</td>

            <td>${site.COUNTRY}</td>
        </tr>
        <tr>
            <td>安装容量:</td>
            <td>${site.CAPACITY}</td>
        </tr>
        <tr>
            <td>用地面积:</td>
            <td>${site.AREA}</td>
        </tr>
        <tr>
            <td>最高海拔:</td>
            <td>${site.ALTITUDE_MAX}</td>
        </tr>
        <tr>
            <td>最低海拔:</td>
            <td>${site.ALTITUDE_MIN}</td>
        </tr>
        <tr>
            <td>经纬度:</td>
            <td>(${site.LONGITUDE}${site.LONGITUDE_EORW},${site.LATITUDE}${site.LATITUDE_NORS})</td>
        </tr>


    </table>

    <td>
        <a href="weatherInfo?id=${site.FNO}">气象信息</a>
    </td>

</c:forEach>

<tr>

    <td>
        <a href="overview?id=${PNO}">返回</a>
    </td>
</tr>

</body>
</html>
