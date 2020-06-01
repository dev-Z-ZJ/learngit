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
						<th class="text-center">操作</th>
					</tr>
				</thead>
				<c:forEach items="${topicList}" var="topic">
					<tr align="center">
						<td>${topic.username}</td>
						<td>${topic.ordercode}</td>
						<td>${topic.goodsname}</td>
						<td>${topic.num}</td>
						<td>${topic.contents}</td>
						<td>${topic.addtime}</td>
						<td>${topic.status}</td>
						<td>${topic.reps}</td>
						<td><c:if test="${topic.status eq '未回复'}">
								<a href="topic/getTopicById.action?id=${topic.topicid}">回复</a>&nbsp;&nbsp;
						</c:if> <a href="topic/deleteTopic.action?id=${topic.topicid}"
							onclick="{if(confirm('确定要删除吗?')){return true;}return false;}"><i class="fa fa-trash-o"></i></a></td>
					</tr>
				</c:forEach>
			</table>
			<div class="pagination">${html }</div>
		</div>
	</div>
</body>
</html>
