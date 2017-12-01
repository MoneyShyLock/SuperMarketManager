<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统登录 - 超市账单管理系统</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>

<script type="text/javascript">
$(function(){
	$("#myform").submit(function(e){
		var username=$("#username").val();
		var password=$("#password").val();
		var flag1=false;
		var flag2=false;
		
		if(username==null||username==""){
			$("#sp1").html("用户名不能为空");
		}else{
			$("#sp1").html("");
			flag1 = true;
		}
		if(password==null||password==""){
			$("#sp2").html("密码不能为空");
		}else{
			$("#sp2").html("");
			flag2 = true;
		}
		//阻止表单提交
		e.preventDefault();
		if(flag1&flag2){
			var data={
					"user.username":username,
					"user.password":password
			}
			$.ajax({
				url:"${pageContext.request.contextPath}/login.action",
				data:data,
				dataType:"json",
				type:"post",
				success:function(info){
					var mes=info.msg;
					if(mes==0){
						$("#sp1").html("用户名不能为空");
					}
					if(mes==1){
						$("#sp2").html("密码不能为空");
					}
					if(mes==2){
						$("#sp1").html("用户名或密码错误");
					}
					if(mes==3){
						location.href("index.jsp");
					}
				},
				error:function(){
					alert("error")
				}
			});
		}	
	});
})
		
	</script>	
</head>
<body class="blue-style">
	
	
	
	<div id="login">
		<div class="icon"></div>
		<div class="login-box">
			<form method="post" id="myform">
				<dl>
					<dt>用户名：</dt>
					<dd>
						<input type="text" name="user.username" class="input-text" id="username"/>
						<span id="sp1"></span>
					</dd>
					<dt>密 码：</dt>
					<dd>
						<input type="password" name="user.passWord" class="input-text" id="password" />
						<span id="sp2"></span>
					</dd>
				</dl>
				<div class="buttons">
					<input type="submit" name="submit" value="登录系统"
						class="input-button" /> <input type="reset" name="reset"
						value="重　　填" class="input-button" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>