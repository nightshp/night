<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>地址</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/thems.css">
</head>

<body>
<div class="space_hx">&nbsp;</div>
<div class="scd">
  <div class="user clearfix">
    <div class="u_r" style="float: left;margin-left: 15px;margin-top: -24px">
      <div class="user_m clearfix">
        <div class="address">
          	<ul class="reg ads_a">
            	<li class="clearfix">
                	<span class="title"><em>新增收货地址</em></span>
                    <div class="li_m">电话号码、手机号选填一项,其余均为必填项</div>
                </li>
                <li class="clearfix dz">
                	<span class="title">所在地区<em>*</em></span>
                    <div class="li_m">
                    	<select name="">
                        	<option>中国大陆</option>
                            <option>台湾</option>
                            <option>港澳</option>
                        </select>
                        <select name="" class="chang">
                        	<option>北京市</option>
                            <option>广东省</option>
                            <option>湖南省</option>
                        </select>
                    </div>
                </li>
                <li class="clearfix xxdz">
                	<span class="title">详细地址<em>*</em></span>
                    <div class="li_m">
                    	<textarea name="" cols="" rows="">建议您如实填写详细的收货地址，例如街道名称，门牌号码，楼层和房间号等信息</textarea>
                    </div>
                </li>
                <li class="clearfix">
                	<span class="title">邮政编码</span>
                    <div class="li_m">
                    	<input name="" type="text" placeholder="如您不清楚邮递区号，请填写000000">
                    </div>
                </li>
                <li class="clearfix">
                	<span class="title">收货人姓名<em>*</em></span>
                    <div class="li_m">
                    	<input name="" type="text" placeholder="长度不超过25个字符">
                    </div>
                </li>
                <li class="clearfix sj">
                	<span class="title">手机号码</span>
                    <div class="li_m">
                    	<select name="">
                        	<option>中国大陆 +86</option>
                            <option>香港 +852</option>
                            <option>澳门 +853</option>
                        </select>
                    	<input name="" type="text" placeholder="电话号码、手机号码必须填一项">
                    </div>
                </li>
                <li class="clearfix tel">
                	<span class="title">电话号码</span>
                    <div class="li_m">
                    	<select name="">
                        	<option>中国大陆 +86</option>
                            <option>香港 +852</option>
                            <option>澳门 +853</option>
                        </select>
                    	<input name="" type="text" placeholder="区号">-<input name="" type="text" placeholder="电话号码">-<input name="" type="text" placeholder="分机">
                    </div>
                </li>
                <li class="clearfix mr">
                	<span class="title">&nbsp;</span>
                    <div class="li_m">
                    	<input name="" type="checkbox" value="" id="mr">
                        <label for="mr"><span>设置为默认收货地址</span></label>
                        
                    </div>
                </li>
                <li class="clearfix">
                	<span class="title">&nbsp;</span>
                    <div class="li_m">
                    	<input name="" type="submit" value="保存">
                    </div>
                </li>
            </ul>
            <div class="space_hx">&nbsp;</div>
            <table class="ads_b" cellpadding="0" cellspacing="0">
              <tr>
                <th scope="col">收货人</th>
                <th scope="col">所在地区</th>
                <th scope="col">详细地址</th>
                <th scope="col">邮编</th>
                <th scope="col">电话/手机</th>
                <th scope="col">操作</th>
                <th scope="col">&nbsp;</th>
              </tr>
              <tr>
                <td>黄瓒</td>
                <td>广东省 深圳市 宝安区 新安街道</td>
                <td>宝安25区华丰时代广场5楼B08</td>
                <td>518100</td>
                <td>86-13*******46</td>
                <td><a href="index.html">修改</a> | <a href="index.html">删除</a></td>
                <td><a href="index.html" class="x_mr active">默认地址</a></td>
              </tr>
              <tr>
                <td>黄瓒</td>
                <td>广东省 深圳市 宝安区 新安街道</td>
                <td>宝安25区华丰时代广场5楼B08</td>
                <td>518100</td>
                <td>86-13*******46</td>
                <td><a href="index.html">修改</a> | <a href="index.html">删除</a></td>
                <td><a href="index.html" class="x_mr">默认地址</a></td>
              </tr>
              <tr>
                <td>黄瓒</td>
                <td>广东省 深圳市 宝安区 新安街道</td>
                <td>宝安25区华丰时代广场5楼B08</td>
                <td>518100</td>
                <td>86-13*******46</td>
                <td><a href="index.html">修改</a> | <a href="index.html">删除</a></td>
                <td><a href="index.html" class="x_mr">默认地址</a></td>
              </tr>
              <tr>
                <td>黄瓒</td>
                <td>广东省 深圳市 宝安区 新安街道</td>
                <td>宝安25区华丰时代广场5楼B08</td>
                <td>518100</td>
                <td>86-13*******46</td>
                <td><a href="index.html">修改</a> | <a href="index.html">删除</a></td>
                <td><a href="index.html" class="x_mr">默认地址</a></td>
              </tr>
            </table>

        </div>
      </div>
    </div>
  </div>
</div>
<div class="space_hx">&nbsp;</div>
</body>
</html>
