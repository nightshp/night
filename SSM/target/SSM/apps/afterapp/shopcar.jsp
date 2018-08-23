<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购物车</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/thems.css">
<script src="${pageContext.request.contextPath}/js/simpleCart.min.js"> </script>
<script type="text/javascript">
    function deleteShop(id) {
        if (confirm('确实要删除该商品吗吗?')) {
            var url = "${pageContext.request.contextPath}/deleteShop";
            var args = {"shopcarId": id};
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
    function insertOrder(id) {
        <%--$.ajax({--%>
            <%--url:"${pageContext.request.contextPath}/insertOrder?userId=${logUser.userId}",--%>
            <%--dataType:"json",--%>
            <%--type:"POST",--%>
            <%--success:function (data) {--%>
                <%--if (data == 'ok') {--%>
                    <%--alert("下单成功！");--%>
                    <%--window.location.reload();--%>
                <%--}--%>
                <%--else {--%>
                    <%--alert("下单失败");--%>
                <%--}--%>
            <%--},--%>
            <%--error:function () {--%>
                <%--alert("请求错误");--%>
            <%--}--%>
        <%--});--%>
        if (confirm('确实要下单吗?')) {
            var url = "${pageContext.request.contextPath}/insertOrder";
            var args = {"userId": id};
            $.post(url, args, function (data) {
                if (data == 'ok') {
                    alert("下单成功！");
                    window.location.href="${pageContext.request.contextPath}/deleteAllShop?userId=${logUser.userId}";
                }
                else {
                    alert("下单失败");
                }

            });
        }
    }
</script>
</head>

<body>
<div class="space_hx">&nbsp;</div>

    <div class="user clearfix">
        <div class="u_r" style="float: left;margin-left: 15px;margin-top: -24px">
            <div class="user_m user_ma clearfix">
            	<div class="shopcar">
                    <div class="car_m">
                    	<table cellpadding="0" cellspacing="0">
                            <c:forEach items="${shopcar}" var="shop">
                                <tr>
                                    <td class="tu"><img src="/uploads/${shop.shopPic}" width="100px" height="100px"/></td>
                                    <td class="des">
                                        <div class="title">${shop.shopName}</div>
                                        <span>描述:</span>
                                        <span>${shop.shopDescribe}</span>
                                    </td>
                                    <td><div class="price">&yen;<em>${shop.shopPrice}</em></div></td>
                                    <td><a style="cursor: pointer" onclick="deleteShop(${shop.shopcarId})">删除</a></td>
                                </tr>
                            </c:forEach>
                        </table>
						<div class="s_order">
                            <span style="font-size: 20px">总计:&yen;&nbsp;${totalPrice} </span>
                            <a onclick="insertOrder(${logUser.userId})" style="cursor: pointer">立即下单</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="space_hx">&nbsp;</div>
</body>
</html>
