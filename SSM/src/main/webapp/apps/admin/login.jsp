<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
        <title>后台登录</title>
        <link href="${pageContext.request.contextPath}/css/style1.css" rel="stylesheet" type="text/css" />
        <script language="JavaScript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/cloud.js" type="text/javascript"></script>

        <script language="javascript">
            $(function(){
                $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
                $(window).resize(function(){
                    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
                })
            });
        </script>
        <script type="text/javascript">
            function logajax() {
                $.ajax({
                    url:"${pageContext.request.contextPath}/loginAdmin",
                    data:$("#form1").serialize(),
                    type:"POST",
                    success:function (data) {
                        if (data == 'ok') {
                            alert("登录成功");
                            window.location.replace("${pageContext.request.contextPath}/apps/admin/index.jsp");
                        }
                        else {
                            alert("用户名或密码错误");
                        }
                    },
                    error:function () {
                        alert("请求错误");
                    }
                });
            }
        </script>
    </head>

<body style="background-color:#1c77ac; background-image:url(${pageContext.request.contextPath}/images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



<div id="mainBody">
    <div id="cloud1" class="cloud"></div>
    <div id="cloud2" class="cloud"></div>
</div>

<div class="loginbody">
    <div class="loginbox">
        <form id="form1">
            <ul>
                <li><input name="adminName" type="text" class="loginuser" placeholder="用户名" autocomplete="off"/></li>
                <li><input name="adminPassword" type="password" class="loginpwd" placeholder= "密码" /></li>
                <li><input type="button" class="loginbtn" value="登录"  onclick="logajax()"/></li>
            </ul>
        </form>
    </div>
</div>

</body>
</html>
