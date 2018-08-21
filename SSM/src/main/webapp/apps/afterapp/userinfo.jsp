<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/thems.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script type="text/javascript">
    function editUser(id) {
        $.ajax({
            type: "get",
            url: "${pageContext.request.contextPath}/edit",
            data: {"id": id},
            success: function (data) {
                // $("#fill").show();
                // $("#myform").show();
                $("#id").val(data.userId);
                $("#username").val(data.userName);
                $("#password").val(data.userPwd);
                $("#sex").val(data.sex);
                $("#email").val(data.email);
                $("#phone").val(data.phone);
            }
        });
    }

    function updateUser(form) {
        $.post("${pageContext.request.contextPath}/update", $(form).serialize(), function (data) {
            if (data == 'ok') {
                alert("用户更新成功！");
                setTimeout(function () {
                    window.location.reload();
                }, 3000);
            }
            else {
                alert("修改失败");
            }
        });
    }
    </script>
</head>
<body>
<div class="u_r">
<div class="r_name">用户信息</div>
<div style="margin-top: 50px">
<ul class="list-group" style="font-size: 15px">
    <li class="list-group-item">用户名：${logUser.userName}</li>
    <li class="list-group-item">密码：${logUser.userPwd}</li>
    <li class="list-group-item">性别：${logUser.sex}</li>
    <li class="list-group-item">邮箱：${logUser.email}</li>
    <li class="list-group-item">电话：${logUser.phone}</li>
</ul>
    <div style="margin-left: 50px">
            <button class="btn btn-danger btn-default" data-toggle="modal" data-target="#myModal" onclick="editUser(${logUser.userId})">修改</button>
    </div>
</div>
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">修改个人信息</h4>
            </div>
            <form method="post" onsubmit="return updateUser(this)" id="form1">
            <div class="modal-body">
                <table class="table">
                    <tbody style="font-size: 15px">
                    <tr>
                        <td>ID：<input style="border: 0px;" type="text" name="userId"  id="id" readonly="readonly" /></td>
                    </tr>
                    <tr>
                        <td>用户名:<input style="border: 0px" type="text" name="userName"  id="username"/></td>
                    </tr>
                    <tr>
                        <td>密码:<input style="border: 0px" type="text" name="userPwd"  id="password"/></td>
                    </tr>
                    <tr>
                        <td>性别:<input style="border: 0px" type="text" name="sex" id="sex" /></td>
                    </tr>
                    <tr>
                        <td>邮箱:<input style="border: 0px" type="text" name="email" id="email" /></td>
                    </tr>
                    <tr>
                        <td>电话:<input style="border: 0px" type="text" name="phone" id="phone" /></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="reset" class="btn btn-default">重置</button>
                <button type="submit" class="btn btn-success btn-default">提交更改</button>
            </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>
