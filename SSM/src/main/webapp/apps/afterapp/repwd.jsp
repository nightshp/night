<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改密码</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/thems.css">
<script type="text/javascript">
    function updateUser(form) {
        $.post("${pageContext.request.contextPath}/editPwd?id=${logUser.userId}", $(form).serialize(), function (data) {
            if (data == 'ok') {
                alert("密码修改成功！");
                setTimeout(function () {
                    window.location.reload();
                }, 3000);
            }
            else {
                alert("修改失败");
            }
        });
    }
    function checkPwd(){
        var pwd=document.getElementById("pwd").value;
        var pwd1=document.getElementById("pwd1").value;
        var promat1=document.getElementById("promat1");
        if(pwd!=pwd1){
            promat1.innerHTML="两次密码不一致";
            return false;
        }else{
            promat1.innerHTML="";
            return true;
        }
    }
</script>
</head>

<body>

<div class="space_hx">&nbsp;</div>
<form method="post" onsubmit="return updateUser(this)" id="form1">
<div class="scd">
        <div class="u_r" style="float: left;margin-left: 15px;margin-top: -24px">
            <div class="user_m clearfix">
            	<ul class="u_ml book">
                    <li class="clearfix">
                    	<span class="title">当前登录密码：</span>
                        <div class="li_m">
                        	<input name="" type="password">
                        </div>
                    </li>
                    <li class="clearfix">
                    	<span class="title" >新的登录密码：</span>
                        <div class="li_m">
                        	<input id="pwd" name="pwd" type="password">
                        </div>
                    </li>
                    <li class="clearfix">
                    	<span class="title">确认新的登录密码：</span>
                        <div class="li_m">
                        	<input id="pwd1" type="password" onblur="checkPwd()">
                        </div>
                        <div id="promat1" style="display: inline;color: #8C1919"></div>
                    </li>
                    <li class="btn"><input  type="submit" value="确 定"></li>
                </ul>
            </div>
        </div>
    </div>
</form>
<div class="space_hx">&nbsp;</div>
</body>
</html>
