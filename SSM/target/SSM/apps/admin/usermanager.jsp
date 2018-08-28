<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户管理</title>
    <meta http-equiv="content-type" content="multipart/form-data";charset="uft-8"/>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/slide.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
    <%--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/flat-ui.min.css" />--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.nouislider.css">
    <script type="text/javascript">
        function editUser(id) {
            $.ajax({
                type: "get",
                url: "${pageContext.request.contextPath}/edit",
                data: {"id": id},
                success: function (data) {
                    $("#id").val(data.userId);
                    $("#name1").val(data.userName);
                    $("#password").val(data.userPwd);
                    $("#email").val(data.email);
                    $("#phone").val(data.phone);
                    $("#sex").val(data.sex);
                    $("#pic").val(data.pic);
                }
            });
        }

        function deleteUser(id) {
            if (confirm('确实要删除吗?')) {
                var url = "${pageContext.request.contextPath}/deleteUser";
                var args = {"userId": id};
                $.post(url, args, function (data) {
                    if (data == 'ok') {
                        alert("删除更新成功！");
                        window.location.reload();
                    }
                    else {
                        alert("删除失败");
                    }

                });
            }
        }
    </script>
</head>
<body>
<div role="tabpanel" class="tab-pane" id="user">
    <div class="check-div form-inline">
        <div class="col-xs-4" >
            <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addUser">添加用户 </button>
        </div>
        <%--<form method="post" action="${pageContext.request.contextPath}/selectByKey">--%>
            <div class="col-xs-6">
                <input type="text" class="form-control input-sm" name="userName" id="userName" placeholder="输入用户名搜索">
                <button class="btn btn-white btn-xs " type="submit" onclick="showSelectUser($('#userName').val())">查 询 </button>
            </div>
        <%--</form>--%>
    </div>
    <div>
        <table class="table">
            <tr>
                <th>用户ID</th>
                <th>头像</th>
                <th>用户名</th>
                <th>密码</th>
                <th>性别</th>
                <th>邮箱</th>
                <th>电话</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pageinfo.list}" var="usr">
                <tr>
                    <td>${usr.userId}</td>
                    <td><img src="/uploads/${usr.pic}" style="width: 100px;height: 80px"></td>
                    <td>${usr.userName}</td>
                    <td>${usr.userPwd}</td>
                    <td>${usr.sex}</td>
                    <td>${usr.email}</td>
                    <td>${usr.phone}</td>
                    <td>
                        <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#reviseUser" onclick="editUser(${usr.userId})">修改</button>
                        <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteUser" onclick="deleteUser(${usr.userId})">删除</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <!-- 显示分页信息 -->
    <div class="row">
        <!--分页文字信息  -->
        <div class="col-xs-5">当前 ${pageinfo.pageNum}页,总${pageinfo.pages}
            页,总 ${pageinfo.total} 条记录</div>
        <!-- 分页条信息 -->
        <div class="col-xs-5">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a onclick="showUser(1)">首页</a></li>
                    <c:if test="${pageinfo.hasPreviousPage}">
                        <li><a onclick="showUser(${pageinfo.pageNum-1})"
                               aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                        </a></li>
                    </c:if>


                    <c:forEach items="${pageinfo.navigatepageNums}" var="page_Num">
                        <c:if test="${page_Num == pageinfo.pageNum}">
                            <li class="active"><a href="#">${page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageinfo.pageNum}">
                            <li><a onclick="showUser(${page_Num})" >${page_Num}</a></li>
                        </c:if>

                    </c:forEach>
                    <c:if test="${pageinfo.hasNextPage}">
                        <li><a onclick="showUser( ${pageinfo.pageNum+1})"
                               aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                        </a></li>
                    </c:if>
                    <li><a onclick="showUser(${pageinfo.pages})">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</div>
<!--弹出添加餐厅窗口-->
<div class="modal fade" id="addUser" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加用户</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form method="post" class="form-horizontal" action="${pageContext.request.contextPath}/insertUser" enctype="multipart/form-data">
                        <div class="form-group">
                            <label class="col-xs-3 control-label">用户名:</label>
                            <div class="col-xs-8 ">
                                <input name="userName" type="text" class="form-control input-sm duiqi">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label">密码:</label>
                            <div class="col-xs-8">
                                <input name="userPwd" type="text" class="form-control input-sm duiqi" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label">性别:</label>
                            <div class="col-xs-8">
                                <input name="sex" type="text" class="form-control input-sm duiqi">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">电话:</label>
                            <div class="col-xs-8">
                                <input name="phone" type="text" class="form-control input-sm duiqi" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">邮箱:</label>
                            <div class="col-xs-8">
                                <input name="email" type="text" class="form-control input-sm duiqi">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label">图片:</label>
                            <input name="file" type="file">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                            <button type="submit" class="btn btn-xs btn-green" >添 加</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!--弹出修改餐厅窗口-->
<div class="modal fade" id="reviseUser" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改用户信息</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form method="post" class="form-horizontal" action="${pageContext.request.contextPath}/updateUser" enctype="multipart/form-data">
                        <div class="form-group ">
                            <label class="col-xs-3 control-label">ID:</label>
                            <div class="col-xs-8 ">
                                <input name="userId" type="text" class="form-control input-sm duiqi" id="id" readonly="readonly">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label">用户名:</label>
                            <div class="col-xs-8 ">
                                <input name="userName" type="text" class="form-control input-sm duiqi" id="name1">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label">密码:</label>
                            <div class="col-xs-8">
                                <input name="userPwd" type="text" class="form-control input-sm duiqi" id="password" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label">性别:</label>
                            <div class="col-xs-8">
                                <input name="sex" type="text" class="form-control input-sm duiqi" id="sex">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">邮箱:</label>
                            <div class="col-xs-8">
                                <input name="email" type="text" class="form-control input-sm duiqi" id="email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">电话:</label>
                            <div class="col-xs-8">
                                <input name="phone" type="text" class="form-control input-sm duiqi" id="phone">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">图片:</label>
                            <input name="file" type="file">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                            <button type="submit" class="btn btn-xs btn-green" >保 存</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
</div>
<!-- /.modal -->

</div>
</body>
</html>
