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
        $("#updateInfo").modal("show");
    }

    function updateUser() {
        $.ajax({
            url:"${pageContext.request.contextPath}/update",
            data:$("#form1").serialize(),
            type:"POST",
            success:function (data) {
                if (data == 'ok') {
                    $("#updateInfo").modal("hide");
                    alert("用户更新成功");
                    userHtml();
                }
                else {
                    alert("修改失败");
                }
            },
            error:function () {
                alert("请求错误");
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
            <button class="btn btn-danger btn-default"  onclick="editUser(${logUser.userId})">修改</button>
    </div>
</div>
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="updateInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">修改个人信息</h4>
            </div>
            <form id="form1">
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
                <input type="button" class="btn btn-success btn-default" value="提交更改" onclick="updateUser()"/>
            </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>
