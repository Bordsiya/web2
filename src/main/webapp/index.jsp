<%@ page import="model.PointsList" %>
<%@ page import="model.Point" %><%--
  Created by IntelliJ IDEA.
  User: Nastya
  Date: 25.10.2021
  Time: 1:17
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="points" class="model.PointsList" scope="session" />
<html>
<head>
    <meta charset="UTF-8">
    <title>Лабораторная 1</title>
    <link rel="stylesheet" href="css/style_index.css" type="text/css">
    <link rel="icon" href="img/icon.png">
    <script src="js/validator.js"></script>
    <script src="js/graph.js"></script>
    <script src="js/scripts.js"></script>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="student_info">
                <span>Студент: </span>Бордун Анастасия Владимировна <br>
                <span>Группа: </span>P3211 <br>
                <span>Вариант: </span>12005
            </div>
        </div>

        <div class="content">
            <div class="input_content">
                <form action="controllerServlet" method="get" id="coordinateForm">
                    <div class="input_content_select">
                        <span>Выберите координату X</span> <br>
                        <select id="input_x" name="xVal">
                            <option value="-5">-5</option>
                            <option value="-4">-4</option>
                            <option value="-3">-3</option>
                            <option value="-2">-2</option>
                            <option value="-1">-1</option>
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select> <br>
                        <span class="error_msg" id="error_x"></span>
                    </div>

                    <div class="input_content_input">
                        <span>Введите координату Y (-5 < x < 3)</span> <br>
                        <input type="text" id="input_y" name="yVal"> <br>
                        <span class="error_msg" id="error_y"></span>
                    </div>

                    <div class="input_content_buttons">
                        <span>Выберите константу R</span> <br>
                        <input type="hidden" name="rVal">
                        <div class="input_content_buttons_columns">
                            <div class="input_content_buttons_1column">
                                <button type="button" id="btn1" class="btn_structure choose_btn" value="1">1</button> <br>
                                <button type="button" id="btn2" class="btn_structure choose_btn" value="2">2</button> <br>
                                <button type="button" id="btn3" class="btn_structure choose_btn" value="3">3</button> <br>
                            </div>

                            <div class="input_content_buttons_2column">
                                <button type="button" id="btn4" class="btn_structure choose_btn" value="4">4</button> <br>
                                <button type="button" id="btn5" class="btn_structure choose_btn" value="5">5</button> <br>
                            </div>
                        </div> <br>
                        <span class="error_msg" id="error_r"></span>
                    </div>
                    <input type="hidden" id="hidden_async" value="false" name="async">

                    <div class="send_btn_area">
                        <button type="submit" class="btn_structure send_btn" id="send_button">Отправить</button>

                    </div>
                </form>
                <div class="clear_btn_area">
                    <button type=button class="btn_structure clear_btn" id="clear_table">Очистить таблицу</button>
                </div>

            </div>

            <div class="picture_content">
                <svg id="graph" width="500px" height="500px">
                    <!--Draw Rectangle-->
                    <polygon points="250,250 250,90 410,90 410,250" style="fill:dodgerblue;stroke:black;stroke-width:2"></polygon>

                    <!--Draw Triangle-->
                    <polygon points="250,250 410,250 250,410" style="fill:dodgerblue;stroke:black;stroke-width:2"></polygon>

                    <!--Draw QuoterCircle-->
                    <path d="M 90 250
                             A 160 160
                             0 0 0
                             250 410
                             L 250 250" style="fill:dodgerblue;stroke:black;stroke-width:2"></path>

                    <!-- Draw XAces -->
                    <line x1="0" y1="250" x2="500" y2="250" style="stroke:black;stroke-width:2"></line>
                    <line x1="500" y1="250" x2="491" y2="247" style="stroke:black;stroke-width:2"></line>
                    <line x1="500" y1="250" x2="491" y2="253" style="stroke:black;stroke-width:2"></line>

                    <text x="491" y="244" fill="black">x</text>

                    <line x1="410" y1="253" x2="410" y2="247" style="stroke:black;stroke-width:2"></line>
                    <text x="410" y="244" fill="black">R</text>

                    <line x1="320" y1="253" x2="320" y2="247" style="stroke:black;stroke-width:2"></line>
                    <text x="320" y="244" fill="black">R/2</text>

                    <line x1="180" y1="253" x2="180" y2="247" style="stroke:black;stroke-width:2"></line>
                    <text x="180" y="244" fill="black">-R/2</text>

                    <line x1="90" y1="253" x2="90" y2="247" style="stroke:black;stroke-width:2"></line>
                    <text x="90" y="244" fill="black">-R</text>

                    <!--Draw YAxes -->
                    <line x1="250" y1="500" x2="250" y2="0" style="stroke:black;stroke-width:2"></line>
                    <line x1="250" y1="0" x2="247" y2="9" style="stroke:black;stroke-width:2"></line>
                    <line x1="250" y1="0" x2="253" y2="9" style="stroke:black;stroke-width:2"></line>

                    <text x="256" y="9" fill="black">y</text>

                    <line x1="247" y1="90" x2="253" y2="90" style="stroke:black;stroke-width:2"></line>
                    <text x="256" y="90" fill="black">R</text>

                    <line x1="247" y1="180" x2="253" y2="180" style="stroke:black;stroke-width:2"></line>
                    <text x="256" y="180" fill="black">R/2</text>

                    <line x1="247" y1="320" x2="253" y2="320" style="stroke:black;stroke-width:2"></line>
                    <text x="256" y="320" fill="black">-R/2</text>

                    <line x1="247" y1="410" x2="253" y2="410" style="stroke:black;stroke-width:2"></line>
                    <text x="256" y="410" fill="black">-R</text>
                    <%
                        PointsList pointsList = (PointsList) request.getSession().getAttribute("points");
                        if (pointsList != null) {
                            for (Point point: pointsList.getPoints()){
                                double x = point.getXValue();
                                double y = point.getYValue();
                                double r = point.getRValue();
                                String color = point.getIsHit() ? "green" : "red";
                                double m = r/160;
                                double cx = 250 + x / m;
                                double cy = 250 - y / m;
                                if (cx > 500) cx = 500;
                                else if (cx < 0) cx = 0;
                                if (cy > 500) cy = 500;
                                else if (cy < 0) cy = 0;
                    %>
                    <circle style="fill:<%= color %>;
                            stroke:<%= color %>;
                            fill-opacity: 0.5;"
                            class="point"
                            r="3"
                            cx="<%= cx %>"
                            cy="<%= cy %>"></circle>"
                    <%
                            }
                        }
                    %>
                </svg>
            </div>
        </div>

    </div>
</body>
</html>
