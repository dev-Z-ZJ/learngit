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
			<h1 class="page-title">订单评价信息列表</h1>
		</div>
		<div class="main-content">
			<table class="table">
				<thead>
					<tr>
						<th class="text-center">用户</th>
						<th class="text-center">订单</th>
						<th class="text-center">服务项目</th>
						<th class="text-center">评分</th>
						<th class="text-center" style="width: 20%">评价</th>
						<th class="text-center">日期</th>
						<th class="text-center">状态</th>
						<th class="text-center" style="width: 10%">回复</th>
					</tr>
				</thead>
				<c:forEach items="${topicList}" var="topic">
					<tr align="center">
						<td class="center">${topic.username}</td>
						<td class="center">${topic.ordercode}</td>
						<td class="center">${topic.goodsname}</td>
						<td class="center">${topic.num}</td>
						<td class="center">${topic.contents}</td>
						<td class="center">${topic.addtime}</td>
						<td class="center">${topic.status}</td>
						<td class="center">${topic.reps}</td>
					</tr>
				</c:forEach>
			</table>
			<ul class="pagination">
				<li>
					<form action="topic/queryTopicByCond.action" name="myform" method="post">
						<label>查询条件: <select name="cond" style="width: 100px">
								<option value="usersid">按用户查询</option>
								<option value="ordersid">按订单查询</option>
								<option value="goodsid">按服务项目查询</option>
								<option value="num">按评分查询</option>
								<option value="contents">按评价查询</option>
								<option value="addtime">按日期查询</option>
								<option value="status">按状态查询</option>
								<option value="reps">按回复查询</option>
						</select>
						</label>&nbsp;&nbsp;&nbsp; <label>关键字: <input type="text" name="name" required style="width: 100px" /></label>&nbsp;&nbsp;&nbsp;
						<label><input type="submit" value="查询" class="mws-button green" /> </label>${html }
					</form>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
