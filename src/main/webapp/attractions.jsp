<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>景点查看和预约</title>
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
        .attraction {
            display: inline-block;
            width: 30%;
            margin: 1%;
            padding: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            background-color: #f9f9f9;
        }
        .attraction img {
            width: 100%;
            border-radius: 10px;
        }
        .attraction p {
            margin: 10px 0;
        }
        .attraction select, .attraction button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 18px;
        }
        .attraction button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        .attraction button:hover {
            background-color: #45a049;
        }
        p {
            text-align: center;
            font-size: 18px;
        }
        .message {
            margin: 10px;
            padding: 10px;
            border-radius: 5px;
            font-size: 16px;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>景点查看和预约</h1>
    <c:if test="${not empty message}">
        <div class="message ${message.startsWith('预约成功') ? 'success' : 'error'}">
                ${message}
        </div>
    </c:if>
    <div>
        <c:forEach var="attraction" items="${attractions}">
            <div class="attraction">
                <img src="images/${attraction.imageUrl}" alt="${attraction.name}">
                <h3>${attraction.name}</h3>
                <p>${attraction.description}</p>
                <form action="reservation" method="post">
                    <input type="hidden" name="attractionId" value="${attraction.attractionId}">
                    预约日期: <input type="date" name="date" required><br>
                    预约时间: <select name="timeSlot">
                    <option value="9:00-11:00">9:00-11:00</option>
                    <option value="11:00-13:00">11:00-13:00</option>
                    <option value="13:00-15:00">13:00-15:00</option>
                    <option value="15:00-17:00">15:00-17:00</option>
                </select>
                    <button type="submit">预约</button>
                </form>
            </div>
        </c:forEach>
    </div>
    <p>
        <a href="dashboard.jsp">返回主页</a>
    </p>
</div>
</body>
</html>
