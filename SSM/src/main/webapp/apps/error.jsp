<%--
  Created by IntelliJ IDEA.
  User: Nightwalker
  Date: 2018/8/17
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script language="javascript">
    if(confirm("注册失败，请重写注册")){
        window.location = "${pageContext.request.contextPath}/apps/app/index.jsp";
    }
</script>
</body>
</html>
