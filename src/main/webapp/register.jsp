<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>用户注册</title>
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
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            font-size: 18px;
        }
        input[type="text"], input[type="password"], input[type="email"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 18px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
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
    <h1 style="text-align:center;">用户注册</h1>
    <form action="user" method="post">
        <input type="hidden" name="action" value="register">
        用户名: <input type="text" name="username" required><br>
        密码: <input type="password" name="password" required><br>
        邮箱: <input type="email" name="email" required><br>
        电话: <input type="text" name="phoneNumber" required><br>
        <input type="submit" value="注册">
    </form>
    <p>
        <a href="login.jsp">登录</a> |
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
