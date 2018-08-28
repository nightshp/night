<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>地址</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/thems.css">
    <script type="text/javascript">
        function insertAddress() {
            $.ajax({
                url:"${pageContext.request.contextPath}/insertAddress?id=${logUser.userId}",
                data:$("#form1").serialize(),
                type:"POST",
                success:function (data) {
                    if (data == 'ok') {
                        alert("插入成功！");
                        addressHtml();
                    }
                    else {
                        alert("插入失败");
                        addressHtml();
                    }
                },
                error:function () {
                    alert("请求错误");
                    addressHtml();
                }
            });
        }

        function deleteAddress(id) {
            if (confirm('确实要删除该地址吗吗?')) {
                var url = "${pageContext.request.contextPath}/deleteAddress";
                var args = {"id": id};
                $.post(url, args, function (data) {
                    if (data == 'ok') {
                        alert("删除更新成功！");
                        addressHtml();
                    }
                    else {
                        alert("删除失败");
                        addressHtml();
                    }

                });
            }
        }
        function editAddress(id) {
            $.ajax({
                type: "get",
                url: "${pageContext.request.contextPath}/editAddress",
                data: {"id": id},
                success: function (data) {
                    $("#addressid").val(data.addressId);
                    $("#recname").val(data.recName);
                    $("#areaaddress").val(data.areaAddress);
                    $("#detaaddress").val(data.detaAddress);
                    $("#postalcode").val(data.postalcode);
                    $("#phone").val(data.phone);
                }
            });
            $("#updateAddress").modal("show");
        }

        function updateAddress() {

            $.ajax({
                url:"${pageContext.request.contextPath}/updateAddress?id=${logUser.userId}",
                data:$("#form2").serialize(),
                type:"POST",
                success:function (data) {
                    if (data == 'ok') {
                        $("#updateAddress").modal("hide");
                        alert("地址更新成功！");
                        addressHtml();
                    }
                    else {
                        alert("修改失败");
                        addressHtml();
                    }
                },
                error:function () {
                    alert("请求错误");
                    addressHtml();
                }
            });
        }
        function setDefault(userId,addressId) {
            $.ajax({
                url:"${pageContext.request.contextPath}/updateDefault",
                data:{"userId":userId,"addressId":addressId},
                type:"POST",
                success:function (data) {
                    if (data =="ok") {
                        alert("设置成功！");
                        addressHtml();
                    }
                    else {
                        alert("设置失败");
                        addressHtml();
                    }
                },
            error:function () {
                alert("请求错误");
                addressHtml();
            }
            });
        }
    </script>
</head>

<body>
<div class="space_hx">&nbsp;</div>
<div class="scd">
  <div class="user clearfix">
    <div class="u_r" style="float: left;margin-left: 15px;margin-top: -24px">
      <div class="user_m clearfix">
          <div class="address">
              <form  id="form1">
              <ul class="reg ads_a">
            	<li class="clearfix">
                	<span class="title"><em>新增收货地址</em></span>
                </li>
                <li class="clearfix dz">
                	<span class="title">所在地区<em>*</em></span>
                    <div class="li_m">
                    	<select name="province">
                            <option>江西省</option>
                            <option>广东省</option>
                            <option>湖南省</option>
                        </select>
                        <select name="city">
                        	<option>南昌市</option>
                            <option>深圳市</option>
                            <option>长沙市</option>
                        </select>
                        <select name="area">
                            <option>青山湖区</option>
                            <option>龙岗区</option>
                            <option>雨花区</option>
                        </select>
                    </div>
                </li>
                <li class="clearfix xxdz">
                	<span class="title">详细地址<em>*</em></span>
                    <div class="li_m">
                    	<textarea name="deta_address" cols="" rows="" placeholder="建议您如实填写详细的收货地址，例如街道名称，门牌号码，楼层和房间号等信息"></textarea>
                    </div>
                </li>
                <li class="clearfix">
                	<span class="title">邮政编码</span>
                    <div class="li_m">
                    	<input name="postalcode" type="text" placeholder="如您不清楚邮递区号，请填写000000">
                    </div>
                </li>
                <li class="clearfix">
                	<span class="title">收货人姓名<em>*</em></span>
                    <div class="li_m">
                    	<input name="rec_name" type="text" placeholder="长度不超过25个字符">
                    </div>
                </li>
                <li class="clearfix sj">
                	<span class="title">手机号码</span>
                    <div class="li_m">
                    	<input name="phone" type="text"  placeholder="必填">
                    </div>
                </li>
                <li class="clearfix">
                	<span class="title">&nbsp;</span>
                    <div class="li_m">
                    	<input  type="button"class="btn btn-danger btn-default" value="保存" onclick="insertAddress()">
                    </div>
                </li>
            </ul>
              </form>
            <div class="space_hx">&nbsp;</div>
            <table class="ads_b" cellpadding="0" cellspacing="0">
              <tr>
                <th scope="col">收货人</th>
                <th scope="col">所在地区</th>
                <th scope="col">详细地址</th>
                <th scope="col">邮编</th>
                <th scope="col">手机</th>
                <th scope="col">操作</th>
                <th scope="col">&nbsp;</th>
              </tr>
                <c:forEach items="${address}" var="adr" varStatus="status">
                    <tr>
                        <td>${adr.recName}</td>
                        <td>${adr.areaAddress}</td>
                        <td>${adr.detaAddress}</td>
                        <td>${adr.postalcode}</td>
                        <td>${adr.phone}</td>
                        <td><a  onclick="editAddress(${adr.addressId})" style="cursor:pointer">修改</a> | <a  onclick="deleteAddress(${adr.addressId})" style="cursor: pointer">删除</a></td>
                        <c:if test="${adr.isdefault==1}" var="rs">
                            <td><span class="x_mr active">默认地址</span></td>
                        </c:if>
                        <c:if test="${adr.isdefault==0}" var="rs">
                            <td><a class="x_mr active"  style="cursor: pointer" onclick="setDefault(${logUser.userId},${adr.addressId})">设为默认</a></td>
                        </c:if>
                    </tr>
                </c:forEach>
            </table>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="space_hx">&nbsp;</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="updateAddress" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">修改地址信息</h4>
            </div>

            <form id="form2" >
                <div class="modal-body">
                    <table class="table">
                        <tbody style="font-size: 15px">
                        <input type="hidden" name="addressId" id="addressid">
                        <tr>
                            <td>收货人:<input style="border: 0px" type="text" name="recName"  id="recname"  class="form-control"/></td>
                        </tr>
                        <tr>
                            <td>所在地区:<input style="border: 0px" type="text" name="areaAddress"  id="areaaddress"  class="form-control"/></td>
                        </tr>
                        <tr>
                            <td>详细地址:<input style="border: 0px" type="text" name="detaAddress" id="detaaddress"  class="form-control"/></td>
                        </tr>
                        <tr>
                            <td>邮编:<input style="border: 0px" type="text" name="postalcode" id="postalcode"  class="form-control"/></td>
                        </tr>
                        <tr>
                            <td>手机:<input style="border: 0px" type="text" name="phone" id="phone"  class="form-control"/></td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="modal-footer">
                    <button type="reset" class="btn btn-default">重置</button>
                    <input type="button" class="btn btn-success btn-default" value="提交更改" onclick="updateAddress()"/>
                </div>

            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>
