<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>" />
<title>${title }</title>

</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			当前位置: <a href=".">首页</a>
			<code> &gt; </code>
			用户中心
		</div>
	</div>
	<div class="blank"></div>

	<div class="blank"></div>
	<div class="block clearfix">

		<div class="AreaL">
			<div class="box">
				<div class="box_1">
					<div class="userCenterBox">
						<jsp:include page="usermenu.jsp"></jsp:include>
					</div>
				</div>
			</div>
		</div>


		<div class="AreaR">
			<div class="box">
				<div class="box_1">
					<div class="userCenterBox boxCenterList clearfix" style="_height: 1%;">
						<h5>
							<span>我的评价</span>
						</h5>
						<div class="blank"></div>
						<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
							<tr>
								<th bgcolor="#ffffff">订单</th>
								<th bgcolor="#ffffff">服务项目</th>
								<th bgcolor="#ffffff">评分</th>
								<th bgcolor="#ffffff" style="width: 20%">评价</th>
								<th bgcolor="#ffffff">日期</th>
								<th bgcolor="#ffffff">状态</th>
								<th bgcolor="#ffffff" style="width: 20%">回复</th>
							</tr>
							<c:forEach items="${topicList}" var="topic">
								<tr align="center">
									<td align="center" bgcolor="#ffffff">${topic.ordercode}</td>
									<td align="center" bgcolor="#ffffff">${topic.goodsname}</td>
									<td align="center" bgcolor="#ffffff">${topic.num}</td>
									<td align="center" bgcolor="#ffffff">${topic.contents}</td>
									<td align="center" bgcolor="#ffffff">${topic.addtime}</td>
									<td align="center" bgcolor="#ffffff">${topic.status}</td>
									<td align="center" bgcolor="#ffffff">${topic.reps}</td>
								</tr>
							</c:forEach>
						</table>
						<div class="blank5"></div>
						<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
							<tr>
								<td align="center" bgcolor="#ffffff">${html}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="blank"></div>
	


	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
