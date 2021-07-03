<%--
  Created by IntelliJ IDEA.
  User: Pluto
  Date: 2021/7/3
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>update program overview</title>
</head>
<body>
<div>
    <table>

        <form action="update_overview?PNO=${program.PNO}" method="post">

            <tr>
                <td>项目号:</td>
                <td>${program.PNO}</td>

            </tr>
            <tr>
                <td>项目名称:</td>
                <td><input type="text" value="${program.PNAME}" name="PNAME" required></td>
            </tr>
            <tr>
                <td>项目类型:</td>
                <td><input type="text" value="${program.PTYPE}" name="PTYPE" required></td>
            </tr>
            <tr>
                <td>项目阶段:</td>
                <td><input type="text" value="${program.PTERM}" name="PTERM" required></td>
            </tr>
            <tr>
                <td>项目业主:</td>
                <td><input type="text" value="${program.POWNER}" name="POWNER"></td>
            </tr>
            <tr>
                <td>项目所属集团:</td>
                <td><input type="text" value="${program.PFIRM}" name="PFIRM"></td>
            </tr>
            <tr>
                <td>日期:</td>
                <td>

                <input type="text" value="${program.PYEAR}" name="PYEAR" required>
                <input type="text" value="${program.PMONTH}" name="PMONTH" required>
                </td>
            </tr>

            <tr>
                <td>
                    <input type="submit" value="提交"/>
                </td>
            </tr>


        </form>


        <tr>
            <td>
                <a href="overview?id=${program.PNO}">返回</a>
            </td>
        </tr>

    </table>

</div>

</body>
</html>
