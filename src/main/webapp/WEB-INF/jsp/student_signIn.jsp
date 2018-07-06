<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head lang="en">
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
    <div class="lesson">
        当前课程:
        <c:choose>
            <c:when test="${wrong==null}">
                ${currentLesson.name}(${currentLesson.teacherName})
            </c:when>
            <c:otherwise>
                当前无此课程
            </c:otherwise>
        </c:choose>
    </div><br><br>
    <form id="signIn_form" method="get" action="${pageContext.request.contextPath}/student/signIn?lessonId=${currentLesson.id}">
       <%-- <div class="number">
            <label>学&nbsp;&nbsp;号：</label>
            <input type="text" name="id" value="${student.id}" readonly/>
        </div>
        <div class="name">
            <label>姓&nbsp;&nbsp;名：</label>
            <input type="text" name="name" value="${student.name}" readonly/>
        </div>--%>
        <%--<div class="specialty">
            <label>专&nbsp;&nbsp;业</label>
            <input type="text" name="specialty" value="${student.specialty}" readonly/>
        </div>--%>
        <%--<div class="choose_box">--%>
            <%--<a href="">&nbsp;&nbsp;</a>--%>
        <%--</div>--%>
        <%--<button class="signIn_btn" type="submit">签&nbsp;&nbsp;到</button>--%>
       <%--<c:if test="${currentLesson!=null}">
           <a href="${pageContext.request.contextPath}/student/signIn?lessonId=${currentLesson.id}">
               <c:choose>
                   <c:when test="${student.signed!=true}">
                       <button class="signIn_btn" >一&nbsp;&nbsp;键&nbsp;&nbsp;签&nbsp;&nbsp;到</button>
                   </c:when>
                   <c:otherwise>
                       <button disabled class="signIn_btn">已&nbsp;&nbsp;签&nbsp;&nbsp;到</button>
                   </c:otherwise>
               </c:choose>
           </a>
       </c:if>--%>
    </form>
    <c:if test="${currentLesson!=null}">
        <a href="${pageContext.request.contextPath}/student/signIn?lessonId=${currentLesson.id}">
            <c:choose>
                <c:when test="${student.signed!=true}">
                    <button class="signIn_btn" >一&nbsp;&nbsp;键&nbsp;&nbsp;签&nbsp;&nbsp;到</button>
                </c:when>
                <c:otherwise>
                    <button disabled class="signIn_btn">已&nbsp;&nbsp;签&nbsp;&nbsp;到</button>
                </c:otherwise>
            </c:choose>
        </a>
    </c:if>

</div>
</body>
</html>