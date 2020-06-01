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
							<span>评价服务</span>
						</h5>
						<div class="blank"></div>
						<form action="index/addTopic.action" method="post">
							<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
								<tr>
									<th bgcolor="#ffffff">服务</th>
									<td bgcolor="#ffffff">评分</td>
									<td bgcolor="#ffffff">评价内容</td>
								</tr>
								<c:forEach items="${detailsList}" var="orders" varStatus="st">
									<tr>
										<td align="center" bgcolor="#ffffff">${orders.goodsname}</td>
										<td align="center" bgcolor="#ffffff"><input name="num_${st.index}" type="radio" value="1" id="num" /> <img
											src="themes/xecmoban_haier2015/images/stars1.gif" /> <input name="num_${st.index}" type="radio" value="2"
											id="num" /> <img src="themes/xecmoban_haier2015/images/stars2.gif" /> <input name="num_${st.index}"
											type="radio" value="3" id="num" /> <img src="themes/xecmoban_haier2015/images/stars3.gif" /> <input
											name="num_${st.index}" type="radio" value="4" id="num" /> <img
											src="themes/xecmoban_haier2015/images/stars4.gif" /> <input name="num_${st.index}" type="radio" value="5"
											checked="checked" id="num" /> <img src="themes/xecmoban_haier2015/images/stars5.gif" /></td>
										<td align="center" bgcolor="#ffffff"><textarea name="contents_${st.index}" id="contents"></textarea></td>
									</tr>
								</c:forEach>
								<tr>
									<td bgcolor="#ffffff" colspan="3" align="center"><input type="hidden" name="id"
										value="${orders.ordersid }"> <input type="submit" id="order_btn" value="评价" class="ddtj_btn" /></td>
								</tr>
							</table>
						</form>
						<div class="blank5"></div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="blank"></div>



	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
