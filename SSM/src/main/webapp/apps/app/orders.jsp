<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>餐厅细节</title>
</head>
<body>
<!-- about -->
<div class="orders">
	<div class="container">
		<c:forEach items="${pageinfo.list}" var="menu">
			<div class="order-top">
				<li class="data">
					<img src="/uploads/${menu.dishPic}" style="width: 300px;height: 200px">
				</li>
				<li class="data">
					<h4>${menu.dishName}</h4>
					<P>类别:${menu.dishClass}</P>
					<p>描述:${menu.dishDiscribe}</p>
				</li>
				<li class="rdata">
					<div class="special-info grid_1 simpleCart_shelfItem">
						<h4>价格</h4>
						<div class="pre-top">
							<div class="pr-left">
								<div class="item_add"><span><h6>${menu.dishPric}&yen;</h6></span></div>
							</div>

							<div class="clearfix"></div>
						</div>
						<div class="pr-right">
							<div ><span style="width: 100px"><a onclick="openLoginModal()" style="cursor: pointer">加入餐车</a></span></div>
						</div>
					</div>
				</li>
				<div class="clearfix"></div>
			</div>
		</c:forEach>
	</div>
	<div class="row">
		<!-- 分页条信息 -->
		<div style="text-align:center">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a href="${pageContext.request.contextPath}/selectByResId?pn=1&restaurId=${restaurId}">首页</a></li>
					<c:if test="${pageinfo.hasPreviousPage}">
						<li><a href="${pageContext.request.contextPath}/selectByResId?pn=${pageinfo.pageNum-1}&&restaurId=${restaurId}"
							   aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>


					<c:forEach items="${pageinfo.navigatepageNums}" var="page_Num">
						<c:if test="${page_Num == pageinfo.pageNum}">
							<li class="active"><a href="#">${page_Num}</a></li>
						</c:if>
						<c:if test="${page_Num != pageinfo.pageNum}">
							<li><a href="${pageContext.request.contextPath}/selectByResId?pn=${page_Num}&&restaurId=${restaurId}">${page_Num}</a></li>
						</c:if>

					</c:forEach>
					<c:if test="${pageinfo.hasNextPage}">
						<li><a href="${pageContext.request.contextPath}/selectByResId?pn=${pageinfo.pageNum+1}&&restaurId=${restaurId}"
							   aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<li><a href="${pageContext.request.contextPath}/selectByResId?pn=${pageinfo.pages}&&restaurId=${restaurId}">末页</a></li>
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