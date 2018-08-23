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
    <script type="text/javascript">
            function logajax() {
                $.ajax({
                    url:"${pageContext.request.contextPath}/login",
                    data:$("#form1").serialize(),
                    type:"POST",
                    success:function (data) {
                        if (data == 'ok') {
                            alert("登录成功");
                            window.location.replace("${pageContext.request.contextPath}/selectMenus");
                        }
                        else {
                            alert("用户名或密码错误");
                        }
                    },
                    error:function () {
                        alert("请求错误");
                    }
                });
            }
    </script>
</head>
<body>
<!-- header -->
<div class="head-top">
</div>
<div class="header">
    <div class="container">
        <div class="logo">
            <a href="${pageContext.request.contextPath}/apps/app/index.jsp"><img src="${pageContext.request.contextPath}/images/logo.png" class="img-responsive" alt=""></a>
        </div>
        <div class="header-left">
            <div class="head-nav">
                <span class="menu"> </span>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/selectAllMenu">首页</a></li>
                    <li><a href="${pageContext.request.contextPath}/selectRes">餐厅</a></li>
                    <li><a href="${pageContext.request.contextPath}/apps/app/index.jsp" data-toggle="modal" onclick="openLoginModal()">个人中心</a></li>
                    <li><a href="${pageContext.request.contextPath}/apps/app/contact.jsp" data-toggle="modal" onclick="openLoginModal()">联系我们</a></li>
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
                    <a data-toggle="modal" href="javascript:void(0)" onclick="openLoginModal()">
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
    <div style="position: absolute;right: 10px;top: 50px">
        <a  data-toggle="modal" href="javascript:void(0)" onclick="openLoginModal()" class="glyphicon glyphicon-user">登录</a>
        <a  data-toggle="modal" href="javascript:void(0)" onclick="openRegisterModal();" class="glyphicon glyphicon-list-alt">注册</a>
    </div>
</div>
<!-- header -->
<!--login,register-->
<div class="container">
    <div class="modal fade login" id="loginModal">
        <div class="modal-dialog login animated">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Login</h4>
                </div>
                <div class="modal-body">
                    <div class="box">
                        <div class="content">
                            <div style="padding-left: 60px;"><img src="${pageContext.request.contextPath}/images/log.jpg" /></div>
                            <div class="division">
                                <div class="line l"></div>
                                <span>Hi</span>
                                <div class="line r"></div>
                            </div>
                            <div class="error"></div>
                            <div class="form loginBox">
                                <form  id="form1"accept-charset="UTF-8">
                                    <input id="name" class="form-control" type="text" placeholder="用户名" name="username">
                                    <input id="pwd" class="form-control" type="password" placeholder="密码" name="password">
                                    <input class="btn btn-default btn-login" type="button" value="登录" onclick="logajax()">
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="box">
                        <div class="content registerBox" style="display:none;">
                            <div class="form">
                                <form method="post" html="{:multipart=>true}" data-remote="true" action="${pageContext.request.contextPath}/register" accept-charset="UTF-8">
                                    <input class="form-control" type="text" placeholder="用户名" name="username">
                                    <input class="form-control" type="password" placeholder="密码" name="password" onblur="checkPwd1()">
                                    <div id="promat1" class="pro"></div>
                                    <input class="form-control" type="password" placeholder="确认密码" name="password1" onblur="checkPwd()">
                                    <div id="promat" class="pro"></div>
                                    <input class="btn btn-default btn-register" type="submit" value="创建账号">
                                </form>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="modal-footer">
                    <div class="forgot login-footer">
                            <span>前往
                                 <a href="javascript: showRegisterForm();">创建一个账号</a>
                            ?</span>
                    </div>
                    <div class="forgot register-footer" style="display:none">
                        <span>已有账号</span>
                        <a href="javascript: showLoginForm();">登录</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
