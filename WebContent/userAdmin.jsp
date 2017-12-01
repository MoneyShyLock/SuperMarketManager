<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/style.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>

<script type="text/javascript">
	$(function() {
		//初始化界面
		init();
	})
	
	//显示所有用户
	function init(){
		$.ajax({
			url : "${pageContext.request.contextPath}/showAllUser.action",
			dataType : "json",
			type : "post",
			success : function(info) {
				var str = "";
				var listUser = info.list;

				for (var i = 0; i < listUser.length; i++) {
					str += "<tr>"
							str += "<td><span class=\"STYLE1\"><a href=\"#\"onclick=\"doit('del',"+listUser[i].id+")\">"
									+ listUser[i].username
									+ "</a></span></td>",
							str += "<td><span class=\"STYLE1\">"
									+ listUser[i].gender
									+ "</span></td>",
							str += "<td><span class=\"STYLE1\">"
									+ listUser[i].age + "</span></td>",
							str += "<td><span class=\"STYLE1\">"
									+ listUser[i].phone
									+ "</span></td>",
							str += "<td><span class=\"STYLE1\">"
									+ listUser[i].password
									+ "</span></td>",
							str += "<td><span class=\"STYLE1\">"
									+ listUser[i].isadmin
									+ "</span></td>", str += "</tr>"
				}
				$("#tbody").html(str)
			},
			error : function() {
				alert("error")
			}

		});
	}

	//查询
	function findUser() {
		var findUser=$("#username").val();
		$.ajax({
			url: "${pageContext.request.contextPath}/findUser.action",
			dataType : "json",
			type : "post",
			data:{"user.username":findUser},
			success : function(info) {
				var str = "";
				var listUser = info.list;

				for (var i = 0; i < listUser.length; i++) {
					str += "<tr>"
							str += "<td><span class=\"STYLE1\"><a href=\"#\"onclick=\"doit("+listUser[i].id+","+listUser[i].isadmin+")\">"
									+ listUser[i].username
									+ "</a></span></td>",
							str += "<td><span class=\"STYLE1\">"
									+ listUser[i].gender
									+ "</span></td>",
							str += "<td><span class=\"STYLE1\">"
									+ listUser[i].age + "</span></td>",
							str += "<td><span class=\"STYLE1\">"
									+ listUser[i].phone
									+ "</span></td>",
							str += "<td><span class=\"STYLE1\">"
									+ listUser[i].password
									+ "</span></td>",
							str += "<td><span class=\"STYLE1\">"
									+ listUser[i].isadmin
									+ "</span></td>", str += "</tr>"
				}
				$("#tbody").html(str)
			},
			error:function(){
				alert("error")
			},
		});
		
		
	}
	//修改删除界面
	function doit(id) {
		window.location.href="${pageContext.request.contextPath}/update.action?user.id="+id
		/* if (flag == "del") {
			if (confirm("确认删除吗？") != true)
				return;
		} */
	}
</script>
</head>
<body>
	<div class="menu">

		<table>
			<tbody>
				<tr>
					<td><form method="post" id="findUserForm">
							用户名称：<input id="username" name="user.username" class="input-text" type="text">&nbsp;&nbsp;&nbsp;&nbsp;
							<input value="查 询" type="button" onclick="findUser()">
						</form></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="main">

		<div class="optitle clearfix">
			<em><input value="添加数据" class="input-button"
				onclick="window.location='userAdd.jsp'" type="button"></em>
			<div class="title">用户管理&gt;&gt;</div>
		</div>
		<div class="content">
			<table class="list">
				<thead>
					<tr>
						<td width="80"><div class="STYLE1" align="center">用户名称</div></td>
						<td width="100"><div class="STYLE1" align="center">性别</div></td>
						<td width="100"><div class="STYLE1" align="center">年龄</div></td>

						<td width="150"><div class="STYLE1" align="center">电话</div></td>
						<td width="150"><div class="STYLE1" align="center">密码</div></td>
						<td width="150"><div class="STYLE1" align="center">权限</div></td>
					</tr>
				</thead>
				<tbody id="tbody">

				</tbody>
			</table>
		</div>
	</div>
</body>
</html>