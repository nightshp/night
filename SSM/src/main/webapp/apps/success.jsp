
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script language="javascript">
    if(confirm("注册成功，请前往登录")){
        window.location = "${pageContext.request.contextPath}/apps/app/index.jsp";
    }
</script>
</body>
</html>
