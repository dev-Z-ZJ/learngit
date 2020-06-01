$(function() {

$("#ordersid").blur(
		function() {
			$("#ordersid_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#ordersid").after("<span id='ordersid_msg' style='color: red'>订单号不能为空</span>");
			}
	});

$("#employid").blur(
		function() {
			$("#employid_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#employid").after("<span id='employid_msg' style='color: red'>服务人员不能为空</span>");
			}
	});







$('#sub').click(function(){
var ordersid = $("#ordersid").val();
var employid = $("#employid").val();
$("#ordersid_msg").empty();
$("#employid_msg").empty();
if (ordersid == "" || ordersid == null) {
	$("#ordersid").after("<span id='ordersid_msg' style='color: red'>订单号不能为空</span>");
	return false;
}
if (employid == "" || employid == null) {
	$("#employid").after("<span id='employid_msg' style='color: red'>服务人员不能为空</span>");
	return false;
}
});
$('#res').click(function() {
$("#ordersid_msg").empty();
$("#employid_msg").empty();
});

});
