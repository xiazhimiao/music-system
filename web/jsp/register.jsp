<%--
  Created by IntelliJ IDEA.
  User: xiazhimiao
  Date: 2024/6/30
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        html {
            height: 100%;
        }

        body {
            height: 100%;
        }

        .container {
            height: 100%;
            background-image: linear-gradient(to right, #fbc2eb, #a6c1ee);
        }

        .login-wrapper {
            background-color: #fff;
            width: 358px;
            height: 588px;
            border-radius: 15px;
            padding: 0 50px;
            position: relative;
            left: 25%;
            top: 35%;
            transform: translate(-50%, -50%);
        }

        .header {
            font-size: 38px;
            font-weight: bold;
            text-align: center;
            line-height: 200px;
        }

        .input-item {
            display: block;
            width: 100%;
            margin-bottom: 20px;
            border: 0;
            padding: 10px;
            border-bottom: 1px solid rgb(128, 125, 125);
            font-size: 15px;
            outline: none;
        }

        .input-item::placeholder {
            text-transform: uppercase;
        }

        .btn {
            text-align: center;
            padding: 10px;
            width: 100%;
            margin-top: 40px;
            background-image: linear-gradient(to right, #a6c1ee, #fbc2eb);
            color: #fff;
        }

        a {
            text-decoration-line: none;
            color: #abc1ee;
        }
    </style>


    <script>

        function btnAction() {

            console.log("222222222222222");


            var username = document.querySelector('input[name="username"]').value;
            var password = document.querySelector('input[name="password"]').value;
            // 创建XMLHttpRequest对象
            var xhr = new XMLHttpRequest();
            // 设置请求的类型及URL
            xhr.open('POST', '../RegisterServlet'); // '/register' 是后端接收数据的URL
            // 设置请求头，发送JSON格式数据
            xhr.setRequestHeader('Content-Type', 'application/json');
            // 定义请求完成的处理函数
            xhr.onload = function () {
                if (xhr.status >= 200 && xhr.status < 300) {
                    // 请求成功
                    var response = JSON.parse(xhr.responseText);
                    if (response.code === 1) {
                        console.log('注册成功');
                        console.log('注册成功0000000000000');
                        alert('注册成功');
                    } else {
                        console.error('注册失败:', response.msg);
                        alert('注册失败:', response.msg);
                    }
                } else {
                    // 请求失败
                    console.error('注册失败:', xhr.statusText);
                }
            };
            // 发送请求，将用户名和密码以JSON字符串形式发送
            xhr.send(JSON.stringify({username: username, password: password}));
        }

        function goToLogin() {
            window.location.href = "login.jsp";
        }
    </script>

</head>
<body>
<div class="container">
    <div class="login-wrapper">
        <div class="header">register</div>
        <div class="form-wrapper">

            <form id="registerForm" onsubmit="return false;">
                <label>
                    <input type="text" name="username" placeholder="username" class="input-item">
                </label>
                <label>
                    <input type="password" name="password" placeholder="password" class="input-item">
                </label>
                <div class="btn">
                    <input type="button" value="register" id="registerButton" onclick="btnAction()"></input>
                </div>
                <div class="btn">
                    <button onclick="goToLogin()">返回登录页面</button>
                </div>

            </form>


        </div>
    </div>



</div>
</body>
</html>
