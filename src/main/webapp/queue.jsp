<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>景区排队情况查询</title>
    <style>
        body {
            background-color: lightskyblue;
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
        canvas {
            width: 100% !important;
            max-width: 1000px;
            height: 400px !important;
            margin: 0 auto; /* Center the canvas */
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #f3e5f5; /* Light purple background for table */
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #e1bee7; /* Light purple background for table headers */
        }
        .table-container {
            max-height: 200px;
            overflow-y: auto;
        }
        p {
            text-align: center;
            font-size: 18px;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<div class="container">
    <h1>景区排队情况查询</h1>
    <canvas id="queueChart"></canvas>
    <div class="table-container">
        <table>
            <thead>
            <tr>
                <th>景点</th>
                <th>排队人数</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="queueStatus" items="${queueStatuses}">
                <tr>
                    <td>${attractionMap[queueStatus.attractionId]}</td>
                    <td>${queueStatus.queueLength}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <p>
        <a href="dashboard.jsp">返回主页</a>
    </p>
</div>
<script>
    // Prepare data for the chart
    const labels = [];
    const data = [];

    <c:forEach var="queueStatus" items="${queueStatuses}">
    labels.push("${attractionMap[queueStatus.attractionId]}");
    data.push(${queueStatus.queueLength});
    </c:forEach>

    const ctx = document.getElementById('queueChart').getContext('2d');
    const queueChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: '排队人数',
                data: data,
                borderColor: 'rgba(255, 165, 0, 1)', // Orange color
                backgroundColor: 'rgba(255, 165, 0, 0.2)', // Light orange background
                fill: true,
                tension: 0.1,
                pointHoverBackgroundColor: 'rgba(255, 69, 0, 1)', // Darker orange on hover
                pointHoverBorderColor: 'rgba(255, 69, 0, 1)' // Darker orange on hover
            }]
        },
        options: {
            responsive: true,
            scales: {
                x: {
                    title: {
                        display: true,
                        text: '景点'
                    }
                },
                y: {
                    title: {
                        display: true,
                        text: '排队人数'
                    },
                    beginAtZero: true
                }
            },
            plugins: {
                title: {
                    display: true,
                    text: '景区排队情况'
                },
                tooltip: {
                    enabled: true,
                    mode: 'index',
                    intersect: false
                }
            }
        }
    });
</script>
</body>
</html>
