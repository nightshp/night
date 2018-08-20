<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/thems.css">
</head>
<body>
<div class="u_r">
<div class="r_name">用户信息</div>
<div style="margin-top: 50px">
<ul class="list-group" style="font-size: 15px">
    <li class="list-group-item">用户名：${logUser.userName}</li>
    <li class="list-group-item">性别：${logUser.sex}</li>
    <li class="list-group-item">邮箱：${logUser.email}</li>
    <li class="list-group-item">电话：${logUser.phone}</li>
</ul>
    <div style="margin-left: 50px">
        <button type="button" class="btn btn-danger btn-default">修改</button>
    </div>

</div>
</div>
</body>
</html>
