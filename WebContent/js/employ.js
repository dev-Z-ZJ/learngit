$(function() {

$("#realname").blur(
		function() {
			$("#realname_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#realname").after("<span id='realname_msg' style='color: red'>姓名不能为空</span>");
			}
	});

$("#birthday").blur(
		function() {
			$("#birthday_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#birthday").after("<span id='birthday_msg' style='color: red'>出生日期不能为空</span>");
			}
	});

$("#idcard").blur(
		function() {
			$("#idcard_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#idcard").after("<span id='idcard_msg' style='color: red'>身份证不能为空</span>");
			}
	});

$("#jiguan").blur(
		function() {
			$("#jiguan_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#jiguan").after("<span id='jiguan_msg' style='color: red'>籍贯不能为空</span>");
			}
	});

$("#minzu").blur(
		function() {
			$("#minzu_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#minzu").after("<span id='minzu_msg' style='color: red'>民族不能为空</span>");
			}
	});

$("#workdate").blur(
		function() {
			$("#workdate_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#workdate").after("<span id='workdate_msg' style='color: red'>入职日期不能为空</span>");
			}
	});

$("#contact").blur(
		function() {
			$("#contact_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#contact").after("<span id='contact_msg' style='color: red'>联系方式不能为空</span>");
			}
	});

$("#memo").blur(
		function() {
			$("#memo_msg").empty();
			var name = $(this).val();
			if (name == "" || name == null) {
				$("#memo").after("<span id='memo_msg' style='color: red'>备注不能为空</span>");
			}
	});







$('#sub').click(function(){
var realname = $("#realname").val();
var birthday = $("#birthday").val();
var idcard = $("#idcard").val();
var jiguan = $("#jiguan").val();
var minzu = $("#minzu").val();
var workdate = $("#workdate").val();
var contact = $("#contact").val();
var memo = $("#memo").val();
$("#realname_msg").empty();
$("#birthday_msg").empty();
$("#idcard_msg").empty();
$("#jiguan_msg").empty();
$("#minzu_msg").empty();
$("#workdate_msg").empty();
$("#contact_msg").empty();
$("#memo_msg").empty();
if (realname == "" || realname == null) {
	$("#realname").after("<span id='realname_msg' style='color: red'>姓名不能为空</span>");
	return false;
}
if (birthday == "" || birthday == null) {
	$("#birthday").after("<span id='birthday_msg' style='color: red'>出生日期不能为空</span>");
	return false;
}
if (idcard == "" || idcard == null) {
	$("#idcard").after("<span id='idcard_msg' style='color: red'>身份证不能为空</span>");
	return false;
}
if (jiguan == "" || jiguan == null) {
	$("#jiguan").after("<span id='jiguan_msg' style='color: red'>籍贯不能为空</span>");
	return false;
}
if (minzu == "" || minzu == null) {
	$("#minzu").after("<span id='minzu_msg' style='color: red'>民族不能为空</span>");
	return false;
}
if (workdate == "" || workdate == null) {
	$("#workdate").after("<span id='workdate_msg' style='color: red'>入职日期不能为空</span>");
	return false;
}
if (contact == "" || contact == null) {
	$("#contact").after("<span id='contact_msg' style='color: red'>联系方式不能为空</span>");
	return false;
}
if (memo == "" || memo == null) {
	$("#memo").after("<span id='memo_msg' style='color: red'>备注不能为空</span>");
	return false;
}
});
$('#res').click(function() {
$("#realname_msg").empty();
$("#birthday_msg").empty();
$("#idcard_msg").empty();
$("#jiguan_msg").empty();
$("#minzu_msg").empty();
$("#workdate_msg").empty();
$("#contact_msg").empty();
$("#memo_msg").empty();
});

});
