<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title></title>
    <link rel="stylesheet" href="../../css/student_login.css"/>
</head>
<body>
<div id="login"></div>
<div class="login_bg">
    <div id="logo">
        <img src="../../images/suda.png" alt=""/>
    </div>
    <c:if test="${student==null}">
    <form id="login_form" method="post" action="${pageContext.request.contextPath}/student/login/do">
        <div class="userName">
            <label>用户名：</label>
            <input type="text" name="id" placeholder="请输入学号" pattern="[0-9]{1,10}" required/>
        </div>
        <div class="passWord">
            <label>密&nbsp;&nbsp;&nbsp;码：</label>
            <input type="password" name="password" placeholder="请输入密码" pattern="[0-9A-Za-z]{1,25}" required/>
        </div>
        <div class="choose_box">
            <%--<div>
                <input type="checkbox" checked="checked" name="checkbox"/>
                &lt;!&ndash;<label>记住密码</label>&ndash;&gt;
            </div>--%>
            <a href="">&nbsp;&nbsp;</a>
        </div>
        <button class="login_btn" type="submit">登&nbsp;&nbsp;录</button>
        <c:if test="${loginError!=null}">
            <div id="wrong">
                该用户不存在或密码错误
                ${sessionScope.remove("loginError")}
            </div>
        </c:if>
        <%--<a class="login_btn" href="">注&nbsp;&nbsp;册</a>--%>
    </form>
    </c:if>
    <c:if test="${student!=null}">
        <form id="logout_form" method="post" action="${pageContext.request.contextPath}/student/logout">
            <div class="userName">
                <label>学号:</label>
                <input type="text" value="${student.id}" disabled>
            </div>
            <div class="userName">
                <label>姓名</label>
                <input type="text" value="${student.name}" disabled>
            </div>
            <div class="userName">
                <label>专业</label>
                <input type="text" value="${student.specialty}" disabled>
            </div>
            <div class="userName">
                <label>当前课程</label>
                <input type="text" value="${currentLesson.name}" disabled>
            </div>
            <div class="choose_box">
                    <%--<div>
                        <input type="checkbox" checked="checked" name="checkbox"/>
                        &lt;!&ndash;<label>记住密码</label>&ndash;&gt;
                    </div>--%>
                <a href="">&nbsp;&nbsp;</a>
            </div>
            <button class="login_btn" type="submit">退&nbsp;&nbsp;出&nbsp;&nbsp;登&nbsp;&nbsp;录</button>
        </form>
    </c:if>
</div>
</body>
</html>