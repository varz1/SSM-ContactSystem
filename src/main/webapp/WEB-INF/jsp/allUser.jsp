<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width,initial-scala=1"/>
    <title>用户信息管理系统</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.css" rel="script">
    <script>
        function deleteUser(id) {
            if (confirm("确定删除吗？")) {
                location.href = "${pageContext.request.contextPath}/deleteServlet?id=" + id;
            }
        }

        window.onload = function () {
            document.getElementById("deleteSelected").onclick = function () {
                if (confirm("确定删除选中条目吗？")) {
                    var flag = false;
                    var cbs = document.getElementsByName("uid");
                    for (var i = 0; i < cbs.length; i++) {
                        if (cbs[i].checked) {
                            flag = true;
                            break;
                        }
                    }
                    if (flag) {
                        document.getElementById("formSelected").submit();
                    }
                }
            }
            var ac = document.getElementById("cb");
            ac.onclick = function () {
                var cbs = document.getElementsByName("uid");
                for (var i = 0; i < cbs.length; i++) {
                    cbs[i].checked = this.checked;
                }
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h3 style="...">用户信息列表</h3>

    <div style="float: left;">
        <form class="form-inline" action="${pageContext.request.contextPath}/user/queryUser" method="post">
            <div class="form-group">
                <label for="Name">姓名</label>
                <input type="text" class="form-control" id="name" name="name" value="${query_name}" placeholder="姓名">
            </div>
            <div class="form-group">
                <label for="address">籍贯</label>
                <input type="text" class="form-control" id="address" name="address" value="${query_address}" placeholder="籍贯">
            </div>
            <div class="form-group">
                <label for="email">邮箱</label>
                <input type="text" class="form-control" id="email" name="email" value="${query_email}" placeholder="邮箱">
            </div>
            <button type="submit" class="btn btn-default">查询</button>
        </form>
    </div>

    <div style="float: right;margin: 5px;">
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/toAddUser">添加联系人</a>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/del/${user.getId()}">删除联系人</a>
    </div>
    <form id="formSelected" action="" method="post">
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th><input class="checkbox" type="checkbox" id="cb"></th>
                <th>编号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>籍贯</th>
                <th>QQ</th>
                <th>邮箱</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pageInfo.list}"  var="user" >
                <tr>
                    <th><input class="checkbox" type="checkbox" name="uid" value="${user.getId()}"></th>
                    <td>${user.getId()}</td>
                    <td>${user.getName()}</td>
                    <td>${user.getGender()}</td>
                    <td>${user.getAge()}</td>
                    <td>${user.getAddress()}</td>
                    <td>${user.getQq()}</td>
                    <td>${user.getEmail()}</td>
                    <td><a class="btn btn-default btn-sm"
                           href="${pageContext.request.contextPath}/user/toUpdateUser?id=${user.getId()}">修改</a>&nbsp;
                        <a class="btn btn-default btn-sm"
                           href="${pageContext.request.contextPath}/user/del/${user.getId()}">删除</a>
                    </td>
                </tr>
            </c:forEach>

        </table>
    </form>

    <div class="row">
        <!--文字信息-->
        <div class="col-md-6">
            当前第 ${pageInfo.pageNum} 页.总共 ${pageInfo.pages} 页.一共 ${pageInfo.total} 条记录
        </div>

        <!--点击分页-->
        <div class="col-md-5 center-block text-center">
            <nav aria-label="Page navigation">
                <ul class="pagination">

                    <li><a href="${pageContext.request.contextPath}/user/allUser?pn=1">首页</a></li>

                    <!--上一页-->
                    <li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <a href="${pageContext.request.contextPath}/user/allUser?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">«</span>
                            </a>
                        </c:if>
                    </li>

                    <!--循环遍历连续显示的页面，若是当前页就高亮显示，并且没有链接-->
                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                        <c:if test="${page_num == pageInfo.pageNum}">
                            <li class="active"><a href="#">${page_num}</a></li>
                        </c:if>
                        <c:if test="${page_num != pageInfo.pageNum}">
                            <li><a href="${pageContext.request.contextPath}/user/allUser?pn=${page_num}">${page_num}</a></li>
                        </c:if>
                    </c:forEach>

                    <!--下一页-->
                    <li>
                        <c:if test="${pageInfo.hasNextPage}">
                            <a href="${pageContext.request.contextPath}/user/allUser?pn=${pageInfo.pageNum+1}"
                               aria-label="Next">
                                <span aria-hidden="true">»</span>
                            </a>
                        </c:if>
                    </li>

                    <li><a href="${pageContext.request.contextPath}/user/allUser?pn=${pageInfo.pages}">尾页</a></li>
                </ul>
            </nav>
        </div>

    </div>

</div>
</body>
</html>