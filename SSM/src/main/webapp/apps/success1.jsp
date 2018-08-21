<%--
  Created by IntelliJ IDEA.
  User: Nightwalker
  Date: 2018/8/19
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script language="javascript">
    if(confirm("上传成功")){
        window.location = "${pageContext.request.contextPath}/apps/afterapp/user.jsp";
    }
</script>
</body>
</html>