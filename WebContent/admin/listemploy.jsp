<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="check_logstate.jsp"></jsp:include>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="zh_CN">
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎使用后台管理系统</title>
<link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">
<script src="lib/jquery-1.11.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
<link rel="stylesheet" type="text/css" href="stylesheets/premium.css">
</head>
<body class=" theme-blue">
	<jsp:include page="top.jsp"></jsp:include>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="content">
		<div class="header">
			<h1 class="page-title">工作人员信息列表</h1>
		</div>
		<div class="main-content">
			<table class="table">

				<thead>
					<tr>
						<th class="text-center">姓名</th>
						<th class="text-center">性别</th>
						<th class="text-center">出生日期</th>
						<th class="text-center">身份证</th>
						<th class="text-center">籍贯</th>
						<th class="text-center">民族</th>
						<th class="text-center">入职日期</th>
						<th class="text-center">联系方式</th>
						<th class="text-center" style="width: 20%">备注</th>
						<th class="text-center">操作</th>
					</tr>
				</thead>
				<c:forEach items="${employList}" var="employ">
					<tr align="center">
						<td>${employ.realname}</td>
						<td>${employ.sex}</td>
						<td>${employ.birthday}</td>
						<td>${employ.idcard}</td>
						<td>${employ.jiguan}</td>
						<td>${employ.minzu}</td>
						<td>${employ.workdate}</td>
						<td>${employ.contact}</td>
						<td>${employ.memo}</td>
						<td><a href="employ/getEmployById.action?id=${employ.employid}"><i class="fa fa-pencil"></i></a>&nbsp;&nbsp;<a
							href="employ/deleteEmploy.action?id=${employ.employid}"
							onclick="{if(confirm('确定要删除吗?')){return true;}return false;}"><i class="fa fa-trash-o"></i></a></td>
					</tr>
				</c:forEach>
			</table>
			<div class="pagination">${html }</div>
		</div>
	</div>
</body>
</html>
