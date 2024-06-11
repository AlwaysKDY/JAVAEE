<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %><!-- 引入fmt库 -->
<!DOCTYPE html>
<html>
<head>
    <title>服务平台信息查询</title>
    <style>
        body {
            background-color: lightskyblue;
            justify-content: center;
            font-size: 18px;
            padding: 20px;
            font-family: Arial, sans-serif;
        }
        .container {
            display: flex;
            justify-content: space-between;
            padding: 20px;
        }
        .section {
            width: 45%;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .weather-section {
            background-color: lightyellow;
        }
        .traffic-section {
            background-color: #ffe0e0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<h1>服务平台信息查询</h1>
<div class="container">
    <div class="section weather-section">
        <h2>景区天气信息</h2>
        <c:forEach var="entry" items="${weatherInfoMap}">
            <h3>景点: ${entry.key}</h3>
            <table>
                <thead>
                <tr>
                    <th>日期</th>
                    <th>温度</th>
                    <th>天气</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="weather" items="${entry.value}">
                    <tr>
                        <td><fmt:formatDate value="${weather.weatherDate}" pattern="yyyy-MM-dd" /></td>
                        <td>${weather.temperature}°C</td>
                        <td>${weather.description}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:forEach>
    </div>
    <div class="section traffic-section">
        <h2>公交信息</h2>
        <table>
            <thead>
            <tr>
                <th>路线</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="traffic" items="${trafficInfoList}">
                <tr>
                    <td>${traffic.route}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
