<%--
  Created by IntelliJ IDEA.
  User: xiazhimiao
  Date: 2024/7/3
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>修改密码</title>
  <style>
    body {
      font-family: Arial, sans-serif;
    }

    .container {
      width: 300px;
      margin: 0 auto;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    label {
      display: block;
      margin-bottom: 10px;
    }

    input[type="password"] {
      width: 100%;
      padding: 5px;
      margin-bottom: 15px;
    }

    button {
      padding: 10px 20px;
      background-color: #4CAF50;
      color: white;
      border: none;
      cursor: pointer;
    }

    button:hover {
      background-color: #45a049;
    }
  </style>
</head>

<body>


<%
  if(request.getSession().getAttribute("username")==null){
    response.sendRedirect("NoLogin.jsp");
  }
%>






<div class="container">
  <h2>修改密码/黑客充值</h2>

  <form action="xiugai" method="post">

    <div><label>密码修改</label></div>
    <input type="text" name="password" value="">请输入新的密码


      <div class="row">
        <div><label>账户余额</label></div>
        <input type="number" name="money" value="">请输入余额
      </div>
      <div class="row">
        <button type="submit">修改信息</button>
        <p>
          不修改请置空！
        </p>
      </div>

  </form>

</div>

</body>

</html>