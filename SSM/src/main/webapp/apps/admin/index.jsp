<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>后台主界面</title>
    <meta charset="utf-8">
    <title>Retina Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">
        function showOrder(page){
        $.ajax({
            type:"GET",
            url:"${pageContext.request.contextPath}/selectall",
            data:{"page":page},
            dataType:"html",
            async:true,
            contentType:"application/json",
            success:function(result){
                $("#show_myinfo").empty();
                $("#show_myinfo").html(result);
            }
        });
        }

        function showRestaur(page){
            $.ajax({
                type:"GET",
                url:"${pageContext.request.contextPath}/restaurManager",
                data:{"page":page},
                dataType:"html",
                async:true,
                contentType:"application/json",
                success:function(result){
                    $("#show_myinfo").empty();
                    $("#show_myinfo").html(result);
                }
            });
        }
        function showDish(page) {
            $.ajax({
                type:"GET",
                url:"${pageContext.request.contextPath}/selectAllDish",
                data:{"page":page},
                dataType:"html",
                async:true,
                contentType:"application/json",
                success:function(result){
                    $("#show_myinfo").empty();
                    $("#show_myinfo").html(result);
                }
            });
        }

        function showUser(page){
            $.ajax({
                type:"GET",
                url:"${pageContext.request.contextPath}/getAll",
                data:{"page":page},
                dataType:"html",
                async:true,
                contentType:"application/json",
                success:function(result){
                    $("#show_myinfo").empty();
                    $("#show_myinfo").html(result);
                }
            });
        }
        $(function () {
            $("#user").click(function () {
                showUser(1);
            });
            $("#order").click(function () {
                showOrder(1);
            });
            $("#restaur").click(function () {
                showRestaur(1);
            });
            $("#dish").click(function () {
                showDish(1);
            });

        });
        <!--搜索功能-->
        function showSelectRestaur(key) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/selectByMany",
                data:{"key":key},
                dataType: "html",
                async: true,
                contentType: "application/json",
                success: function (result) {
                    $("#show_myinfo").empty();
                    $("#show_myinfo").html(result);
                }
            });
        }
        function showSelectOrder(id){
            $.ajax({
                type:"GET",
                url:"${pageContext.request.contextPath}/selectByUser",
                data:{"userId":id},
                dataType:"html",
                async:true,
                contentType:"application/json",
                success:function(result){
                    $("#show_myinfo").empty();
                    $("#show_myinfo").html(result);
                }
            });
        }
        function showSelectUser(userName){
            $.ajax({
                type:"GET",
                url:"${pageContext.request.contextPath}/selectByKey",
                data:{"userName":userName},
                dataType:"html",
                async:true,
                contentType:"application/json",
                success:function(result){
                    $("#show_myinfo").empty();
                    $("#show_myinfo").html(result);
                }
            });
        }
        function showSelectDish(key){
            $.ajax({
                type:"GET",
                url:"${pageContext.request.contextPath}/selectByNaCl",
                data:{"key":key},
                dataType:"html",
                async:true,
                contentType:"application/json",
                success:function(result){
                    $("#show_myinfo").empty();
                    $("#show_myinfo").html(result);
                }
            });
        }


    </script>
</head>
<body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
              <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#"><i>外卖后台管理</i></a><!---方log的地方-->
                  </div>
                  <div style="position: absolute;top: 15px;right: 100px;color: white">
                         欢迎回来:${admin.adminName}
                  </div>

              <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                      <ul class="nav navbar-nav">
                            <li><a id="restaur" style="cursor: pointer">餐厅管理</a></li>
                            <li><a id="order" style="cursor: pointer">订单管理</a></li>
                            <li><a id="user" style="cursor: pointer">用户管理</a></li>
                            <li><a id="dish" style="cursor: pointer">菜肴管理</a></li>
                      </ul>

                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="${pageContext.request.contextPath}/logoutAdmin">退出</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
               </div><!-- /.container-fluid -->
        </nav>
        
        <div id="show_myinfo" style="margin-top: 50px;">
            <img src="${pageContext.request.contextPath}/images/20.png" style="height: 580px;width: 1275px;">
        </div>

</body>
</html>