<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        body {
            background-color: pink;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: Arial, sans-serif;
        }
        .container {
            width: 90%;
            max-width: 800px;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
            color: white;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>欢迎，<%= ((com.example.model.User) request.getSession().getAttribute("user")).getUsername() %></h1>
    <button onclick="window.location.href='attractions'">景点查看和预约</button>
    <button onclick="window.location.href='checkin'">景区入园核销</button>
    <button onclick="window.location.href='queue'">景区排队情况查询</button>
    <button onclick="window.location.href='service'">餐饮医疗服务查询</button>
    <button onclick="window.location.href='webservice'">服务平台信息查询</button>
</div>
</body>
</html>
