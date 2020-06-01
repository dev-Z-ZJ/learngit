<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%><jsp:include page="check_logstate.jsp"></jsp:include>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%><!doctype html>
<html lang="zh_CN">
<head>
<base href="<%=basePath%>" />
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
			<h1 class="page-title">该月工作人员工作情况</h1>
		</div>
		<div class="main-content">
			<table class="table">
				<thead>
					<tr>
						<th class="text-center">员工编号</th>
						<th class="text-center">员工姓名</th>
						<th class="text-center">该月接单数</th>
						<th class="text-center">该月服务总额</th>
					</tr>
				</thead>
				<c:forEach items="${salaryList}" var="salary">
					<tr align="center">
						<td class="center">${salary.employid}</td>
						<td class="center">${salary.realname}</td>
						<td class="center">${salary.count}</td>
						<td class="center">${salary.amount}</td>
					</tr>
				</c:forEach>
			</table>
			<div align="center">${html }</div>
		</div>
	</div>
</body>
</html>
