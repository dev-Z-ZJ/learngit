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
<script type="text/javascript" src="js/allot.js" charset="utf-8"></script>
<script type="text/javascript" src="js/selimage.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js" charset="utf-8"></script>
</head>
<body class=" theme-blue">
	<jsp:include page="top.jsp"></jsp:include>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="content">
		<div class="header">
			<h1 class="page-title">新增订单分派信息</h1>
		</div>
		<div class="block clearfix">
			<div class="AreaR">
				<div class="box">
					<div class="box_1">
						<div class="userCenterBox boxCenterList clearfix" style="_height: 1%;">
							<h5>
								<span>订单详情</span>
							</h5>
							<div class="blank"></div>
							<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
								<tr>
									<td align="center" bgcolor="#ffffff">订单号</td>
									<td align="center" bgcolor="#ffffff">详细地址</td>
									<td align="center" bgcolor="#ffffff">联系方式</td>
									<td align="center" bgcolor="#ffffff">工作日期</td>
									<td align="center" bgcolor="#ffffff">结束日期</td>
									<td align="center" bgcolor="#ffffff">时间段</td>
									<td align="center" bgcolor="#ffffff">备注</td>
								</tr>
								<c:forEach items="${ordersList}" var="orders">
									<tr>
										<td align="center" bgcolor="#ffffff">${orders.ordercode}</td>
										<td align="center" bgcolor="#ffffff">${orders.address}</td>
										<td align="center" bgcolor="#ffffff">${orders.contact}</td>
										<td align="center" bgcolor="#ffffff">${orders.workdate}</td>
										<td align="center" bgcolor="#ffffff">${orders.worktime}</td>
										<td align="center" bgcolor="#ffffff">${orders.enddate}</td>
										<td align="center" bgcolor="#ffffff">${orders.memo}</td>									
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
		<div class="main-content">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div id="myTabContent" class="tab-content">
						<form action="allot/addAllot.action" name="myform" method="post" onsubmit="return check()" class="form">
							<div class="tab-pane active in" id="home">
								<div class="form-group">
									<label>订单号</label> <select name="ordersid" class="form-control" id="ordersid"><c:forEach
											items="${ordersList}" var="orders">
											<option value="${orders.ordersid}">${orders.ordercode }</option>
										</c:forEach></select>
								</div>
							</div>
							<div class="tab-pane active in" id="home">
								<div class="form-group">
									<label>服务人员</label> <select name="employid" class="form-control" id="employid"><c:forEach
											items="${employList}" var="employ">
											<option value="${employ.employid}">${employ.realname }</option>
										</c:forEach></select>
								</div>
							</div>

							<div>
								<button type="submit" id="sub" class="btn btn-primary">提交保存</button>
								&nbsp;&nbsp;&nbsp;
								<button type="reset" id="res" class="btn btn-primary">取消重置</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

