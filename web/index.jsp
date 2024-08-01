<%--
  Created by IntelliJ IDEA.
  User: xiazhimiao
  Date: 2024/6/30
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>网易云音乐</title>
    <link rel="stylesheet" href="css/Style0.css">

    <style>
        /* 设置页面内容的最小高度为100%视口高度 */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        .top-bar {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-top-left-radius: 10px; /* 添加圆角 */
            height: 50px; /* 修改高度为70px */
        }

        .logo {
            height: 100%; /* 设置logo高度为父元素高度 */
            position: relative; /* 设置相对定位 */
            left: 100%; /* 移动一个相当于自身宽度的距离 */
            transform: translateX(20%); /* 通过transform调整位置 */
        }

        .links ,.ziluyou{
            display: flex;
            gap: 80px;
            margin-left: auto; /* 居中显示 */
            margin-right: auto; /* 居中显示 */
        }




        .links a {
            color: white;
            text-decoration: none;
        }

        /* 设置低栏的样式 */
        .footer {
            background-color: #333; /* 深色背景 */
            color: white; /* 白色文字 */
            text-align: center; /* 文字居中 */
            padding: 10px 0; /* 内边距 */
            position: fixed; /* 固定位置 */
            bottom: 0; /* 放在页面底部 */
            width: 100%; /* 宽度为100% */
            box-sizing: border-box; /* 盒模型 */
        }

        /* 设置内容区域的样式，确保内容不被低栏遮挡 */
        .content {
            min-height: 100vh; /* 最小高度为视口高度 */
            padding-bottom: 50px; /* 底部内边距，与低栏高度相同 */
            box-sizing: border-box; /* 盒模型 */
        }
        div.content {
            background-image: url('images/xcm.jpg');
            background-repeat: no-repeat;
            background-size: cover;
        }




        .image-container {
            display: flex;
            align-items: center;
        }

        .arrow1,.arrow2 {
            margin: 0 10px;  /* 您可以根据需要调整边距 */
        }




    </style>
    <script>
        // 当文档加载完毕时执行
        document.addEventListener('DOMContentLoaded', function() {
            // 监听所有链接的点击事件
            document.querySelectorAll('.ziluyou a').forEach(function(link) {
                link.addEventListener('click', function(event) {
                    event.preventDefault(); // 阻止链接默认的跳转行为
                    var page = this.getAttribute('href'); // 获取链接的href属性
                    loadPage(page); // 调用函数加载页面
                });
            });
        });

        // 加载页面的函数
        function loadPage(page) {
            var xhr = new XMLHttpRequest(); // 创建一个新的HTTP请求
            xhr.open('GET', page, true); // 配置请求类型、URL和异步标志
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // 请求成功，响应已完全接收
                    var contentDiv = document.querySelector('.content'); // 使用querySelector来选择.content元素
                    if (contentDiv) {
                        contentDiv.innerHTML = xhr.responseText; // 更新页面内容
                    } else {
                        console.error('无法找到.content元素');
                    }
                }
            };
            xhr.send(); // 发送请求
        }
    </script>

</head>
<body>
<div class="top-bar">
    <a href="index.jsp"> <!-- 将 'index.html' 替换为主页面的实际 URL -->
        <img src="images/logo.png" alt="Logo" class="logo">
    </a>
    <div class="links">
        <div class="ziluyou">
            <a href="UserQueryMusic">发现音乐</a>
<%--            <a href="jsp/my_music.jsp">我的音乐</a>--%>
            <a href="QueryMyMusic">我的音乐</a>
            <a href="jsp/musicians.jsp">音乐人</a>
            <a href="jsp/xiugai.jsp">
                <%
                    String username = (String)session.getAttribute("username");
                    if(username == null) {
                        out.print("您还没有登录！");
                    } else {
                        out.print("个人信息：" + username);
                    }
                %>
            </a>
        </div>



        <a href="jsp/login.jsp">登录</a>
        <a href="jsp/register.jsp">注册</a>

    </div>


