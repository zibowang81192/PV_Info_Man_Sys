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
    <link rel="stylesheet" href="image/site_info.css">
</head>
<body>
<c:forEach items="${list}" var="site">
<canvas id="myCanvas"></canvas>
<script type="text/javascript">
    var canvasPage3 = document.getElementById("myCanvas");
    canvasPage3.width = 1279;
    canvasPage3.height = 663;
    var ctx = canvasPage3.getContext("2d");
    var zhongX = 800;
    var zhongY = 385;
    function randomNum(x,y)
    {
        return Math.floor(Math.random() * (y - x + 1) + x);
    }

    function randomColor() {
        return "rgb(" + randomNum(0, 255) + "," + randomNum(0, 255) + "," + randomNum(0, 255) + ")";
    }

    function Ball() {
        this.r = randomNum(0.1, 3);
        this.color = "white";

        this.x = randomNum(this.r, canvasPage3.width - this.r);
        this.y = randomNum(this.r, canvasPage3.height - this.r);

        this.speedX = randomNum(1, 3) * (randomNum(0, 1) ? 1 : -1);
        this.speedY = randomNum(1, 3) * (randomNum(0, 1) ? 1 : -1);
    }

    Ball.prototype.move = function () {
        this.x += this.speedX*0.2;
        this.y += this.speedY*0.2;

        if(this.x<=this.r)
        {
            this.x = this.r;
            this.speedX *= -1;
        }
        if(this.x>=canvasPage3.width -this.r)
        {
            this.x = canvasPage3.width - this.r
            this.speedX *= -1;
        }
        //小球碰到上边界的处理 反弹
        if (this.y <= this.r) {
            this.y = this.r;
            //反弹
            this.speedY *= -1;
        }
        //小球碰到下边界的处理 反弹
        if (this.y >= canvasPage3.height - this.r) {
            this.y = canvasPage3.height - this.r;
            //反弹
            this.speedY *= -1;
        }
    }

    Ball.prototype.draw = function () {
        ctx.beginPath();
        ctx.arc(this.x, this.y, this.r, 0, Math.PI * 2, false);
        ctx.fillStyle = this.color;
        ctx.fill();
    }

    var balls = [];
    var arr = [];
    for (var i = 0; i < 0.0002 * canvasPage3.width * canvasPage3.height; i++) {
        var ball = new Ball();
        balls.push(ball);
    }

    setInterval(function () {
        arr = [];
        ctx.clearRect(0, 0, canvasPage3.width, canvasPage3.height);
        for (var i = 0; i < balls.length; i++) {
            balls[i].move();
            balls[i].draw();
            if (ballAndMouse(balls[i]) < 130) {
                ctx.lineWidth = (130 - ballAndMouse(balls[i])) * 1.5 / 130;
                ctx.beginPath();
                ctx.moveTo(balls[i].x, balls[i].y);
                ctx.lineTo(zhongX, zhongY);
                ctx.strokeStyle = balls[i].color;
                ctx.stroke();
            }
        }


        for (var i = 0; i < balls.length; i++) {
            for (var j = 0; j < balls.length; j++) {
                if (ballAndBall(balls[i], balls[j]) < 80) {
                    ctx.lineWidth = (80 - ballAndBall(balls[i], balls[j])) * 0.6 / 80;
                    ctx.globalAlpha = (130 - ballAndBall(balls[i], balls[j])) * 1 / 80;
                    ctx.beginPath();
                    ctx.moveTo(balls[i].x, balls[i].y);
                    ctx.lineTo(balls[j].x, balls[j].y);
                    ctx.strokeStyle = balls[i].color;
                    ctx.stroke();
                }
            }
        }
        ctx.globalAlpha = 1.0;

    }, 30);

    canvasPage3.onmousemove = function (event) {
        event = event || window.event;
        zhongX = event.offsetX;
        zhongY = event.offsetY;
    }

    function ballAndMouse(obj) {
        var disX = Math.abs(zhongX - obj.x);
        var disY = Math.abs(zhongY - obj.y);
        return Math.sqrt(disX * disX + disY * disY);
    }
    function ballAndBall(obj1, obj2) {
        var disX = Math.abs(obj1.x - obj2.x);
        var disY = Math.abs(obj1.y - obj2.y);
        return Math.sqrt(disX * disX + disY * disY);
    }

</script>
<div class="box">
    <table class="ta">

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
        <div class="line"></div>
        <button class="custom-btn btn-16" onclick="window.location.href='weatherInfo?id=${site.FNO}'">气象信息</button>
        <button class="custom-btn btn-14" onclick="window.location.href='findByFNO?id=${site.FNO}'"> 修  改 </button>
        <button class="custom-btn btn-15" onclick="window.location.href='overview?id=${PNO}'"> 返  回 </button>
        </c:forEach>
    </table>
</div>
</body>
</html>