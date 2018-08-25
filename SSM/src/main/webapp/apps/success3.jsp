<%--
  Created by IntelliJ IDEA.
  User: Nightwalker
  Date: 2018/8/25
  Time: 13:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script language="javascript">
    if(confirm("添加成功")){
        window.location = "${pageContext.request.contextPath}/apps/admin/index.jsp";
    }
</script>
</body>
</html>
