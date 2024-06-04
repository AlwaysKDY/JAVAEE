<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>景区服务站查询</title>
    <style>
        body {
            background-color: lightskyblue;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            height: 100vh;
            font-family: Arial, sans-serif;
            overflow-y: scroll;
            margin: 0;
            padding: 20px;
        }
        .container {
            width: 90%;
            max-width: 1200px;
            background-color: lightseagreen;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            font-size: 18px;
            text-align: center;
        }
        .service-column {
            width: 45%;
            margin: 10px;
            padding: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .medical-column {
            background-color: #e0f7fa;
        }
        .dining-column {
            background-color: #ffe0b2;
        }
        .service-column h2 {
            text-align: center;
        }
        .service-item {
            margin: 10px 0;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
        }
        .service-item p {
            margin: 5px 0;
        }
        .columns {
            display: flex;
            justify-content: space-between;
        }
        p {
            text-align: center;
            font-size: 18px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>景区服务站查询</h1>
    <div class="columns">
        <div class="service-column medical-column">
            <h2>医疗服务站</h2>
            <c:forEach var="station" items="${medicalStations}">
                <div class="service-item">
                    <p>名称: ${station.name}</p>
                    <p>位置: ${station.location}</p>
                    <p>联系方式: ${station.contact}</p>
                    <p>营业时间: ${station.hours}</p>
                </div>
            </c:forEach>
        </div>
        <div class="service-column dining-column">
            <h2>餐饮服务站</h2>
            <c:forEach var="station" items="${diningStations}">
                <div class="service-item">
                    <p>名称: ${station.name}</p>
                    <p>位置: ${station.location}</p>
                    <p>联系方式: ${station.contact}</p>
                    <p>营业时间: ${station.hours}</p>
                </div>
            </c:forEach>
        </div>
    </div>
    <p>
        <a href="dashboard.jsp">返回主页</a>
    </p>
</div>
</body>
</html>
