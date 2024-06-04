<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>核销信息</title>
    <style>
        body {
            background-color: lightskyblue;
            font-size: 18px;
        }
        .container {
            display: flex;
            justify-content: space-around;
            padding: 20px;
        }
        .table-container {
            width: 45%;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 10px 0;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
<div class="container">
    <div class="table-container">
        <h2>核销成功</h2>
        <table>
            <tr>
                <th>用户ID</th>
                <th>景点ID</th>
                <th>核销时间</th>
                <th>状态</th>
            </tr>
            <c:forEach var="record" items="${checkinRecords}">
                <c:if test="${record.status == 'checked in'}">
                    <tr>
                        <td>${record.user.userId}</td>
                        <td>
                            <c:choose>
                                <c:when test="${record.attraction.attractionId == null}">
                                    0
                                </c:when>
                                <c:otherwise>
                                    ${record.attraction.attractionId}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${record.checkinTime}</td>
                        <td>${record.status}</td>
                    </tr>
                </c:if>
            </c:forEach>
        </table>
    </div>
    <div class="table-container">
        <h2>核销失败</h2>
        <table>
            <tr>
                <th>用户ID</th>
                <th>景点ID</th>
                <th>核销时间</th>
                <th>状态</th>
            </tr>
            <c:forEach var="record" items="${checkinRecords}">
                <c:if test="${record.status != 'checked in'}">
                    <tr>
                        <td>${record.user.userId}</td>
                        <td>
                            <c:choose>
                                <c:when test="${record.attraction.attractionId == null}">
                                    0
                                </c:when>
                                <c:otherwise>
                                    ${record.attraction.attractionId}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${record.checkinTime}</td>
                        <td>${record.status}</td>
                    </tr>
                </c:if>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
