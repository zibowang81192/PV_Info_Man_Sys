<%--
  Created by IntelliJ IDEA.
  User: Pluto
  Date: 2021/6/30
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加项目</title>
</head>
<body>
    <form action="addInfo" method="post">

        <table>
            <tr><td><p>项目信息</p></td></tr>
            <tr>
                <td>项目号:</td>
                <td>
                    <input type="text" placeholder="注意项目号需唯一" name="PNO" required>
                </td>

            </tr>
            <tr>
                <td>项目名称:</td>
                <td>
                    <input type="text" name="PNAME" required>
                </td>

            </tr>
            <tr>
                <td>项目类型:</td>
                <td>
                    <input type="text" name="PTYPE" required>
                </td>

            </tr>
            <tr>
                <td>项目阶段:</td>
                <td>
                    <input type="text" name="PTERM" required>
                </td>

            </tr>
            <tr>
                <td>项目业主:</td>
                <td>
                    <input type="text" name="POWNER" required>
                </td>

            </tr>
            <tr>
                <td>项目所属集团:</td>
                <td>
                    <input type="text" name="PFIRM" required>
                </td>

            </tr>
            <tr>
                <td>日期:</td>
                <td>
                    <input type="text" placeholder="   年" name="PYEAR" required>
                    <input type="text" placeholder="   月" name="PMONTH" required>
                </td>

            </tr>

            <tr>
                <td>设计单位:</td>
                <td>
                    <input type="text" name="DNAME" required>
                </td>

            </tr>

        </table>
        <table>
            <tr><td><p>厂址信息</p></td></tr>

           <%-- <tr>
                <td>厂址号:</td>
                <td>
                    <input type="text" name="FNO" required>
                </td>
            </tr>--%>


            <tr>
                <td>位置:</td>
                <td>
                    <input type="text" name="LOC" required>
                </td>
            </tr>
            <tr>
                <td>厂址特征:</td>
                <td>
                    <input type="text" name="FCHARACTER">
                </td>

            </tr>
            <tr>
                <td>省份:</td>
                <td>
                    <input type="text" name="PROVINCE" required>
                </td>

            </tr>
            <tr>
                <td>城市:</td>
                <td>
                    <input type="text" name="CITY" required>
                </td>

            </tr>
            <tr>
                <td>县区:</td>
                <td>
                    <input type="text" name="COUNTRY" required>
                </td>

            </tr>
            <tr>
                <td>安装容量:</td>
                <td>
                    <input type="text" name="CAPACITY" required>
                </td>

            </tr>
            <tr>
                <td>用地面积:</td>
                <td>
                    <input type="text" name="AREA" required>
                </td>

            </tr>
            <tr>
                <td>最高海拔:</td>
                <td>
                    <input type="text" name="ALTITUDE_MAX" required>
                </td>

            </tr>
            <tr>
                <td>最低海拔:</td>
                <td>
                    <input type="text" name="ALTITUDE_MIN" required>
                </td>

            </tr>
            <tr>
                <td>经纬度:</td>
                <td>
                    <input type="text" placeholder="经度" name="LONGITUDE" required>
                    <input type="text" placeholder="east or west" name="LONGITUDE_EORW" required>
                    <input type="text" placeholder="纬度" name="LATITUDE" required>
                    <input type="text" placeholder="north or south" name="LATITUDE_NORS" required>
                </td>

            </tr>

        </table>
        <table>
            <tr><td><p>气象信息</p></td></tr>
        <%--<tr>
                <td>编号:</td>
                <td>
                    <input type="text" name="WNO" required>
                </td>

            </tr>--%>

            <tr>
                <td>水平太阳总辐射（MJ）:</td>
                <td>
                    <input type="text" name="LSRA_MJ" required>
                </td>

            </tr>
            <tr>
                <td>水平太阳总辐射（KWH）:</td>
                <td>
                    <input type="text" name="LSRA_KWH" required>
                </td>

            </tr>
            <tr>
                <td>最佳辐射量倾角:</td>
                <td>
                    <input type="text" name="BRA" required>
                </td>

            </tr>
            <tr>
                <td>多年平均气温:</td>
                <td>
                    <input type="text" name="YMAT" required>
                </td>

            </tr>
            <tr>
                <td>多年极端最高气温:</td>
                <td>
                    <input type="text" name="YHT" required>
                </td>

            </tr>
            <tr>
                <td>多年极端最低气温:</td>
                <td>
                    <input type="text" name="YLT" required>
                </td>

            </tr>
            <tr>
                <td>最热月平均气温:</td>
                <td>
                    <input type="text" name="HMMT" required>
                </td>

            </tr>
            <tr>
                <td>多年最大冻土深度:</td>
                <td>
                    <input type="text" name="MDFS" required>
                </td>

            </tr>
            <tr>
                <td>多年平均风速:</td>
                <td>
                    <input type="text" name="AWS" required>
                </td>
            </tr>
            <tr>
                <td>多年极大风速:</td>
                <td>
                    <input type="text" name="EWS" required>
                </td>

            </tr>
            <tr>
                <td>多年平均雷暴日数:</td>
                <td>
                    <input type="text" name="ATD" required>
                </td>

            </tr>
            <tr>
                <td>污秽等级:</td>
                <td>
                    <input type="text" name="PC" required>
                </td>

            </tr>
            <tr>
                <td>
                    <input type="submit" value="提交"/>
                </td>
            </tr>
        </table>

    </form>
</body>
</html>
