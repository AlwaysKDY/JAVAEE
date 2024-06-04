<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>登录</title>
    <style>
        body {
            background-color: lightskyblue;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: Arial, sans-serif;
        }
        form {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            font-size: 20px;
            width: 50%;
            min-width: 350px;
            max-width: 600px;
        }
        input[type="text"], input[type="password"], input[type="email"] {
            width: 100%;
            padding: 15px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 20px;
        }
        input[type="submit"] {
            width: 80%;
            background-color: #4CAF50;
            color: white;
            padding: 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 20px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        p {
            text-align: center;
            font-size: 18px;
        }
    </style>
</head>
<body>
<div>
    <h1 style="text-align:center;">登录</h1>
    <form action="user" method="post">
        <input type="hidden" name="action" value="login">
        用户名: <input type="text" name="username" required><br>
        密码: <input type="password" name="password" required><br>
        <input type="submit" value="登录">
    </form>
    <p>
        <a href="register.jsp">注册</a> |
        <a href="recover.jsp">找回密码</a> |
        <a href="profile.jsp">修改个人信息</a>
    </p>
    <% String errorMsg = (String) request.getAttribute("errorMsg"); %>
    <% if (errorMsg != null) { %>
    <p style="color:red;"><%= errorMsg %></p>
    <% } %>
    <% String message = (String) request.getAttribute("message"); %>
    <% if (message != null) { %>
    <p style="color:green;"><%= message %></p>
    <% } %>
</div>
</body>
</html>
