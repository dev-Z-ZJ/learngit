<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>" />
<title>${title }</title>
<script src="lib/jquery-1.11.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/date.js" charset="utf-8"></script>
<script type="text/javascript" src="laydate/laydate.js" charset="utf-8"></script>


</head>	
<%
	String message = (String) session.getAttribute("msg");
	if (message == null) {
		message = "";
	}
	if (!message.trim().equals("")) {
		out.println("<script language='javascript'>");
		out.println("alert('" + message + "');");
		out.println("</script>");
	}
	request.removeAttribute("msg");
%>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			当前位置: <a href="<%=basePath%>">首页</a>
			<code> &gt; </code>
			用户注册
		</div>
	</div>
	<div class="blank"></div>
	<div class="block">
		<div class="box">
			<div class="box_1">
				<h3>
					<span>用户注册</span>
				</h3>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr valign="top">
						<td bgcolor="#FFFFFF" align="center">
							<form class="form-horizontal" action="index/register.action" method="post" name="myform">
								<table width="60%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">用户名：</td>
										<td width="76%" align="left" bgcolor="#FFFFFF"><input type="text" name="username" size="25"
											class="inputBg" id="username" />
											<div id="username_msg" ></div>
										</td>										
									</tr>
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">密码：</td>
										<td width="76%" align="left" bgcolor="#FFFFFF"><input name="password" type="password" size="25"
											class="inputBg" id="password" />
											<div id="password_msg" ></div>
										</td>											
									</tr>
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">姓名：</td>
										<td width="76%" align="left" bgcolor="#FFFFFF"><input name="realname" type="text" size="25"
											class="inputBg" id="realname" />
											<div id="realname_msg" ></div>
										</td>
									</tr>
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">性别：</td>
										<td width="76%" align="left" bgcolor="#FFFFFF"><select name="sex" id="sex" class="inputBg">
												<option value="男">男</option>
												<option value="女">女</option>
										</select></td>
									</tr>
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">出生日期：</td>
										<td width="76%" align="left" bgcolor="#FFFFFF"><input name="birthday" type="text" size="25"
											class="inputBg" id="birthday" readonly="readonly" onclick="laydate()" />
											<div id="birthday_msg" ></div>	
										</td>
									</tr>
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">联系方式：</td>
										<td width="76%" align="left" bgcolor="#FFFFFF"><input name="contact" type="text" size="25"
											class="inputBg" id="contact" />
											<div id="contact_msg" ></div>
										</td>
									</tr>		
								</table>
								<button  type="button" onclick="m()" >确认注册</button>
							</form>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="blank5"></div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">

$("#username").blur(
		function() {
			$("#username_msg").empty();
			var name = $("#username").val();
			var nameReg = /^[a-zA-Z]{1}([a-zA-Z0-9]|[._]){4,19}$/;
			if (name == "" || name == null) {
				$("#username_msg").text("用户名不能为空");
				$("#username_msg").css( "color", "red");
			} else if (!nameReg.test(name)) {
				$("#username_msg").text("用户名只能输入5-20个以字母开头、可带数字、“_”、“.”的字符串");
				$("#username_msg").css( "color", "red");
			} else {
				$("#username_msg").text("用户名可用");
				$("#username_msg").css( "color", "green");
			}
	});

$("#password").blur(
		function() {
			$("#password_msg").empty();
			var name = $("#password").val();
			var nameReg = /^(\w){6,20}$/;
			if (name == "" || name == null) {
				$("#password_msg").text("密码不能为空");
				$("#password_msg").css( "color", "red");
			} else if (!nameReg.test(name)) {
				$("#password_msg").text("密码只能由6-20个字母、数字、下划线组成");
				$("#password_msg").css( "color", "red");
			} else {
				$("#password_msg").text("密码可用");
				$("#password_msg").css( "color", "green");
			}
	});

$("#realname").blur(
		function() {
			$("#realname_msg").empty();
			var name = $("#realname").val();
			var nameReg = /^[\u4E00-\u9FA5]{2,4}$/;
			if (name == "" || name == null) {
				$("#realname_msg").text("请输入姓名");
				$("#realname_msg").css( "color", "red");
			} else if (!nameReg.test(name)) {
				$("#realname_msg").text("请输入正确的姓名");
				$("#realname_msg").css( "color", "red");
			} else {
				$("#realname_msg").text("正确");
				$("#realname_msg").css( "color", "green");
			}			
	});
	

$("#birthday").blur(
		function() {
			$("#birthday_msg").empty();
			var name = $("#birthday").val();
			var nameReg = /^((19[2-9]\d{1})|(20((0[0-9])|(1[0-9])|(20))))\-((0?[1-9])|(1[0-2]))\-((0?[1-9])|([1-2][0-9])|30|31)$/;
			if (name == "" || name == null) {
				$("#birthday_msg").text("请输入出生日期");
				$("#birthday_msg").css( "color", "red");
			} else if (!nameReg.test(name)) {
				$("#birthday_msg").text("请输入正确的出生日期");
				$("#birthday_msg").css( "color", "red");
			} else {
				$("#birthday_msg").text("正确");
				$("#birthday_msg").css( "color", "green");
			}			
	});
	
$("#contact").blur(
		function() {
			$("#contact_msg").empty();
			var name = $("#contact").val();
			var nameReg = /^(1[3|4|5|7|8|9]\d{9}$)|(^09\d{8})$/;
			if (name == "" || name == null) {
				$("#contact_msg").text("请输入手机联系方式");
				$("#contact_msg").css( "color", "red");
			} else if (!nameReg.test(name)) {
				$("#contact_msg").text("请输入正确的联系方式");
				$("#contact_msg").css( "color", "red");
			} else {
				$("#contact_msg").text("正确");
				$("#contact_msg").css( "color", "green");
			}		
	});
	
function m() {
	var username_msg = $("#username_msg").val();
	var password_msg = $("#password_msg").val();
	var realname_msg = $("#realname_msg").val();
	var birthday_msg = $("#birthday_msg").val();
	var contact_msg = $("#contact_msg").val();
	if (username_msg == "用户名可用" && password_msg == "密码可用" && realname_msg == "正确" && birthday_msg == "正确" && contact_msg == "正确") {
		$(".form-horizontal").submit();
	} else {
		alert("表单信息不正确！");
	}
}
</script>
</html>
