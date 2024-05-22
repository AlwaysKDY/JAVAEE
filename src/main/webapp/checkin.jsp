<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>景区入园核销</title>
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
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            font-size: 18px;
            text-align: center;
            width: 90%;
            max-width: 500px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            margin: 10px 0;
            width: 100%;
        }
        button:hover {
            background-color: #45a049;
        }
        p {
            font-size: 18px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>景区入园核销</h1>
    <p>此处放置景区入园核销的内容。</p>
    <button onclick="window.location.href='dashboard.jsp'">返回主页</button>
</div>
</body>
</html>
