<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>首页</title>
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
									<input class="btn-danger btn-lg"type="submit" value="搜索">
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
		<c:forEach items="${pageinfo.list}" var="menu">
			<div class="col-md-4 latis-left">
				<h3>${menu.dishName}</h3>
				<img src="/uploads/${menu.dishPic}" class="img-responsive" style="height: 280px">
				<div class="special-info grid_1 simpleCart_shelfItem">
					<div style="height: 60px"><p>${menu.dishDiscribe}</p></div>
					<div class="cur">
						<div class="cur-left">
							<div class="item_add"><span class="item_price"><a class="morebtn hvr-rectangle-in" href="#">加入餐车</a></span></div>
						</div>
						<div class="cur-right">
							<div class="item_add"><span class="item_price"><h6>${menu.dishPric}&yen;</h6></span></div>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<div class="row">
		<!-- 分页条信息 -->
		<div style="text-align:center">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a href="${pageContext.request.contextPath}/selectAllMenu?pn=1">首页</a></li>
					<c:if test="${pageinfo.hasPreviousPage}">
						<li><a href="${pageContext.request.contextPath}/selectAllMenu?pn=${pageinfo.pageNum-1}"
							   aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<c:forEach items="${pageinfo.navigatepageNums}" var="page_Num">
						<c:if test="${page_Num == pageinfo.pageNum}">
							<li class="active"><a href="#">${page_Num}</a></li>
						</c:if>
						<c:if test="${page_Num != pageinfo.pageNum}">
							<li><a href="${pageContext.request.contextPath}/selectAllMenu?pn=${page_Num}">${page_Num}</a></li>
						</c:if>

					</c:forEach>
					<c:if test="${pageinfo.hasNextPage}">
						<li><a href="${pageContext.request.contextPath}/selectAllMenu?pn=${pageinfo.pageNum+1}"
							   aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<li><a href="${pageContext.request.contextPath}/selectAllMenu?pn=${pageinfo.pages}">末页</a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>
<!-- latis -->
<!-- feature -->
<div class="feature">
	<div class="container">
		<div class="fle-xsel">
			<ul id="flexiselDemo3">
				<li>

					<img src="${pageContext.request.contextPath}/images/1p.jpg" class="img-responsive" alt="">

				</li>
				<li>

					<img src="${pageContext.request.contextPath}/images/2p.jpg" class="img-responsive" alt="">

				</li>
				<li>

					<img src="${pageContext.request.contextPath}/images/3p.png" class="img-responsive" alt="">

				</li>
				<li>

					<img src="${pageContext.request.contextPath}/images/4p.jpg" class="img-responsive" alt="">


				</li>
				<li>

					<img src="${pageContext.request.contextPath}/images/5p.jpg" class="img-responsive" alt="">

				</li>
				<li>

					<img src="${pageContext.request.contextPath}/images/6p.jpg" class="img-responsive" alt="">

				</li>
				<li>

					<img src="${pageContext.request.contextPath}/images/7p.jpg" class="img-responsive" alt="">

				</li>
				<li>

					<img src="${pageContext.request.contextPath}/images/8p.jpg" class="img-responsive" alt="">

				</li>

			</ul>

			<script type="text/javascript">
                $(window).load(function() {

                    $("#flexiselDemo3").flexisel({
                        visibleItems: 8,
                        animationSpeed: 1000,
                        autoPlay: true,
                        autoPlaySpeed: 3000,
                        pauseOnHover: true,
                        enableResponsiveBreakpoints: true,
                        responsiveBreakpoints: {
                            portrait: {
                                changePoint:480,
                                visibleItems: 2
                            },
                            landscape: {
                                changePoint:640,
                                visibleItems: 3
                            },
                            tablet: {
                                changePoint:768,
                                visibleItems: 3
                            }
                        }
                    });

                });
			</script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.flexisel.js"></script>
			<div class="clearfix"> </div>

		</div>
	</div>
</div>
<!-- feature -->
<!-- magnust -->
<div class="magnust">
	<div class="container">
		<h3>Nascetur ridiculus mus</h3>
		<div class="col-md-4 magnust-top">

			<div class="magnust-left">
				<img src="${pageContext.request.contextPath}/images/9b.jpg" class="img-responsive" alt="">
			</div>
			<div class="magnust-right">
				<h4><a href="#">Cites of the</a></h4>
				<p> Lorem Ipsum passage, and going through the cites of the undoubtable source. Lorem sections</p>
				<a class="see" href="#">See More</a>
			</div>
			<div class="clearfix"> </div>
		</div>
		<div class="col-md-4 magnust-top">
			<div class="magnust-left">
				<img src="${pageContext.request.contextPath}/images/8b.jpg" class="img-responsive" alt="">
			</div>
			<div class="magnust-right">
				<h4><a href="#">Lorem Ipsum</a></h4>
				<p> Lorem Ipsum passage, and going through the cites of the undoubtable source. Lorem sections</p>
				<a class="see" href="#">See More</a>
			</div>
			<div class="clearfix"> </div>
		</div>
		<div class="col-md-4 magnust-top">
			<div class="magnust-left">
				<img src="${pageContext.request.contextPath}/images/10b.jpg" class="img-responsive" alt="">
			</div>
			<div class="magnust-right">
				<h4><a href="#">Will uncove</a></h4>
				<p> Lorem Ipsum passage, and going through the cites of the undoubtable source. Lorem sections</p>
				<a class="see" href="#">See More</a>
			</div>
			<div class="clearfix"> </div>
		</div>
		<div class="clearfix"> </div>
	</div>
</div>
<!-- magnust -->
<!-- footer-->
<!-- footer-->
</body>
</html>