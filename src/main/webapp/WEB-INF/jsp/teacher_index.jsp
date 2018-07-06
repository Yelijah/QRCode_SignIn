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
            border: 1px solid #3bafda;
            margin: 100px auto;
            text-align: center;
            border-collapse: collapse;
            font-size: 10%;
            width: 80%;
        }

        #table td {
            border: 1px solid #48cfad;
            padding: 4px 10px;
            text-align: center;
        }

        .th {
            border: 1px solid #48cfad;
            padding: 4px 10px;
            text-align: center;
            width: 14%;
        }
        #caption{
            font-size: 20px;
            color: #000;
            font-family: STKaiti,serif;
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
<!--nav end-->
<table id="table">
    <caption id="caption">我的课程</caption>
    <tr>
        <th colspan="2" rowspan="1" width="2%">时间</th>
        <th class="th">星期一</th>
        <th class="th">星期二</th>
        <th class="th">星期三</th>
        <th class="th">星期四</th>
        <th class="th">星期五</th>
        <th class="th">星期六</th>
        <th class="th">星期日</th>
    </tr>
    <%
        String[][] schedule = (String[][]) request.getAttribute("schedule");
        for (int i = 0; i < 11; i++) {
            out.print("<tr>");
            if (i == 0) {
                out.print("<td rowspan=\"4\" width=\"1%\">上午</td>");
            } else if (i == 4) {
                out.print("<td rowspan=\"4\" width=\"1%\">下午</td>");
            } else if (i == 8) {
                out.print("<td rowspan=\"4\" width=\"1%\">晚上</td>");
            }
            out.print("<td width=\"1%\">第" + (i + 1) + "节</td>");
            for (int j = 0; j < 7; j++) {
                if (schedule[i][j]==null){
                    continue;
                }
                if (schedule[i][j].equals("")) {
                    out.print("<td>" + schedule[i][j] + "</td>");
                }else {
                    int length=1;
                    for (int m=i+1;m<11 && schedule[m][j]==null;m++){
                        length++;
                    }
                    out.print("<td rowspan=\""+length+"\">" + schedule[i][j] + "</td>");
                }
            }
            out.print("</tr>");
        }
    %>
</table>
<script type="text/javascript" src="../../js/nav.js"></script>
</body>
</html>
