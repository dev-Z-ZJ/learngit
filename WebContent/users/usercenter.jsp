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
<script language="javascript" type="text/javascript" src="<%=basePath%>laydate/laydate.js" charset="utf-8"></script>
<style>
fieldset {
    width: 80%;
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
 
.btna {
    background-color: #4CAF50; /* Green */
    width: 60px;
    height: 30px;
    border: none;
    color: white;
    padding: 5px 8px;
    margin-top: 5px;
    margin-bottom: 5px;
}

.btna:disabled{
    background-color: #e7e7e7; color: #ffffff;
}
 
select {
    width: 120px;
    height: 30px;
}
</style>
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
					<div class="userCenterBox boxCenterList clearfix" style="_height: 1%;" align="center">
						<h5>
							<span>个人中心</span>
						</h5>
						<div class="blank"></div>
						<form class="form-horizontal" action="index/preAddUaddress.action" method="post" name="theForm" id="theForm">
							<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
								<tr>
									<td width="15%" align="left" bgcolor="#FFFFFF">设置默认地址:</td>
									<td width="85%" bgcolor="#ffffff" colspan="2">
										<div align="center">
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
											<button type="button" class="btna met1" onclick="showAddr()" id="button-show" >确定</button>
										</div>
									</td>
								</tr>	
								<tr>
									<td bgcolor="#ffffff">默认地址:</td>
									<td bgcolor="#ffffff" colspan="2" align="center">
										<input name="address" type="text" style="width:300px" class="inputBg" id="address" value="${users.uaddress }" />
									</td>
								</tr>				
							</table>
							<button align="center" type="button" onclick="m()" >确定</button>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="blank"></div>
	<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript" src="js/city.js" charset="utf-8" ></script>
<script type="text/javascript" src="js/method.js" charset="utf-8" ></script>
<script type="text/javascript">
function m() {
	if (address.value != "") {
		var theForm = $('theForm');		
		theForm.submit();
	} else {
		alert("表单信息不正确！");		
	}
}
</script>
</body>
</html>
