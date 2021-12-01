<%--
  Created by IntelliJ IDEA.
  User: Nastya
  Date: 01.12.2021
  Time: 13:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="points" class="model.PointsList" scope="session" />
<html>
<head>
    <meta charset="UTF-8">
    <title>Лабораторная 1</title>
    <link rel="stylesheet" href="css/style_table.css" type="text/css">
    <link rel="icon" href="img/icon.png">
</head>
<body>
    <div class="table_area">
        <div class="table_area_table">
            <table id="res_table">
                <thead>
                    <tr>
                        <th>x</th>
                        <th>y</th>
                        <th>R</th>
                        <th>Время отправки</th>
                        <th>Время работы</th>
                        <th>Попадание</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="point" items="${points.points}">
                        <tr>
                            <td>${point.XValue}</td>
                            <td>${point.YValue}</td>
                            <td>${point.RValue}</td>
                            <td>${point.currentTime}</td>
                            <td>${point.workingTime}</td>
                            <td>${point.isHit}</td>
                        </tr>
                    </c:forEach>
                </tbody>

            </table>
        </div>

    </div>
    <a href="controllerServlet">Назад</a>

</body>
</html>
