<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: 22344
  Date: 2024/6/24
  Time: 18:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改动物信息</title>
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
<%
    //后台服务器传递数据 == 接值
    //request.setAttribute("map",map); 传的
    Object obj = request.getAttribute("map");
    //数据强转
    Map<String,String> map = (Map)obj;
    //因为后台查询数据 id值是惟一的 所有数据就一条 不需要遍历
%>
<form action="UpdateMusicById" method="post">
    <div class="box">
        <div class="row">
            <h1>修改歌曲信息</h1>
        </div>
        <div class="row">
            <div><label>歌曲ID:<%=map.get("id")%></label></div>
            <%--执行数据回显操作  input输入框有value属性
            可以将value属性的值 直接显示在页面的输入框中
            <%=%> 可以直接显示变量名称
            map.get("数据库的表字段名称")

            ------------------------------------------
            修改操作  update 表名 set 字段名称 = 新值 where 条件
            我们当前只修改一条数据 所以条件必须是唯一性标识
            当前数据库的唯一性标识只有id
            所以我们需要回显id值 并设置name属性值 传递到后台服务器
            <input type="text" name="id" value="<%=map.get("id")%>">
            为了执行修改操作的SQL语句条件
            当前 id回显破坏了页面的显示结构 所以在input输入框后面添加hidden 隐藏当前控件
            隐藏的控件 不影响传递数据
           <input type="text" name="id" value="<%=map.get("id")%>" hidden>
            --%>
            <input type="text" name="id" value="<%=map.get("id")%>" hidden>
<%--            <input type="text" name="id" value="<%=map.get("id")%>">--%>
        </div>
        <div class="row">
            <div><label>歌曲类型</label></div>
            <input type="number" name="type" value="<%=map.get("type")%>">
        </div>

        <div class="row">
            <div><label>歌曲名称</label></div>
            <input type="text" name="music_name" value="<%=map.get("music_name")%>">
        </div>

        <div class="row">
            <div><label>歌手</label></div>
            <input type="text" name="singer" value="<%=map.get("singer")%>">
        </div>

        <div class="row">
            <button type="submit">修改信息</button>
        </div>
    </div>
</form>
</body>
</html>
