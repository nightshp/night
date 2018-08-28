<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="head1.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/thems.css">
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript">
    $(function(){
        $("#my").click(function(){
           userHtml();
        });
        $("#shopcar").click(function(){
            $.ajax({
                type:"GET",
                url:"${pageContext.request.contextPath}/selectShops?userId=${logUser.userId}",
                dataType:"html",
                async:true,
                contentType:"application/json",
                success:function(result){
                    $("#show_myinfo").empty();
                    $("#show_myinfo").html(result);
                }
            });
        });
        $("#repwd").click(function(){
            $.ajax({
                type:"GET",
                url:"${pageContext.request.contextPath}/apps/afterapp/repwd.jsp",
                dataType:"html",
                async:true,
                contentType:"application/json",
                success:function(result){
                    $("#show_myinfo").empty();
                    $("#show_myinfo").html(result);
                }
            });
        });
        $("#book").click(function(){
            bookHtml();
        });
        $("#address").click(function(){
            addressHtml();
        });
    });
    function addressHtml() {
        $.ajax({
            type:"GET",
            url:"${pageContext.request.contextPath}/selectAddresses?id=${logUser.userId}",
            dataType:"html",
            async:true,
            contentType:"application/json",
            success:function(result){
                $("#show_myinfo").empty();
                $("#show_myinfo").html(result);
            }
        });
    }
    function bookHtml() {
        $.ajax({
            type:"GET",
            url:"${pageContext.request.contextPath}/selectOrders?userId=${logUser.userId}",
            dataType:"html",
            async:true,
            contentType:"application/json",
            success:function(result){
                $("#show_myinfo").empty();
                $("#show_myinfo").html(result);
            }
        });
    }
    function userHtml() {
        $.ajax({
            type:"GET",
            url:"${pageContext.request.contextPath}/apps/afterapp/userinfo.jsp",
            dataType:"html",
            async:true,
            contentType:"application/json",
            success:function(result){
                $("#show_myinfo").empty();
                $("#show_myinfo").html(result);
            }
        });
    }
</script>
</head>

<body>
<!--头部-->
<div class="space_hx">&nbsp;</div>
<div class="scd">
    <div class="user clearfix">
    	<div class="u_l">
        	<div class="u_la">
            	<div class="box_h"><span>我的账户</span></div>
                <div class="box_m" style="padding-left: 30px">
                	<img src="/uploads/${logUser.pic}" width="120px" height="120px" class="img-circle"/>
                    <p>&nbsp;&nbsp;用户名：${logUser.userName}</p>
                </div>
            </div>
            <div class="space_hx">&nbsp;</div>
            <div class="u_lb">
            	<div class="box_h"><span>个人中心</span></div>
                <div class="box_m">
                	<ul>
                    	<li><a id="my" style="cursor: pointer;">用户信息</a></li>
                        <li><a id="shopcar" style="cursor: pointer;">我的购物车</a></li>
                        <li><a id="repwd" style="cursor: pointer;">修改密码</a></li>
                        <li><a id="book" style="cursor: pointer;">我的订单</a></li>
                        <li><a id="address" style="cursor: pointer;">收货地址</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div id="show_myinfo" style="float: left; width:953px; margin-left: 18px">

        <div class="u_r">
        	<div class="r_name">完善个人资料</div>
            <div class="user_m clearfix" >
                <form action="${pageContext.request.contextPath}/updateById?id=${logUser.userId}" method="post">
            	<ul class="u_ml">
                	<li class="clearfix">
                    	<span class="title">用户名：</span>
                        <div class="li_m">${logUser.userName}</div>
                    </li>
                    <li class="clearfix">
                    	<span class="title">E-mail：</span>
                        <div class="li_m">
                        	<input name="email" type="text"><i>*</i>
                            <p>(请输入正确的邮箱 带*号为必填项)</p>
                        </div>
                    </li>
                    <li class="clearfix sex">
                    	<span class="title">性 别：</span>
                        <div class="li_m">
                        	<input name="sex" type="radio" value="保密" id="s1" checked>
                            <span><label for="s1">保密</label></span>
                            <input name="sex" type="radio" value="男" id="s2">
                            <span><label for="s2">男</label></span>
                            <input name="sex" type="radio" value="女" id="s3">
                            <span><label for="s3">女</label></span>
                        </div>
                    </li>
                    <li class="clearfix">
                    	<span class="title">电 话：</span>
                        <div class="li_m">
                        	<input name="phone" type="text">
                        </div>
                    </li>
                    <li class="btn"><input type="submit" value="确 定"></li>
                </ul>
                </form>
                <div class="u_mr">
                    <img src="/uploads/${logUser.pic}" width="120px" height="120px" class="img-circle"/>
                        <p>修改头像</p>
                        <p class="f10">(注:头像推荐尺寸为120*120)</p>
                    <form action="${pageContext.request.contextPath}/upload?id=${logUser.userId}" method="post" enctype="multipart/form-data">
                        文件：<input type="file" name="file" />
                        <input type="submit" value="上传"/>
                    </form>
                </div>
            </div>
        </div>
        </div>
    </div>

</div>
<div class="space_hx">&nbsp;</div>
</body>
</html>
