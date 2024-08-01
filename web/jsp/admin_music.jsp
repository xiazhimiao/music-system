<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 22344
  Date: 2024/6/21
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台歌曲管理</title>
    <style>
        #box {
            width: 70%;
            margin: 0 auto;
            height: 100%;
        }

        div {
            font-size: 18px;
        }

        .row {
            /*改变弹性盒子模式*/
            display: flex;
        }

        .col {
            text-align: center;
            /*让被改变弹性盒子模式的元素按照1：1:1排列*/
            flex: 1;
            /*内边距 距离上侧8px  左右0px*/
            padding: 20px 0;

            border-bottom: 1px solid black;
        }

        .title {
            color: black;
            font-weight: 600;
            border: 2px solid black;
            border-right: none;

        }

        .title:last-child {
            border-right: 2px solid black;
        }

        .value {
            border-bottom: 2px solid black;
        }

        .add {
            padding: 10px 30px;
            background-color: darkseagreen;
            border-radius: 8px;
            margin-bottom: 10px;
            text-decoration: none;
            color: snow;
            font-size: 18px;
        }

        .edit, .del {
            padding: 5px 10px;
            border-radius: 8px;
            text-decoration: none;
            color: white;
            font-size: 14px;
            font-weight: bold;
        }

        .edit {
            background-color: #c2c235;
        }

        .del {
            background-color: #e55050;
        }
    </style>
</head>
<body>
<%--JSP页面可以写Java代码也可以写HTML代码
在HTML页面的空白处 使用<%%> 在他内部可以写Java代码
--%>
<%


//    if (request.getSession().getAttribute("username") == null) {
//        response.sendRedirect("NoLogin.jsp");
//        return;
//    }


    //这里面可以写JAVA代码
    //1.接收由后台servlet传递过来的数据 request.setAttribute("list",list);
    //传递数据使用的request.setAttribute 接收数据使用 request.getAttribute("后台传递的key值")
    //通过后台传值设置的key，value键值对  前端取值通过key值获取value值 注意两面的key值必须相同
    Object obj = request.getAttribute("list");
    //2.需要将object 强转为 List<Map<String, String>>
    //成功接收由后台服务器从数据中查询出来的数据
    List<Map<String, String>> list = (List) obj;
%>

<p><a href="jsp/addMusic.jsp">添加数据</a></p>
<div id="box">
    <%--行--%>
    <div class="row">
        <%--列--%>
        <div class="col title">歌曲ID</div>
        <div class="col title">歌曲类型</div>
        <div class="col title">歌曲名称</div>
        <div class="col title">歌手</div>
        <div class="col title">操作</div>
    </div>
    <%--需要遍历list集合--%>
    <%
        //加强for循环
        //遍历出来的数据对象类型  自定义的取值对象名称 :要遍历的数据对象名称(当前为list)
        for (Map<String, String> map : list) {
    %>
    <%--因为HTML内部不能直接写Java Java代码内部不能直接写HTML
    所以我们将for循环切开 使用两部分存储 中间部分写HTML代码
    --%>
    <%--行--%>
    <div class="row">
        <%--
        <%=%>内部可以写JAVA变量
        对象名称map 可以通过key值获取对应的value
        由于数据是从数据库取出 所以key值默认为数据库的字段名称
        可以通过map.get(数据库字段名称) 来获取对应的数据值
        --%>
        <div class="col"><%=map.get("id")%>
        </div>
        <div class="col"><%=map.get("type")%>
        </div>
        <div class="col"><%=map.get("music_name")%>
        </div>
        <div class="col"><%=map.get("singer")%>
        </div>
        <div class="col">
            <%--修改
            update 表名 set 字段名 = 新字段值 where 条件
            页面上修改数据 条件一般都是使用唯一性标识 例如id
            怕一次性修改多条数据 效果:一次修改一条
            【逻辑】
            修改操作，一般都是修改哪条数据 先显示这个数据 == 数据回显
            需要知道之前的数据是什么 执行对照修改

            超链接可以传递数据(传递中文乱码)
             <a href="路径?key值=value值">修改</a>
            --%>
            <a href="QueryMusicById?id=<%=map.get("id")%>" class="edit">修改</a>
            <%--通过超链接传递一个唯一性标识数据 去Servlet执行SQL--%>
            <a href="DeleteMusicById?id=<%=map.get("id")%>" class="del">删除</a>
        </div>
    </div>
    <%
        }
    %>
    <%--    <p><a href="index.jsp">回到首页</a></p>--%>
</div>
</body>
</html>
