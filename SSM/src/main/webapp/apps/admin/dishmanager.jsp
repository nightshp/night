<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>菜肴管理</title>
    <meta http-equiv="content-type" content="multipart/form-data";charset="uft-8"/>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-select.js"></script>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/slide.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-select.min.css" />
    <%--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/flat-ui.min.css" />--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.nouislider.css">
    <script type="text/javascript">
        function editDish(id) {
            $.ajax({
                type: "get",
                url: "${pageContext.request.contextPath}/editDish",
                data: {"id": id},
                success: function (data) {
                    $("#id").val(data.dishId);
                    $("#name").val(data.dishName);
                    $("#pric").val(data.dishPric);
                    $("#describe").val(data.dishDiscribe);
                    $("#class").val(data.dishClass);
                    $("#pic").val(data.dishPic);
                    $("#restaur1").val(data.restaurId);
                }
            });
        }

        function deleteDish(id) {
            if (confirm('确实要删除吗?')) {
                var url = "${pageContext.request.contextPath}/deleteDish";
                var args = {"dishId": id};
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
            <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addUser">添加菜肴 </button>
        </div>
        <%--<form method="post" action="${pageContext.request.contextPath}/selectByKey">--%>
            <div class="col-xs-6">
                <input type="text" class="form-control input-sm" name="key" id="key" placeholder="输入菜名或种类搜索">
                <button class="btn btn-white btn-xs " type="submit" onclick="showSelectDish($('#key').val())">查 询 </button>
            </div>
        <%--</form>--%>
    </div>
    <div>
        <table class="table">
            <tr>
                <th>菜肴ID</th>
                <th>图片</th>
                <th>菜名</th>
                <th>类别</th>
                <th>介绍</th>
                <th>价格</th>
                <th>餐厅id</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pageinfo.list}" var="menu">
                <tr>
                    <td>${menu.dishId}</td>
                    <td><img src="/uploads/${menu.dishPic}" style="width: 100px;height: 80px"></td>
                    <td>${menu.dishName}</td>
                    <td>${menu.dishClass}</td>
                    <td>${menu.dishDiscribe}</td>
                    <td>${menu.dishPric}&yen;</td>
                    <td>${menu.restaurId}</td>
                    <td>
                        <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#reviseUser" onclick="editDish(${menu.dishId})">修改</button>
                        <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteUser" onclick="deleteDish(${menu.dishId})">删除</button>
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
                    <li><a onclick="showDish(1)">首页</a></li>
                    <c:if test="${pageinfo.hasPreviousPage}">
                        <li><a onclick="showDish(${pageinfo.pageNum-1})"
                               aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                        </a></li>
                    </c:if>


                    <c:forEach items="${pageinfo.navigatepageNums}" var="page_Num">
                        <c:if test="${page_Num == pageinfo.pageNum}">
                            <li class="active"><a href="#">${page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageinfo.pageNum}">
                            <li><a onclick="showDish(${page_Num})">${page_Num}</a></li>
                        </c:if>

                    </c:forEach>
                    <c:if test="${pageinfo.hasNextPage}">
                        <li><a onclick="showDish(${pageinfo.pageNum+1})"
                               aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                        </a></li>
                    </c:if>
                    <li><a onclick="showDish( ${pageinfo.pages})">末页</a></li>
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
                <h4 class="modal-title">添加菜肴</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form method="post" class="form-horizontal" action="${pageContext.request.contextPath}/insertDish" enctype="multipart/form-data">
                        <div class="form-group">
                            <label class="col-xs-3 control-label">菜名:</label>
                            <div class="col-xs-8">
                                <input name="dishName" type="text" class="form-control input-sm duiqi" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">类别:</label>
                            <div class="col-xs-8">
                                <input name="dishClass" type="text" class="form-control input-sm duiqi">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">介绍:</label>
                            <div class="col-xs-8">
                                <input name="dishDiscribe" type="text" class="form-control input-sm duiqi" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">价格:</label>
                            <div class="col-xs-8">
                                <input name="dishPric" type="text" class="form-control input-sm duiqi">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">餐厅id:</label>
                            <div class="col-xs-8">
                                <select name="restaurId">
                                <c:forEach items="${arr}" var="ar">
                                    <option>${ar}</option>
                                </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">图片:</label>
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
                <h4 class="modal-title">修改菜肴信息</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form method="post" class="form-horizontal" action="${pageContext.request.contextPath}/updateDish" enctype="multipart/form-data">
                        <div class="form-group ">
                            <label class="col-xs-3 control-label">菜肴ID:</label>
                            <div class="col-xs-8 ">
                                <input name="dishId" type="text" class="form-control input-sm duiqi" id="id" readonly="readonly">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label">菜名:</label>
                            <div class="col-xs-8 ">
                                <input name="dishName" type="text" class="form-control input-sm duiqi" id="name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label">类别:</label>
                            <div class="col-xs-8">
                                <input name="dishClass" type="text" class="form-control input-sm duiqi" id="class" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">介绍:</label>
                            <div class="col-xs-8">
                                <input name="dishDiscribe" type="text" class="form-control input-sm duiqi" id="describe">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">价格:</label>
                            <div class="col-xs-8">
                                <input name="dishPric" type="text" class="form-control input-sm duiqi" id="pric">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">餐厅id:</label>
                            <div class="col-xs-8">
                                <input name="restaurId" type="text" class="form-control input-sm duiqi" id="restaur1" readonly="readonly">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label">图片:</label>
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

