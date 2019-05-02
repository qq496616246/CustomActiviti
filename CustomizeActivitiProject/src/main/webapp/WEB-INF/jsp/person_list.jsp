<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>列表</title>
</head>
<script type="text/javascript">
    // 跳转到添加人的页面
    function addperson(){
        window.location = "${pageContext.request.contextPath}/toaddperson";
    }
</script>
<body>
<h1>列表</h1>
<table>
    <tr>
        <td>序号</td>
        <td>姓名</td>
    </tr>
    <c:forEach var="everyPerson" items="${pageInfo}">
        <tr>
            <td>${everyPerson.id}</td>
            <td>${everyPerson.name}</td>
        </tr>
    </c:forEach>
</table>

<button id="addperson" name="addperson"  onclick="addperson();">添加一位新人</button>
</body>
</html>