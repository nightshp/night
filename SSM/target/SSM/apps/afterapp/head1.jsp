<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Spicemystery a Hotel and Resturant Category Flat Bootstarp Responsive Website Template | Home :: w3layouts</title>
    <link href="${pageContext.request.contextPath}/dist/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Spicemystery Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login-register.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/simpleCart.min.js"> </script>
    <script src="${pageContext.request.contextPath}/js/login-register.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
</head>
<body>
<!-- header -->
<div class="head-top">
</div>
<div class="header">
    <div class="container">
        <div class="logo">
            <img src="${pageContext.request.contextPath}/images/logo.png" class="img-responsive" alt="">
        </div>
        <div class="header-left">
            <div class="head-nav">
                <span class="menu"> </span>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/selectMenus">首页</a></li>
                    <li><a href="${pageContext.request.contextPath}/selectRestaurants">餐厅</a></li>
                    <li><a href="${pageContext.request.contextPath}/apps/afterapp/user.jsp">个人中心</a></li>
                    <li><a href="${pageContext.request.contextPath}/apps/afterapp/contact.jsp">联系我们</a></li>
                    <div class="clearfix"> </div>
                </ul>
                <!-- script-for-nav -->
                <script>
                    $( "span.menu" ).click(function() {
                        $( ".head-nav ul" ).slideToggle(300, function() {
                            // Animation complete.
                        });
                    });
                </script>
                <!-- script-for-nav -->
            </div>
            <div class="header-right1">
                <div class="cart box_1">
                    <a href="${pageContext.request.contextPath}/apps/afterapp/user.jsp">
                        <h3> <span class="simpleCart_total"> $0.00 </span> (<span id="simpleCart_quantity" class="simpleCart_quantity"> 0 </span> items)<img src="${pageContext.request.contextPath}/images/bag.png" alt=""></h3>
                    </a>
                    <p><a href="javascript:;" class="simpleCart_empty">清空购物车</a></p>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="clearfix"> </div>
    </div>
    <div style="position: absolute;right: 30px;top: 30px">
        <p><img src="/uploads/${logUser.pic}" class="img-circle" style="width: 40px;height: 40px"></p>
    </div>
    <div style="position: absolute;right: 35px;top: 70px;cursor: pointer;">
        <a href="${pageContext.request.contextPath}/logout">退出</a>
    </div>
</div>
<!-- header -->
</body>
</html>
