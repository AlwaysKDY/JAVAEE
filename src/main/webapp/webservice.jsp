<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>服务平台信息查询</title>
    <style>
        body {
            background-color: pink;
            font-size: 18px;
        }
        .container {
            display: flex;
            justify-content: space-between;
            padding: 20px;
        }
        .section {
            width: 45%;
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<h1>服务平台信息查询</h1>
<div class="container">
    <div class="section">
        <h2>景区天气信息</h2>
        <c:forEach var="weather" items="${weatherInfoList}">
            <p>${weather.weather_date}: ${weather.temperature} - ${weather.description}</p>
        </c:forEach>
    </div>
    <div class="section">
        <h2>公交信息</h2>
        <c:forEach var="traffic" items="${trafficInfoList}">
            <p>${traffic.route}</p>
        </c:forEach>
    </div>
</div>
</body>
</html>
