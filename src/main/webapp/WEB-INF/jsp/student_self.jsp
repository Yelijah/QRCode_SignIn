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
    <form id="login_form" method="post" action="${pageContext.request.contextPath}/student/index">
        <div class="userName">
            <label>学生姓名：</label>
            <input type="text" readonly class="userName" value=""/>
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
</div>
</body>
</html>