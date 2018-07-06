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
            width: 50%;
        }

        #table td {
            padding: 4px 10px;
            text-align: center;
        }

        #table th {
            padding: 4px 10px;
            text-align: center;
        }
        .attented{
            padding: 4px 10px;
            text-align: center;
            color: #DB5E5E;
            font-size: 20px;
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
        <div class="clear"></div>
    </ul>
</div>
<table id="table">
    <tr>
        <th>学号</th>
        <th>姓名</th>
        <th>专业</th>
        <th>签到时间</th>
    </tr>
    <c:if test="${attendanceSheet!=null}">
        <c:forEach items="${attendanceSheet}" var="attendance">
           <c:choose>
               <c:when test="${attendance.value==''}">
                   <tr>
                       <td>${attendance.key.id}</td>
                       <td>${attendance.key.name}</td>
                       <td>${attendance.key.specialty}</td>
                   </tr>
               </c:when>
               <c:otherwise>
                   <tr class="attented">
                       <td>${attendance.key.id}</td>
                       <td>${attendance.key.name}</td>
                       <td>${attendance.key.specialty}</td>
                       <td>${attendance.value}</td>
                   </tr>
               </c:otherwise>
           </c:choose>
        </c:forEach>
    </c:if>
    <%--<c:if test="${students!=null}">
        <c:forEach items="${students}" var="student">
            <tr>
                <td>${student.id}</td>
                <td>${student.name}</td>
                <td>${student.specialty}</td>
            </tr>
        </c:forEach>
    </c:if>--%>
</table>
<script type="text/javascript" src="../../js/nav.js"></script>
</body>
</html>