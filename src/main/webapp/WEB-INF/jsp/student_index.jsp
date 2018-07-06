<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>二维码签到系统-学生端</title>
    <link rel="stylesheet" href="../../css/student_index.css">
</head>
<body>
<div id="header">
    <h1>二维码签到系统-学生端</h1>
    <p>欢迎您&nbsp;${student.name}</p>
</div>
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
</body>
</html>
