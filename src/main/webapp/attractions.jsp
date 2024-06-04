<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>景点查看和预约</title>
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
            background-color: orange;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            font-size: 18px;
            text-align: center;
        }
        .attraction {
            display: inline-block;
            width: 30%;
            margin: 1%;
            padding: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
        .attraction select, .attraction button, .attraction input[type="date"] {
            width: 90%;
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
            font-size: 24px;
        }

    </style>
    <script>
        // Function to set the min and max date for the date input
        window.onload = function() {
            var today = new Date().toISOString().split('T')[0];
            var oneMonthLater = new Date();
            oneMonthLater.setMonth(oneMonthLater.getMonth() + 1);
            oneMonthLater = oneMonthLater.toISOString().split('T')[0];
            var dateInputs = document.querySelectorAll('input[type="date"]');
            dateInputs.forEach(function(input) {
                input.setAttribute('min', today);
                input.setAttribute('max', oneMonthLater);
            });
        };
    </script>
</head>
<body>
<div class="container">
    <h1>景点查看和预约</h1>
    <c:if test="${not empty message}">
        <div class="message ${message.startsWith('预约成功') ? 'success' : 'error'}">
                ${message}<br>
            <c:if test="${message.startsWith('预约成功')}">
                已同步为您预约当日景区大门门票。
            </c:if>
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
                    <option value="7:00-9:00">7:00-9:00</option>
                    <option value="9:00-11:00">9:00-11:00</option>
                    <option value="11:00-13:00">11:00-13:00</option>
                    <option value="13:00-15:00">13:00-15:00</option>
                    <option value="15:00-17:00">15:00-17:00</option>
                    <option value="17:00-19:00">17:00-19:00</option>
                    <option value="19:00-21:00">19:00-21:00</option>
                    <option value="21:00-23:00">21:00-23:00</option>
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
