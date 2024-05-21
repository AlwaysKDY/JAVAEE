<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>注册成功</title>
    <style>
        body {
            background-color: pink;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: Arial, sans-serif;
        }
        div {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            font-size: 18px;
            text-align: center;
        }
        p {
            margin: 15px 0;
        }
        a {
            text-decoration: none;
            color: #4CAF50;
        }
    </style>
</head>
<body>
<div>
    <h1>注册成功</h1>
    <p>您的账户已经成功注册。请务必牢记以下密钥：</p>
    <p><strong>密钥: <%= request.getAttribute("recoveryKey") %></strong></p>
    <p>此密钥用于找回密码时的验证，请妥善保管，切勿遗失。</p>
    <p>
        <a href="login.jsp">登录</a> |
        <a href="recover.jsp">找回密码</a> |
        <a href="profile.jsp">修改个人信息</a>
    </p>
</div>
</body>
</html>
