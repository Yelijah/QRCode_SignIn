<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8"  %>
<html>
<head>
    <meta charset="utf-8" />
    <title>二维码签到系统-教师端</title>
    <script src="../../js/jquery-2.2.4.min.js"></script>
    <link rel="stylesheet" href="../../css/teacher_login.css"/>
    <script>
        $(document).ready(function() {

            $(".form").slideDown(500);

            $("#landing").addClass("border-btn");

            $("#registered").click(function() {
                $("#landing").removeClass("border-btn");
                $("#landing-content").hide(500);
                $(this).addClass("border-btn");
                $("#registered-content").show(500);

            });
            $("#landing").click(function() {
                $("#registered").removeClass("border-btn");
                $(this).addClass("border-btn");

                $("#landing-content").show(500);
                $("#registered-content").hide(500);
            })
        });
    </script>
</head>
<body>
    <div class="form">
        <div id="landing">登录</div>
        <div id="registered">注册</div>
        <div class="fix"></div>
        <div id="landing-content" >
            <div id="photo"><img src="../../images/photo.jpg" /></div>
            <form action="${pageContext.request.contextPath}/teacher/login/do" id="login_form" method="post">
                <div class="inp"><input type="text" placeholder="教师工号" name="id" /></div>
                <div class="inp"><input type="password" placeholder="密码" name="password" /></div>
            </form>
            <div class="login" onclick="document.getElementById('login_form').submit()">登录</div>
            <c:if test="${loginError!=null}">
                <div id="wrong">
                    该用户不存在或密码错误
                    ${sessionScope.remove("loginError")}
                </div>
            </c:if>
            <!--<div id="bottom"><span id="registeredtxt">立即注册</span><span id="forgotpassword">忘记密码</span></div>-->
        </div>
        <div id="registered-content">
            <form method="post" action="${pageContext.request.contextPath}/teacher/register" id="register_form">
                <div class="inp"><input type="text" name="name" placeholder="请输入教师姓名" /></div>
                <div class="inp"><input type="password" name="password" placeholder="请输入密码" /></div>
                <div class="inp"><input type="password" name="password2" placeholder="请再次输入密码" /></div>
                <div class="inp"><input type="text" name="id" placeholder="请输入教师工号" /></div>
            </form>
            <div class="login" onclick="document.getElementById('register_form').submit()">立即注册</div>
        </div>
    </div>
    <div id="title"><p>教师登录</p></div>
</body>
</html>
