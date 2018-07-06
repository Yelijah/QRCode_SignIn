<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title></title>
    <link rel="stylesheet" href="../../css/student_signIn.css"/>
</head>

<body>
<div id="sign"></div>
<div class="sign_bg">
    <div id="logo">
        <img src="../../images/suda.png" alt=""/>
    </div>
    <form>
    <c:if test="${currentLesson!=null}">
    <div class="lesson">当前课程:${currentLesson.name}(${currentLesson.teacherName})</div><br><br>
    </c:if>
    <%--学号：${student.id}<br><br>
    姓名：${student.name}<br><br>
    专业：${student.specialty}<br><br><br><br>--%>
    <%--课程：${currentLesson.name}(${currentLesson.teacherName})--%>
    <div class="number">
        <label>学号:</label>
        <input type="text" name="id" readonly value="${student.id}">
    </div>
    <div class="userName">
        <label>姓名:</label>
        <input type="text" name="name" readonly value="${student.name}">
    </div>
    <div class="specialty">
        <label>专业:</label>
        <input type="text" name="specialty" readonly value="${student.specialty}">
    </div>
    <%--<div class="btn">
        <a href="${pageContext.request.contextPath}/student/signIn?lessonId=${currentLesson.id}">
            <button class="signIn_btn" >签&nbsp;&nbsp;到</button>
        </a>
    </div>--%>
    <button class="signIn_btn">一&nbsp;键&nbsp;签&nbsp;到</button>

    </form>
</div>


</body>
</html>
