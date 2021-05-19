<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width,initial-scala=1"/>
    <title>管理员登录</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.css" rel="script">
<%--    <link href="static/css/bootstrap.min.css" rel="stylesheet">--%>
<%--    <link href="static/js/bootstrap.min.js" rel="script">--%>

</head>
<body>
<div class="container-fluid ">
    <div class="h1 center-block text-center">管理员登录</div>
    <form class="form-horizontal" action="${pageContext.request.contextPath}/user/login" method="post">
        <div class="form-group">
            <label for="user" class="col-sm-4 control-label">用户名</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" name="username" id="user" placeholder="请输入用户名">
            </div>
        </div>
        <div class="form-group">
            <label for="pwd" class="col-sm-4 control-label">密码</label>
            <div class="col-sm-4">
                <input type="password" class="form-control" name="password" id="pwd" placeholder="请输入密码">
            </div>
        </div>
        <div class="form-group">
            <label for="verCode" class="col-sm-4 control-label">验证码</label>
            <div class="col-sm-2">
                <input type="text" name="verCode" class="form-control" id="verCode" placeholder="请输入验证码">
                    <img src="${pageContext.request.contextPath}/captcha" width="130px" height="48px"/>
                <a href="${pageContext.request.contextPath}/user/login" id="vcode" title="点击刷新">点击刷新</a>
            </div>
            <hr/>
        </div>


        <div class="form-group center-block">
            <div style="text-align: center" >
                <button type="submit" class="btn btn-default btn-primary">登录</button>
            </div>
        </div>
    </form>
    <div style="text-align: center" class="alert-warning alert-dismissable center-block" role="alert">
        <button type="button" class="close">
        <span>
        </span>
        </button>
        <strong style="text-align: center">${loginMsg}</strong>
    </div>
</div>
</body>
</html>
