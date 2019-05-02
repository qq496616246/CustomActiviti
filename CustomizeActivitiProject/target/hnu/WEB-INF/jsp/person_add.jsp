<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎您的到来</title>
</head>
<body>
<h1>随便填一填呗</h1>
<form action="${pageContext.request.contextPath}/addperson" method="post">
    <table>
        <tr>
            <td>大声说出你的名字</td>
            <td>
                <input type="text" name="name" id="personname">
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="submit" id="submitform" name="submitform" value="提交">
            </td>
        </tr>
    </table>
</form>
</body>
</html>