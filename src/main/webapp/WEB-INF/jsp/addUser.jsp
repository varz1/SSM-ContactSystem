<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width,initial-scala=1"/>
    <title>添加用户</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" rel="script">
</head>
<body>
<div class="container">
    <center><h3>添加联系人</h3></center>
    <form name="addform" action="${pageContext.request.contextPath}/user/addUser" method="post">
        <div class="form-group">
            <label for="name">姓名</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label>性别</label>
            <input type="radio" name="gender" value="男" checked/>男
            <input type="radio" name="gender" value="女"/>女
        </div>
        <div class="form-group">
            <label for="age">年龄</label>
            <input type="number" class="form-control" id="age" name="age" required>
        </div>
        <div class="form-group">
            <label for="address">地区</label>
            <select name="address" class="form-control" id="address">
                <option value="北京市">北京市</option>
                <option value="天津市">天津市</option>
                <option value="上海市">上海市</option>
                <option value="重庆市">重庆市</option>
                <option value="河北省">河北省</option>
                <option value="山西省">山西省</option>
                <option value="辽宁省">辽宁省</option>
                <option value="吉林省">吉林省</option>
                <option value="黑龙江省">黑龙江省</option>
                <option value="江苏省">江苏省</option>
                <option value="浙江省">浙江省</option>
                <option value="安徽省">安徽省</option>
                <option value="福建省">福建省</option>
                <option value="江西省">江西省</option>
                <option value="山东省">山东省</option>
                <option value="河南省">河南省</option>
                <option value="湖北省">湖北省</option>
                <option value="湖南省">湖南省</option>
                <option value="广东省">广东省</option>
                <option value="海南省">海南省</option>
                <option value="四川省">四川省</option>
                <option value="陕西省">陕西省</option>
                <option value="甘肃省">甘肃省</option>
                <option value="青海省">青海省</option>
                <option value="台湾省">台湾省</option>
                <option value="内蒙古自治区">内蒙古自治区</option>
                <option value="广西壮族自治区">广西壮族自治区</option>
                <option value="西藏自治区">西藏自治区</option>
                <option value="宁夏回族自治区">宁夏回族自治区</option>
                <option value="新疆维吾尔自治区">新疆维吾尔自治区</option>
                <option value="香港特别行政区">香港特别行政区</option>
                <option value="澳门特别行政区">澳门特别行政区</option>
            </select>
        </div>
        <div class="form-group">
            <label for="qq">QQ</label>
            <input class="form-control" name="qq" id="qq" required/>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input class="form-control" type="email" name="email" id="email" required/>
        </div>
        <div class="form-group" style="...">
            <input class="btn btn-primary" type="submit" value="提交"/>
            <input class="btn btn-primary" type="reset" value="重置"/>
            <input class="btn btn-primary" type="button" value="取消"/>
            <%--            <input onclick="${pageContext.request.contextPath}/list.jsp" class="btn btn-primary" type="button" value="取消"/>--%>
        </div>
    </form>
</div>
</body>
</html>
