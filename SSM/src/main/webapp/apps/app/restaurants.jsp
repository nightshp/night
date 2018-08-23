<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>餐厅</title>
</head>
<body>
<!-- about -->
<div class="orders">
	<div class="container">
		<c:forEach items="${pageinfo.list}" var="res">
			<div class="order-top">
				<li ><a href="#"><img src="/uploads/${res.restaurPic}" class="img-responsive" style="width: 300px;height: 200px"></a></li>
				<li>&nbsp;&nbsp;&nbsp;</li>
				<li><h4>${res.restaurName}</h4>
					<p>地址:${res.restaurAddress}</p>
					<P>电话:${res.phone}</P>
					<p>送餐范围:${res.restaurRange}</p>
					<P>餐厅环境:${res.restaurDescribe}</P>
					<P>配送费:${res.fee}&yen;</P>
				</li>
				<li class="bt-nn">
					<a class="morebtn hvr-rectangle-in" href="${pageContext.request.contextPath}/selectByResId?restaurId=${res.restaurId}">进入</a>
				</li>
				<div class="clearfix"></div>
			</div>
		</c:forEach>
	</div>
	<!-- 显示分页信息 -->
	<div class="row">
		<!-- 分页条信息 -->
		<div style="text-align:center">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a href="${pageContext.request.contextPath}/selectRes?pn=1">首页</a></li>
					<c:if test="${pageinfo.hasPreviousPage}">
						<li><a href="${pageContext.request.contextPath}/selectRes?pn=${pageinfo.pageNum-1}"
							   aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>


					<c:forEach items="${pageinfo.navigatepageNums}" var="page_Num">
						<c:if test="${page_Num == pageinfo.pageNum}">
							<li class="active"><a href="#">${page_Num}</a></li>
						</c:if>
						<c:if test="${page_Num != pageinfo.pageNum}">
							<li><a href="${pageContext.request.contextPath}/selectRes?pn=${page_Num}">${page_Num}</a></li>
						</c:if>

					</c:forEach>
					<c:if test="${pageinfo.hasNextPage}">
						<li><a href="${pageContext.request.contextPath}/selectRes?pn=${pageinfo.pageNum+1}"
							   aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<li><a href="${pageContext.request.contextPath}/selectRes?pn=${pageinfo.pages}">末页</a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>
<!-- about -->
<!-- footer-->
<!-- footer-->
</body>
</html>