<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: xiazhimiao
  Date: 2024/6/30
  Time: 19:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我的音乐</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }

        #music-wrapper {
            width: 80%;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            opacity: 0.5;  /* 添加这一行，设置透明度为 0.5，可根据需要调整数值 0 到 1 之间 */
        }

        h2 {
            margin-top: 0;
            color: #333;
            font-size: 24px;
        }

        ol {
            list-style-type: decimal;
            padding-left: 20px;
        }

        li {
            padding: 15px;
            border-bottom: 1px solid #e0e0e0;
            transition: background-color 0.3s ease;
        }

        li:hover {
            background-color: #f0f0f0;
        }

        .song-details {
            display: flex;
            align-items: center;
        }

        .controls {
            display: flex;
            gap: 15px;
        }

        .play-btn,
        .download-btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .play-btn:hover,
        .download-btn:hover {
            background-color: #0056b3;
        }

        #user-info {
            margin-top: 30px;
            padding: 20px;
            border: 1px solid #e0e0e0;
            background-color: #f8f9fa;
        }

        #user-info h3 {
            margin: 0;
            font-size: 20px;
        }

        #user-info p {
            margin: 10px 0;
            font-size: 16px;
        }
    </style>
</head>

<body>


<%

    Object obj = request.getAttribute("list");
    List<Map<String, String>> list = (List) obj;
%>


<div id="music-wrapper">
    <h2>我的音乐&nbsp;</h2>
    <h4>歌曲加载速度因网速而异，请耐心等待</h4>
    <ol>
            <%
            //加强for循环
            //遍历出来的数据对象类型  自定义的取值对象名称 :要遍历的数据对象名称(当前为list)
            for(Map<String, String> map:list){
        %>
        <li id="song1">
            <div class="song-details">
                <div>
                    <h3><%=map.get("music_name")%>  - <%=map.get("singer")%>
                    </h3>
                </div>
            </div>
            <div class="controls">

                <iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=110
                        src="https://music.163.com/outchain/player?type=<%=map.get("type")%>&id=<%=map.get("id")%>&auto=0&height=90"></iframe>
            </div>
        </li>

<%
    }
%>
</div>

</body>

</html>