</div>
<div class="content" style="text-align: center">

    <div id="body" class="image-container">
        <span class="arrow1" onclick="prevImage()">←</span>

        <img id="image" src="picture/m1.jpg" alt="Image 1" >
        <span class="arrow2" onclick="nextImage()">→</span>
    </div>

    <script>
        let imageIndex = 0;
        let images = ["picture/m1.jpg", "picture/m2.jpg", "picture/m3.jpg","picture/m5.jpg"]
        function prevImage() {
            imageIndex--;
            if (imageIndex < 0) {
                imageIndex = images.length - 1;
            }
            document.getElementById("image").src = images[imageIndex];
        }
        function nextImage() {
            imageIndex++;
            if (imageIndex >= images.length) {
                imageIndex = 0;
            }
            document.getElementById("image").src = images[imageIndex];
        }
    </script>
    <div id="bottom1"></div>
    <div id="bottom2"  style="text-align: left;width: 50%">
        <p id="p1">热门推荐</p>
        <p id="p2">华语</p>
        <p id="p3">流行</p>
        <p id="p4">摇滚</p>
        <p id="p5">民谣</p>
        <p id="p6">电子</p>
        &nbsp;&nbsp;&nbsp;&nbsp; 更多
        <p id="p8">→</p>
        <hr id="h1">
        <div id="d1">
            <img id="im1" src="picture/w1.jpg" alt="">
            <p id="m1">粤语男声：我爱你依旧如初不曾改变</p>
        </div>
        <div id="d2">
            <img id="im2" src="picture/w2.jpg" alt="">
            <p id="m2">戳爷/黄老板/断眉/萌德/骚姆/比伯/烟卷</p>
        </div>
        <div id="d3">
            <img id="im3" src="picture/w3.jpg" alt="">
            <p id="m3">初识不知曲中意，再听已是曲中人</p>
        </div>
        <div id="d4">
            <img id="im4" src="picture/w4.jpg" alt="">
            <p id="m4">告五人 能成为五月天的接班人吗？｜金曲台湾季</p>
        </div>
        <div id="d5">
            <img id="im5" src="picture/w5.jpg" alt="">
            <p id="m5">『华语』百首精选，听歌如见你</p>
        </div>
        <div id="d6">
            <img id="im6" src="picture/w6.jpg" alt="">
            <p id="m6"> Ep006. “养小鬼的投资人”“诡梦后，我不敢看任何人的...</p>
        </div>
        <div id="d7">
            <img id="im7" src="picture/w7.jpg" alt="">
            <p id="m7">一个双子座的听歌列表</p>
        </div>
        <div id="d8">
            <img id="im8" src="picture/w8.jpg" alt="">
            <p id="m8">薄荷水</p>
        </div>
        <p id="p9">新碟上架</p>
更多 &nbsp;
        <p id="p11">→</p>
        <hr id="h2">
        <div id="k1">
            <img id="g1" src="picture/x1.jpg" alt="">
            <p id="c1">FLOWER GARDEN
                金在中</p>
        </div>
        <div id="k2">
            <img id="g2" src="picture/x2.jpg" alt="">
            <p id="c2">华晨宇日出演唱会特辑
                华晨宇</p>
        </div>
        <div id="k3">
            <img id="g3" src="picture/x3.jpg" alt="">
            <p id="c3">旧城天使
                愚月FoolMoon</p>
        </div>
        <div id="k4">
            <img id="g4" src="picture/x4.jpg" alt="">
            <p id="c4">PUMP
                Epik High</p>
        </div>
        <div id="k5">
            <img id="g5" src="picture/x5.jpg" alt="">
            <p id="c5">Life After Small Town
                艾志恒Asen</p>
        </div>
        <p id="p12">榜单</p>  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
       更多
        <p id="p14">→</p>
        <hr id="h3">
        <table border="1">
            <tr>
                <th><img id="b1" src="picture/b1.jpg" alt="">飙升榜</th>
                <th><img id="b2" src="picture/b2.jpg" alt="">新歌榜</th>
                <th><img id="b3" src="picture/b3.jpg" alt="">原创榜</th>
            </tr>
            <tr id="t1">
                <td>1 GoneBad(PHONK)</td>
                <td>1 暮色回响 (Live版)</td>
                <td>1 罪（feat.旺仔小乔）</td>
            </tr>
            <tr>
                <td>2 暮色回响 (Live版)</td>
                <td>2 GoneBad(PHONK)</td>
                <td>2 遗忘周</td>
            </tr>
            <tr id="t2">
                <td>3 九张机</td>
                <td>3 是想你的声音啊2024</td>
                <td>3 Rebirth from the fire</td>
            </tr>
            <tr>
                <td>4 春梦</td>
                <td>4 泪桥</td>
                <td>4 单程车</td>
            </tr>
            <tr id="t3">
                <td>5 浆果</td>
                <td>5 异客 (Live版)</td>
                <td>5 云边的风筝</td>
            </tr>
            <tr>
                <td>6 我怕时间太快 不够将你看仔细</td>
                <td>6 网恋</td>
                <td>6 好了妈妈</td>
            </tr>
            <tr id="t4">
                <td>7 寂寞烟火</td>
                <td>7 耙耙爱情故事2024</td>
                <td>7 青鸟</td>
            </tr>
            <tr>
                <td>8 Coco Elva Tia</td>
                <td>8 妥协 (Live版)</td>
                <td>8 夏日离别练习</td>
            </tr>
            <tr id="t5">
                <td>9 耙耙爱情故事2024 (Live)</td>
                <td>9 你在，不在 (live │ 典藏)</td>
                <td>9 克莱尔</td>
            </tr>
            <tr>
                <td>10 列车开往春天 (每个梦都会实现)</td>
                <td>10 回忆总是慢动作</td>
                <td>10 谎言</td>
            </tr>
        </table>
    </div>
    <div id="bottom3"></div>
    <div id="bottom4"></div>


</div>

<!-- 低栏 -->
<div class="footer">
    <p>版权所有 © 2023</p>
</div>
</body>
</html>
