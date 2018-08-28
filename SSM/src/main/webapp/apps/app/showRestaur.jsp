<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>搜索到的餐厅</title>
</head>
<body>
<!-- header -->
<!-- banner -->
<div class="banner">
    <div class="container">
        <div class="b_room">
            <div class="booking_room"><br />
                <div class="reservation">
                    <div class="book-top">
                        <div class="b-search">
                            <div class="boo-lef">
                                <i class="sear"></i>
                                <p>Search</p>
                            </div>
                        </div>
                        <div class="pick">
                            <div class="boo-lef">
                                <i class="sele"></i>
                                <p>Pick</p>
                            </div>
                        </div>
                        <div class="delv">
                            <div class="boo-lef">
                                <i class="ca-r"></i>
                                <p>Delivered</p>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <form action="${pageContext.request.contextPath}/selectByNA" method="post">
                        <ul>
                            <li class="span1_of_1">
                                <!----------start section_room----------->
                                <input name="restaurName"type="text" class="textbox" value="餐厅名字" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '餐厅名字';}">
                            </li>
                            <li class="span1_of_1">
                                <!----------start section_room----------->
                                <div class="section_room">
                                    <select name="restaurAddress" onChange="change_country(this.value)" class="frm-field required">
                                        <option>安州区</option>
                                        <option>文苑路</option>
                                        <option>辽宁大道</option>
                                        <option>园艺山</option>
                                        <option>涪城区</option>
                                    </select>
                                </div>
                            </li>
                            <li class="span1_of_3">
                                <div class="date_btn">
                                    <form>
                                        <input type="submit" value="搜索">
                                    </form>
                                </div>
                            </li>
                            <div class="clearfix"></div>
                        </ul>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- banner -->
<!-- latis -->
<div class="latis">
    <div class="container">
        <c:forEach items="${resatuar}" var="res">
            <div class="col-md-4 latis-left">
                <h3>${res.restaurName}</h3>
                <a  href="${pageContext.request.contextPath}/selectByResId?restaurId=${res.restaurId}"><img src="/uploads/${res.restaurPic}" class="img-responsive" style="height: 280px"></a>
                <div class="special-info grid_1 simpleCart_shelfItem">
                    <div style="height: 60px">
                        <p>地址:${res.restaurAddress}</p>
                        <p>环境:${res.restaurDescribe}</p>
                        <p>电话:${res.phone}</p>
                        <p>配送范围:${res.restaurRange}</p>
                        <p>配送费:${res.fee}&yen;</p>
                    </div>
                    <div class="cur">
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>