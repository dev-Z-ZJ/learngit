<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<title>${title }</title>
<script type="text/javascript" src="laydate/laydate.js" charset="utf-8" ></script>
<style>
* {
    margin: 0;
    padding: 0;
}

fieldset {
    width: 40%;
    padding: 20px;
    margin: 0;
    border: 1px solid #ccc;
}
 
legend{
    font-size: 18px;
    font-weight: bold;
}
 
#addr-show, #addr-show02,#addr-show03{
    width: 200px;
    height: 25px;
    margin-bottom: 10px;
}
 
.btn1 {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 3px 8px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}

.btn1:disabled{
    background-color: #e7e7e7; color: black;
}
 
select {
    width: 120px;
    height: 30px;
}

.inputBg1 {
	border: 1px solid #b3b3b3;
	height: 23px;
	width: 40%;
	line-height: 23px;
}

.inputBg2 {
	border: 1px solid #b3b3b3;
	height: 46px;
	width: 60%;
	line-height: 46px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			当前位置: <a href="<%=basePath%>">首页</a>
			<code> &gt; </code>
			购物流程
		</div>
	</div>
	<div class="blank"></div>
	<div class="block table" align="center">
		<form class="form-horizontal" action="index/checkout.action" method="post" name="theForm" id="theForm">
			<div class="flowBox">
				<h6>
					<span>收货人信息</span>
				</h6>
				<table width="99%" align="center" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
					<tr>
						<td bgcolor="#ffffff">选择地址:</td>
						<c:if test="${sessionScope.users.uaddress == null }">
							<td bgcolor="#ffffff" colspan="2">
								<div>
								    <fieldset>							 
								        <!--省份选择-->
								        <select id="prov" onchange="showCity(this)">
								            <option>=请选择省份=</option>							 
								        </select>							 
								        <!--城市选择-->
								        <select id="city" onchange="showCountry(this)">
								            <option>=请选择城市=</option>
								        </select>							 
								        <!--县区选择-->
								        <select id="country" onchange="selecCountry(this)">
								            <option>=请选择县区=</option>
								        </select>
								    </fieldset>
									<button type="button" class="btn1 met1" onclick="showAddr()" id="button-show" >确定</button>
								</div>
							</td>							
						</c:if>
						<c:if test="${sessionScope.users.uaddress != null }">
							<td bgcolor="#ffffff" colspan="2">
								<div>您的默认地址是：<br/>
									<input type="text" class="inputBg1" value="${users.uaddress}" />
								</div>
							</td>
						</c:if>
					</tr>
					<tr>
						<td bgcolor="#ffffff">详细地址:</td>
						<td bgcolor="#ffffff" colspan="2"><input name="address" type="text" class="inputBg1" id="address" onblur="ad()"/> (必填)
							<div id="address_msg" ></div>
						</td>
					</tr>
					<tr>
						<td bgcolor="#ffffff">联系方式:</td>
						<td bgcolor="#ffffff" colspan="2"><input name="contact" type="text" class="inputBg1" id="contact" onblur="con()" /> (必填)
							<div id="contact_msg" ></div>
						</td>
					</tr>
					<tr>
						<td bgcolor="#ffffff">开始日期:</td>
						<td bgcolor="#ffffff" colspan="2"><input name="workdate" type="text" class="inputBg1" id="workdate"
							onclick="laydate()" readonly="readonly" /> (必填)
								<div id="workdate_msg" ></div>
							</td>
					</tr>
					<tr>
						<td bgcolor="#ffffff">结束日期:</td>
						<td bgcolor="#ffffff" colspan="2"><input name="enddate" type="text" class="inputBg1" id="enddate"
							onclick="laydate()" readonly="readonly" /> (必填)
								<div id="enddate_msg" ></div>
							</td>
					</tr>
					<tr>
						<td bgcolor="#ffffff">时间段:</td>
						<td bgcolor="#ffffff" colspan="2"><input name="worktime" type="text" class="inputBg1" id="worktime" onblur="ti()" /> (必填)
							<div id="worktime_msg" ></div>
						</td>
					</tr>
					<tr>
						<td bgcolor="#ffffff">备注:</td>
						<td bgcolor="#ffffff" colspan="2"><input name="memo" type="text" class="inputBg2" id="memo" /> (选填，如指定家政人员)
							<div id="memo_msg" ></div>
						</td>
					</tr>
					<tr>
						<td colspan="4" align="center" bgcolor="#ffffff"></td>
					</tr>
				</table>
			</div>
			<button type="button" onclick="m()" >确定</button>
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript" src="js/method.js" charset="utf-8" ></script>
<script type="text/javascript" src="js/city.js" charset="utf-8" ></script>	
<script type="text/javascript" src="js/checkout.js" charset="utf-8" ></script>
</body>
</html>
