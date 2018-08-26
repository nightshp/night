<<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>搜索订单</title>
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
        function deleteOrder(id) {
            if (confirm('确实要删除吗?')) {
                var url = "${pageContext.request.contextPath}/deleteOrder";
                var args = {"orderId": id};
                $.post(url, args, function (data) {
                    if (data == 'ok') {
                        alert("删除成功！");
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
        </div>
        <%--<form method="post" action="${pageContext.request.contextPath}/selectByUser">--%>
            <div class="col-xs-6">
                <input type="text" class="form-control input-sm" name="userId" id="userId" placeholder="根据用户id搜索" >
                <button class="btn btn-white btn-xs " type="submit" onclick="showSelectOrder($('#userId').val())">查 询 </button>
            </div>
        <%--</form>--%>
    </div>
    <div>
        <table class="table">
            <tr>
                <th>订单ID</th>
                <th>用户ID</th>
                <th>下单时间</th>
                <th>预计到达时间</th>
                <th>送餐地址</th>
                <th>订单状态</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${orders}" var="ord">
                <tr>
                    <td>${ord.orderId}</td>
                    <td>${ord.userId}</td>
                    <td>${ord.orderDate}</td>
                    <td>${ord.endDate}</td>
                    <td>${ord.sendAddr}</td>
                    <c:if test="${ord.orderStatus==0}" var="rs">
                        <td><span class="x_mr active">未支付</span></td>
                    </c:if>
                    <c:if test="${ord.orderStatus==1}" var="rs">
                        <td><span class="x_mr active">已支付</span></td>
                    </c:if>
                    <td>
                        <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteUser" onclick="deleteOrder(${ord.orderId})">删除</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</div>
</div>
</body>
</html>
