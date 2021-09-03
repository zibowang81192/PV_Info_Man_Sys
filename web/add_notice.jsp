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
  <link rel="stylesheet" href="image/add_notice.css">
</head>
<body>
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
  <form action="addInfo" method="post">
    <div class="title">
      <p>添加项目</p>
    </div>
    <div class="tablecontext">
      <table>
        <tr class="row">
          <td align="center" valign="middle" class="grid">项目号:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="PNO" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>项目号</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">项目名称:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="PNAME" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>项目名称</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">项目类型:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="PTYPE" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>项目类型</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">项目阶段:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="PTERM" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>项目阶段</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">项目业主:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="POWNER" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>项目业主</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">项目所属集团:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="PFIRM" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>项目所属集团</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">日期:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="PYEAR" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>年</label>
            </div>
          </td>
        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid"></td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="PMONTH" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>月</label>
            </div>
          </td>

        </tr>


        <tr class="row">
          <td align="center" valign="middle" class="grid">设计单位:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="DNAME" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>设计单位</label>
            </div>
          </td>

        </tr>

      </table>
      <table>
        <tr class="row">
          <td align="center" valign="middle" class="grid">位置:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="LOC" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>位置</label>
            </div>
          </td>
        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">厂址特征:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="FCHARACTER" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>厂址特征</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">省份:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="PROVINCE" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>省份</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">城市:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="CITY" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>城市</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">县区:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="COUNTRY" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>县区</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">安装容量:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="CAPACITY" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>安装容量</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">用地面积:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="AREA" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>用地面积</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">最高海拔:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="ALTITUDE_MAX" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>最高海拔</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">最低海拔:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="ALTITUDE_MIN" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>最低海拔</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">经纬度:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="LONGITUDE" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>经度</label>
            </div>
          </td>

        </tr>

        <tr class="row">
          <td align="center" valign="middle" class="grid"></td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="LONGITUDE_EORW" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>east or west</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid"></td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="LATITUDE" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>纬度</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid"></td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="LATITUDE_NORS" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>north or south</label>
            </div>
          </td>
        </tr>
      </table>
      <table>



        <tr class="row">
          <td align="center" valign="middle" class="grid">水平太阳总辐射（MJ）:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="LSRA_MJ" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>水平太阳总辐射（MJ）</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">水平太阳总辐射（KWH）:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="LSRA_KWH" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>水平太阳总辐射（KWH）</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">最佳辐射量倾角:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="BRA" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>最佳辐射量倾角</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">多年平均气温:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="YMAT" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>多年平均气温</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">多年极端最高气温:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="YHT" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>多年极端最高气温</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">多年极端最低气温:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="YLT" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>多年极端最低气温</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">最热月平均气温:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="HMMT" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>最热月平均气温</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">多年最大冻土深度:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="MDFS" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>多年最大冻土深度</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">多年平均风速:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="AWS" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>多年平均风速</label>
            </div>
          </td>
        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">多年极大风速:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="EWS" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>多年极大风速</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">多年平均雷暴日数:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="ATD" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>多年平均雷暴日数</label>
            </div>
          </td>

        </tr>
        <tr class="row">
          <td align="center" valign="middle" class="grid">污秽等级:</td>
          <td align="center" valign="middle" class="grid1">
            <div class="group">
              <input type="text" name="PC" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <label>污秽等级</label>
            </div>
          </td>

        </tr>
      </table>
    </div>
    <%--        <input class="inp" type="submit" value="提交"/>--%>
    <button class="custom-btn btn-9" type="submit" value="提交"> 添  加 </button>

  </form>
</div>
</body>
</html>
