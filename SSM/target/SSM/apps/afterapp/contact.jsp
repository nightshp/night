<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@include file="head1.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>联系我们</title>
</head>
<!-- header -->
<!-- contact -->
	<div class="contact">
	 <div class="container">
		  <div class="contact-head">
			 <h3>联系我们</h3>
		  </div>
		  <div class="contact-grid">
			 <form>
				 <input type="text" placeholder="Name" required/>
				 <input type="text" placeholder="E-mail" required/>
				 <input type="text" placeholder="Phone" required/>
				 <input type="text" placeholder="City Name" required/>
				 <textarea placeholder="Message"></textarea>
				 <input type="submit" value="发送"/>
			 </form>
		  </div>
		  <div class="contact-details">
			  <div class="col-md-6 contact-map">
				 <h4>找到我们</h4>
				 <img src="${pageContext.request.contextPath}/images/timg.jpg" width="500px" height="300px">
			  </div>
			  <div class="col-md-6 company_address">		 
					<h4>地址</h4>
					<p>深圳市江汉区发展大道</p>
					<p>164号科技大厦</p>
					<p>中国</p>
					<p>电话:(00) 222 666 444</p>
					<p>传真: (000) 000 00 00 0</p>
					<p>邮件: <a href="mailto:info@example.com">info@mycompany.com</a></p>
			 </div>
			  <div class="clearfix"></div>
	     </div>		 
	 </div>
</div>
<!-- contact -->
</body>
</html>