<%--
  Created by IntelliJ IDEA.
  User: 22344
  Date: 2024/6/24
  Time: 18:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加歌曲信息</title>
    <style>
        .box{
            width: 600px;
            height: 700px;
            margin: 0 auto;
        }
        .row{
            margin-bottom: 30px;
        }
        .row label{
            font-size: 20px;
            font-weight: bold;
        }
        .row div{
            margin-bottom: 15px;
        }
        .row div:first-child{
            margin-top: 20px;
        }
        .row input{
            width: 600px;
            height: 45px;
            outline: none;
            border: none;
            border-bottom: 2px solid black;
            font-size: 18px;
        }
        .row input::placeholder{
            font-size: 16px;
        }
        button{
            width: 120px;
            height: 40px;
            border: none;
            border-radius: 7px;
            background-color: darkseagreen;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%--使用昨天学过的form表单--%>
<form action="../AddMusic" method="post">
    <div class="box">
        <%--每一个添加数据的控件input 需要有name属性值
        在后台servelt中获取数据需要使用name属性值获取数据
        --%>
        <div class="row">
            <h1>添加歌曲信息</h1>
        </div>
        <%--需要给每一个控件添加name属性值--%>
        <div class="row">
            <div><label>歌曲id</label></div>
            <input type="text" name="id" placeholder="请输入歌曲id">
        </div>
        <div class="row">
            <div><label>歌曲类型</label></div>
            <input type="number" name="type" placeholder="请输入歌曲类型">
        </div>
        <div class="row">
            <div><label>歌曲名称</label></div>
            <input type="text" name="music_name" placeholder="请输入歌曲名称">
        </div>
        <div class="row">
            <div><label>歌手</label></div>
            <input type="text" name="singer" placeholder="请输入歌手">
        </div>
        <div class="row">
            <%--需要搭配提交按钮 type=submit--%>
            <button type="submit">添加信息</button>
        </div>
    </div>
</form>
</body>
</html>
