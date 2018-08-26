
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>查询后显示餐厅</title>
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
        function editRestaur(id) {
            $.ajax({
                type: "get",
                url: "${pageContext.request.contextPath}/editRestaur",
                data: {"id": id},
                success: function (data) {
                    $("#id1").val(data.restaurId);
                    $("#name1").val(data.restaurName);
                    $("#address1").val(data.restaurAddress);
                    $("#phone2").val(data.phone);
                    $("#range1").val(data.restaurRange);
                    $("#describe1").val(data.restaurDescribe);
                    $("#fee1").val(data.fee);
                    $("#pic1").val(data.restaurPic);
                }
            });
        }

        function deleteRestaur(id) {
            if (confirm('确实要删除吗?')) {
                var url = "${pageContext.request.contextPath}/deleteRestaur";
                var args = {"restaurId": id};
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
            <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addUser">添加餐厅 </button>
        </div>
        <%--<form method="post" action="${pageContext.request.contextPath}/selectByMany">--%>
            <div class="col-xs-6">
                <input type="text" class="form-control input-sm" id="key"  name="key" placeholder="输入地址或名字搜索">
                <button class="btn btn-white btn-xs " type="submit" onclick="showSelectRestaur($('#key').val())">查 询 </button>
            </div>
        <%--</form>--%>

    </div>
    <div>
        <table class="table">
            <tr>
                <th>餐厅图片</th>
                <th>餐厅名字</th>
                <th>地址</th>
                <th>电话</th>
                <th>送餐范围</th>
                <th>描述</th>
                <th>配送费</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${restaurants}" var="res">
                <tr>
                    <td><img src="/uploads/${res.restaurPic}" style="width: 100px;height: 80px"></td>
                    <td>${res.restaurName}</td>
                    <td>${res.restaurAddress}</td>
                    <td>${res.phone}</td>
                    <td>${res.restaurRange}</td>
                    <td>${res.restaurDescribe}</td>
                    <td>&yen;${res.fee}</td>
                    <td>
                        <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#reviseUser" onclick="editRestaur(${res.restaurId})">修改</button>
                        <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteUser" onclick="deleteRestaur(${res.restaurId})">删除</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<div class="modal fade" id="addUser" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加餐厅</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form method="post" class="form-horizontal" action="${pageContext.request.contextPath}/insertRestaur" enctype="multipart/form-data">
                        <div class="form-group">
                            <label class="col-xs-3 control-label">餐厅名字:</label>
                            <div class="col-xs-8 ">
                                <input name="restaurName" type="text" class="form-control input-sm duiqi" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label">地址:</label>
                            <div class="col-xs-8">
                                <input name="restaurAddress" type="text" class="form-control input-sm duiqi" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">电话:</label>
                            <div class="col-xs-8">
                                <input name="phone" type="text" class="form-control input-sm duiqi">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">送餐范围:</label>
                            <div class="col-xs-8">
                                <input name="restaurRange" type="text" class="form-control input-sm duiqi" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">描述:</label>
                            <div class="col-xs-8">
                                <input name="restaurDescribe" type="text" class="form-control input-sm duiqi" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label">配送费:</label>
                            <div class="col-xs-8">
                                <input name="fee" type="text" class="form-control input-sm duiqi" >
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
                <h4 class="modal-title">修改餐厅信息</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form method="post" class="form-horizontal" action="${pageContext.request.contextPath}/updateRestaur" enctype="multipart/form-data">
                        <div class="form-group ">
                            <label class="col-xs-3 control-label">ID:</label>
                            <div class="col-xs-8 ">
                                <input name="restaurId" type="text" class="form-control input-sm duiqi" id="id1" readonly="readonly">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label">餐厅名字:</label>
                            <div class="col-xs-8 ">
                                <input name="restaurName" type="text" class="form-control input-sm duiqi" id="name1">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label">地址:</label>
                            <div class="col-xs-8">
                                <input name="restaurAddress" type="text" class="form-control input-sm duiqi" id="address1" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">电话:</label>
                            <div class="col-xs-8">
                                <input name="phone" type="text" class="form-control input-sm duiqi" id="phone2">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label">送餐范围:</label>
                            <div class="col-xs-8">
                                <input name="restaurRange" type="text" class="form-control input-sm duiqi" id="range1">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label">描述:</label>
                            <div class="col-xs-8">
                                <input name="restaurDescribe" type="text" class="form-control input-sm duiqi" id="describe1">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label">配送费:</label>
                            <div class="col-xs-8">
                                <input name="fee" type="text" class="form-control input-sm duiqi" id="fee1">
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
</body>
</html>
