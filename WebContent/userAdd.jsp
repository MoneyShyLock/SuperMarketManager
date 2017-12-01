<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		//用户名失去焦距查询
		$("#username")
				.blur(
						function() {
							var value = $("#username").val();
							var flag1 = false;
							if (value == null || value == "") {
								$("#sp").html("用户名不能为空");
							} else {
								$("#sp").html("");
								flag1 = true;
							}
							if (flag1) {
								$
										.ajax({
											url : "${pageContext.request.contextPath}/findUserName.action",
											data : {
												"user.username" : value
											},
											dataType : "json",
											type : "post",
											success : function(data) {
												var info = data.msg;
												if (info == "0") {//可以注册
													$("#sp").html("用户名可以注册");
												} else {
													$("#sp").html("用户名不可使用");
												}
											},
											error : function() {
												alert("error");
											}
										});

							}
						})
	})
	function checkit() {
		//判断是否是数字的正则表达式
		return true;
	}
</script>
</head>
<body>
	<div class="main">
		<div class="optitle clearfix">
			<div class="title">用户管理&gt;&gt;</div>

		</div>
		<form id="form1" name="form1" method="post" action="regist"
			onsubmit="return checkit();">
			<input type="hidden" name="flag" value="doAdd">
			<div class="content">
				<table class="box">
					<font color="red"></font>
					<tr>
						<td class="field">用户名称：</td>
						<td><input type="text" name="user.username" class="text"
							id="username" /> <font color="red">*</font><span id="sp"></span></td>
					</tr>
					<tr>
						<td class="field">用户密码：</td>

						<td><input type="password" name="user.password" class="text"
							id="textfield2" /> <font color="red">*</font></td>
					</tr>
					<tr>
						<td class="field">确认密码：</td>
						<td><input type="password" name="password1" class="text" />
							<font color="red">*</font></td>
					</tr>

					<tr>
						<td class="field">用户性别：</td>
						<td><select name="user.gender" id="select">
								<option value="0">女</option>
								<option value="1">男</option>
						</select></td>
					</tr>

					<tr>
						<td class="field">用户年龄：</td>
						<td><input type="text" name="user.age" class="text"
							id="textfield2" /> <font color="red">*</font></td>
					</tr>
					<tr>
						<td class="field">用户电话：</td>
						<td><input type="text" name="user.phone" class="text"
							id="textfield2" /> <font color="red">*</font></td>

					</tr>
					<tr>
						<td class="field">用户权限：</td>

						<td><input type="radio" name="user.isadmin" id="auth"
							value="0" checked="checked" />普通用户 <input type="radio"
							name="user.isadmin" id="auth" value="1" />经理</td>
					</tr>
				</table>
			</div>
			<div class="buttons">
				<input type="submit" name="button" id="button" value="数据提交"
					class="input-button" /> <input type="button" name="button"
					id="button" onclick="window.location='user.do';" value="返回"
					class="input-button" />
			</div>

		</form>
	</div>
</body>
</html>