<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/thems.css">
    <script type="text/javascript">
        function deleteOrder(id) {
            if (confirm('确实要删除该订单吗?')) {
                var url = "${pageContext.request.contextPath}/deleteOrder";
                var args = {"orderId": id};
                $.post(url, args, function (data) {
                    if (data == 'ok') {
                        alert("删除订单成功！");
                        bookHtml();
                    }
                    else {
                        alert("删除失败");
                        bookHtml();
                    }

                });
            }
        }
    </script>
</head>

<body>
<div class="space_hx">&nbsp;</div>
<div class="u_r" style="float: left;margin-left: 15px;margin-top: -24px">
<div class="address">
    <table class="ads_b" cellpadding="0" cellspacing="0">
        <tr>
            <th scope="col">订单ID</th>
            <th scope="col">收货人</th>
            <th scope="col">下单时间</th>
            <th scope="col">预计到达时间</th>
            <th scope="col">收货地址</th>
            <th scope="col">订单状态</th>
            <th scope="col">操作</th>
        </tr>
        <c:forEach items="${orders}" var="ord" varStatus="status">
            <tr>
                <td>${ord.orderId}</td>
                <td>${ord.orderName}</td>
                <td>${ord.orderDate}</td>
                <td>${ord.endDate}</td>
                <td>${ord.sendAddr}</td>
                <c:if test="${ord.orderStatus==1}" var="rs">
                    <td><span>已支付</span></td>
                </c:if>
                <c:if test="${ord.orderStatus==0}" var="rs">
                    <td><td><span>未支付</span></td></td>
                </c:if>
                <td><a onclick="deleteOrder(${ord.orderId})" style="cursor: pointer">删除</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</div>
<div class="space_hx">&nbsp;</div>
</body>
</html>
