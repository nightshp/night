<%--
  Created by IntelliJ IDEA.
  User: Nightwalker
  Date: 2018/8/19
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/upload" method="post" enctype="multipart/form-data">
    文件：<input type="file" name="file" />
    <input type="submit" value="上传"/>
</form>
</body>
</html>
