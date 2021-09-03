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
    <link rel="stylesheet" href="image/weather_info.css">
</head>
<body>

<div>
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
                <div class="line"></div>
                <button class="custom-btn btn-12" onclick="window.location.href='siteInfo?id=${FNO}'"><span> 点  击 </span><span> 返  回 </span></button>
            </c:forEach>
        </table>
    </div>
</div>

</body>
</html>
