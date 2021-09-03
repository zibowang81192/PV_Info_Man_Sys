<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>update site_factory information</title>
    <link rel="stylesheet" href="image/update_site_info.css"/>
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
        <form action="update_SITEInfo?FNO=${site_factory.FNO}" method="post">
            <div class="tablecontext">
                <table class="ta">
                    <tr class="tar">
                        <td class="tad1">厂址号:</td>
                        <td class="tad2">${site_factory.FNO}</td>
                    </tr>
                    <tr class="tar">
                        <td class="tad1">位置:</td>
                        <td class="tad2">
                            <div class="group">
                                <input type="text" value="${site_factory.LOC}" name="LOC" required>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label></label>
                            </div>
                        </td>
                    </tr>
                    <tr class="tar">
                        <td class="tad1">场址特征:</td>
                        <td class="tad2">
                            <div class="group">
                                <input type="text" value="${site_factory.FCHARACTER}" name="FCHARACTER" >
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label></label>
                            </div>
                        </td>
                    </tr>
                    <tr class="tar">
                        <td class="tad1">省份:</td>
                        <td class="tad2">
                            <div class="group">
                                <input type="text" value="${site_factory.PROVINCE}" name="PROVINCE" >
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label></label>
                            </div>
                        </td>
                    </tr>
                    <tr class="tar">
                        <td class="tad1">城市:</td>
                        <td class="tad2">
                            <div class="group">
                                <input type="text" value="${site_factory.CITY}" name="CITY" >
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label></label>
                            </div>
                        </td>
                    </tr>
                    <tr class="tar">
                        <td class="tad1">县区:</td>
                        <td class="tad2">
                            <div class="group">
                                <input type="text" value="${site_factory.COUNTRY}" name="COUNTRY" >
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label></label>
                            </div>
                        </td>
                    </tr>
                    <tr class="tar">
                        <td class="tad1">安装容量:</td>
                        <td class="tad2">
                            <div class="group">
                                <input type="text" value="${site_factory.CAPACITY}" name="CAPACITY" >
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label></label>
                            </div>
                        </td>
                    </tr>
                    <tr class="tar">
                        <td class="tad1">用地面积:</td>
                        <td class="tad2">
                            <div class="group">
                                <input type="text" value="${site_factory.AREA}" name="AREA">
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label></label>
                            </div>
                        </td>
                    </tr>
                    <tr class="tar">
                        <td class="tad1">海拔高度范围最大值:</td>
                        <td class="tad2">
                            <div class="group">
                                <input type="text" value="${site_factory.ALTITUDE_MAX}" name="ALTITUDE_MAX">
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label></label>
                            </div>
                        </td>
                    </tr>
                    <tr class="tar">
                        <td class="tad1">海拔高度范围最小值:</td>
                        <td class="tad2">
                            <div class="group">
                                <input type="text" value="${site_factory.ALTITUDE_MIN}" name="ALTITUDE_MIN">
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label></label>
                            </div>
                        </td>
                    </tr>
                    <tr class="tar">
                        <td class="tad1">经度:</td>
                        <td class="tad2">
                            <div class="group">
                                <input type="text" value="${site_factory.LONGITUDE}" name="LONGITUDE" >
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label></label>
                            </div>
                        </td>
                    </tr>
                    <tr class="tar">
                        <td class="tad1"></td>
                        <td class="tad2">
                            <div class="group">
                                <input type="text" value="${site_factory.LONGITUDE_EORW}" name="LONGITUDE_EORW" >
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label></label>
                            </div>
                        </td>
                    </tr>
                    <tr class="tar">
                        <td class="tad1">纬度:</td>
                        <td class="tad2">
                            <div class="group">
                                <input type="text" value="${site_factory.LATITUDE}" name="LATITUDE" required>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label></label>
                            </div>
                        </td>
                    </tr>
                    <tr class="tar">
                        <td class="tad1"></td>
                        <td class="tad2">
                            <div class="group">
                                <input type="text" value="${site_factory.LATITUDE_NORS}" name="LATITUDE_NORS" required>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label></label>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <button class="custom-btn btn-16" type="submit" value="提交"> 提  交 </button>
            <button class="custom-btn btn-15" onclick="window.location.href='siteInfo?id=${site_factory.FNO}'"> 返  回 </button>
        </form>
    </div>
</div>
</body>
</html>