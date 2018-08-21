<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</head>
<body>
<!-- 搭建显示页面 -->
<div class="container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <!-- 按钮 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">//本来占4列，现在偏移8列
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>id</th>
                    <th>userName</th>
                    <th>userPwd</th>
                    <th>email</th>
                    <th>phone</th>
                    <th>sex</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageinfo.list}" var="user">
                    <tr>
                        <th>${user.userId}</th>
                        <th>${user.userName}</th>
                        <th>${user.userPwd}</th>
                        <th>${user.email}</th>
                        <th>${user.phone}</th>
                        <th>${user.sex}</th>
                        <th>
                            <button class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑
                            </button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除
                            </button>
                        </th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

    <!-- 显示分页信息 -->
    <div class="row">
        <!--分页文字信息  -->
        <div class="col-md-6">当前 ${pageinfo.pageNum}页,总${pageinfo.pages}
            页,总 ${pageinfo.total} 条记录</div>
        <!-- 分页条信息 -->
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${pageContext.request.contextPath}/getAll?pn=1">首页</a></li>
                    <c:if test="${pageinfo.hasPreviousPage}">
                        <li><a href="${pageContext.request.contextPath}/getAll?pn=${pageinfo.pageNum-1}"
                               aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                        </a></li>
                    </c:if>


                    <c:forEach items="${pageinfo.navigatepageNums}" var="page_Num">
                        <c:if test="${page_Num == pageinfo.pageNum}">
                            <li class="active"><a href="#">${page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageinfo.pageNum}">
                            <li><a href="${pageContext.request.contextPath}/getAll?pn=${page_Num}">${page_Num}</a></li>
                        </c:if>

                    </c:forEach>
                    <c:if test="${pageinfo.hasNextPage}">
                        <li><a href="${pageContext.request.contextPath}/getAll?pn=${pageinfo.pageNum+1}"
                               aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                        </a></li>
                    </c:if>
                    <li><a href="${pageContext.request.contextPath}/getAll?pn=${pageinfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>

</div>
</body>
</html>