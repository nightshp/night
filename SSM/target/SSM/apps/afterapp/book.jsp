<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>留言</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/thems.css">

</head>

<body>
<div class="space_hx">&nbsp;</div>
<div class="scd">
    <div class="user clearfix">
        <div class="u_r" style="float: left;margin-left: 15px;margin-top: -24px">
            <div class="user_m clearfix">
            	<ul class="u_ml book">
                	<li class="clearfix sex">
                    	<span class="title">留言类型：</span>
                        <div class="li_m">
                        	<input name="ly" type="radio" value="" id="s1" checked>
                            <span><label for="s1">留言</label></span>
                            <input name="ly" type="radio" value="" id="s2">
                            <span><label for="s2">投诉</label></span>
                            <input name="ly" type="radio" value="" id="s3">
                            <span><label for="s3">售后</label></span>
                            <input name="ly" type="radio" value="" id="s4">
                            <span><label for="s4">求购</label></span>
                        </div>
                    </li>
                    <li class="clearfix">
                    	<span class="title">标题：</span>
                        <div class="li_m">
                        	<input name="" type="text"><i>*</i>
                        </div>
                    </li>
                    <li class="clearfix">
                    	<span class="title">联系人：</span>
                        <div class="li_m">
                        	<input name="" type="text"><i>*</i>
                        </div>
                    </li>
                    <li class="clearfix">
                    	<span class="title">E-mail：</span>
                        <div class="li_m">
                        	<input name="" type="text"><i>*</i>
                        </div>
                    </li>
                    <li class="clearfix">
                    	<span class="title">单位名称：</span>
                        <div class="li_m">
                        	<input name="" type="text">
                        </div>
                    </li>
                    <li class="clearfix">
                    	<span class="title">主页：</span>
                        <div class="li_m">
                        	<input name="" type="text">
                        </div>
                    </li>
                    <li class="clearfix">
                    	<span class="title">电话：</span>
                        <div class="li_m">
                        	<input name="" type="text">
                        </div>
                    </li>
                    <li class="clearfix">
                    	<span class="title">传真：</span>
                        <div class="li_m">
                        	<input name="" type="text">
                        </div>
                    </li>
                    <li class="clearfix">
                    	<span class="title">内容：</span>
                        <div class="li_m">
                        	<textarea name="" cols="" rows=""></textarea>
                            <i>*</i>
                        </div>
                    </li>
                    <li class="clearfix">
                    	<span class="title">&nbsp;</span>
                        <div class="li_m">
                        	<i class="f14">注：带*为必填项！</i>
                        </div>
                    </li>
                    <li class="btn"><input name="" type="submit" value="提交"></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="space_hx">&nbsp;</div>
</body>
</html>
