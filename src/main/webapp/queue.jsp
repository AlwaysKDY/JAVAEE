<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>景区排队情况查询</title>
    <style>
        body {
            background-color: pink;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: Arial, sans-serif;
            overflow-y: scroll;
        }
        .container {
            width: 90%;
            max-width: 1200px;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            font-size: 18px;
            text-align: center;
        }
        .queue-status {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 10px 0;
            padding: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            background-color: #f9f9f9;
        }
        .queue-status p {
            margin: 0;
        }
        p {
            text-align: center;
            font-size: 18px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>景区排队情况查询</h1>
    <div>
        <c:forEach var="queueStatus" items="${queueStatuses}">
            <div class="queue-status">
                <p>${attractionMap[queueStatus.attractionId]}</p>
                <p>排队人数: ${queueStatus.queueLength}</p>
            </div>
        </c:forEach>
    </div>
    <p>
        <a href="dashboard.jsp">返回主页</a>
    </p>
</div>
</body>
</html>
