<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<%--<script type="text/javascript">--%>
<%--function editUser(id) {--%>
	<%--$.ajax({--%>
		<%--type:"get",--%>
		<%--url:"${pageContext.request.contextPath}/edit",--%>
		<%--data:{"id":id},--%>
		<%--success:function(data) {--%>
		    <%--$("#fill").show();--%>
			<%--$("#myform").show();--%>
			<%--$("#id").val(data.id);--%>
			<%--$("#username").val(data.username);--%>
			<%--$("#age").val(data.age);--%>
			<%--$("#password").val(data.password);--%>
			<%--$("#sex").val(data.sex);--%>
		<%--}--%>
	<%--});--%>
<%--}--%>
<%--function updateUser(form) {--%>
	<%--$.post("${pageContext.request.contextPath}/update",$(form).serialize(),function(data){--%>
		<%--if(data=='ok'){--%>
			<%--alert("客户更新成功！");--%>
			<%--window.location.reload();--%>
		<%--}--%>
		<%--else{--%>
			<%--alert("修改失败");--%>
		<%--}--%>
	<%--});--%>
<%--}--%>

<%--function deleteUser(id) {--%>
	<%--if(confirm('确实要删除该客户吗?')) {--%>
		<%--var url="${pageContext.request.contextPath}/delete";--%>
		<%--var args={"id":id};--%>
		<%--$.post(url,args,function(data){--%>
			<%--if(data=='ok'){--%>
				<%--alert("客户删除更新成功！");--%>
				<%--window.location.reload();--%>
			<%--}--%>
			<%--else{--%>
				<%--alert("删除失败");--%>
			<%--}--%>
			<%----%>
		<%--});--%>
	<%--}--%>
<%--}--%>

</head>
<body>
	<table border="1">
		<tr>
			<td>userId</td>
			<td>userName</td>
			<td>userPwd</td>
			<td>email</td>
			<td>phone</td>
			<td>sex</td>
			<td>操作二</td>
		</tr>
		<c:forEach items="${requestScope.list}" var="user">
			<tr>
				<td>${user.userId}</td>
				<td>${user.userName }</td>
				<td>${user.userPwd }</td>
				<td>${user.email }</td>
				<td>${user.phone }</td>
				<td>${user.sex }</td>
				<%--<td><a href="#" onclick="deleteUser(${user.id})">删除</a></td>--%>
				<%--<td><a href="#" onclick="editUser(${user.id})">修改</a></td>--%>
			</tr>
		</c:forEach>
	</table>
	<%--<div id="fill" style="width: 100%; height: 100%; background-color: #000; position: absolute; top: 0px; left: 0px; opacity: 0.3; display: none; z-index: 100"></div>--%>
	<%--<div id="myform"--%>
		<%--style="width: 100%; height: 100%; position: absolute; top: 0px; left: 0px; z-index: 101; display: none">--%>
		<%--<form action="" method="post" onsubmit="return updateUser(this) " id="form1">--%>
			<%--<table width="340" border="0"--%>
				<%--style="margin: 20% auto; background-color: #fff">--%>
				<%--<tr>--%>
				<%--<td><input type="text" name="id"  id="id" readonly="readonly" /></td>--%>
				<%--</tr>--%>
				<%--<tr>--%>
				<%--<td><input type="text" name="username"  id="username"/></td>--%>
				<%--</tr>--%>
				<%--<tr>--%>
				<%--<td><input type="text" name="age" id="age" /></td>--%>
				<%--</tr>--%>
				<%--<tr>--%>
					<%--<td><input type="text" name="password" id="password" /></td>--%>
				<%--</tr>--%>
				<%--<tr>--%>
					<%--<td><input type="text" name="sex" id="sex" /></td>--%>
				<%--</tr>--%>
				<%--<tr>--%>
					<%--<td></td>--%>
					<%--<td><input type="submit" value="保存修改"  /> <input type="reset"--%>
						<%--value="重置" /></td>--%>
				<%--</tr>--%>
			<%--</table>--%>
		<%--</form>--%>
</body>
</html>