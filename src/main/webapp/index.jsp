<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width,initial-scala=1"/>
    <title>首页</title>
    <link href="WEB-INF/jsp/css/bootstrap.min.css" rel="stylesheet">
    <link href="WEB-INF/jsp/js/jquery-3.6.0.min.js" rel="script">
    <link href="WEB-INF/jsp/js/bootstrap.min.js" rel="script">
</head>
<body>

<%--<div><c:if test="${not empty superior.username}">--%>
<%--    <h2 class="h2 center-block text-center">${superior.username},欢迎</h2>--%>
<%--</c:if></div>--%>

<%--<div><c:if test="${empty superior.username}">--%>
<%--    <h2 class="h2 center-block text-center">错误</h2>--%>
<%--</c:if></div>--%>

<div align="center">
    <a
            href="${pageContext.request.contextPath}/user/allUser">查询所有用户信息
    </a>
</div>
</body>
</html>