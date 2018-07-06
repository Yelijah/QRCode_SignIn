<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>二维码签到系统-教师端</title>
    <link rel="stylesheet" href="../../css/teacher_index.css"/>
    <script type="text/javascript" src="../../js/jquery1.42.min.js"></script>
    <script type="text/javascript" src="../../js/jquery.SuperSlide.2.1.1.js"></script>
    <!--[if lt IE 9]>
    <script src="../../js/html5.js"></script>
    <![endif]-->

    <style>
        #table {
            border: 0px;
            margin: 80px auto;
            text-align: center;
            border-collapse: collapse;
            font-size: 15px;
            width: 65%;
        }

        #table td {
            padding: 4px 10px;
            text-align: center;
        }

        #table th {
            padding: 4px 10px;
            text-align: center;
        }

        #qrcode{
            position: absolute;
            top: 45%;
            left: 42%;
        }
    </style>

</head>

<body>
<!--header start-->
<div id="header">
    <h1>二维码签到系统-教师端</h1>
    <p>欢迎您 ${teacher.name}</p>
</div>
<!--header end-->

<!--nav-->
<div id="nav">
    <ul>
        <li><a href="${pageContext.request.contextPath}/teacher/schedule">我的课程表</a></li>
        <li><a href="${pageContext.request.contextPath}/teacher/currentLesson">当前课程</a></li>
        <li><a href="${pageContext.request.contextPath}/teacher/signBook">签到簿</a></li>
        <%--<div class="clear"></div>--%>
    </ul>
</div>
<table id="table">
    <tr>
        <th>课程名称</th>
        <th>任课教师</th>
        <th>课程时间</th>
        <th>课程节次</th>
        <th>选课学生</th>
    </tr>
    <c:if test="${currentLesson!=null}">
        <tr>
            <td>${currentLesson.name}</td>
            <td>${currentLesson.teacherName}</td>
            <td>
                <c:choose>
                    <c:when test="${currentLesson.weekday==1}">周一</c:when>
                    <c:when test="${currentLesson.weekday==2}">周二</c:when>
                    <c:when test="${currentLesson.weekday==3}">周三</c:when>
                    <c:when test="${currentLesson.weekday==4}">周四</c:when>
                    <c:when test="${currentLesson.weekday==5}">周五</c:when>
                    <c:when test="${currentLesson.weekday==6}">周六</c:when>
                    <c:when test="${currentLesson.weekday==7}">周日</c:when>
                </c:choose>
            </td>
            <td>${currentLesson.beginTime}——${currentLesson.endTime}节</td>
            <td>${currentLesson.studentNumbers}人</td>
        </tr>

        <img src="${pageContext.request.contextPath}/teacher/currentLesson/getQrCode" alt="二维码" id="qrcode"/>
    </c:if>

</table>
<script type="text/javascript" src="../../js/nav.js"></script>
</body>
</html>