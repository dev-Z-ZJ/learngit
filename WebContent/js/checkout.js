var address = $('address');
var address_msg = $('address_msg');
var contact = $('contact');
var contact_msg = $('contact_msg');
var workdate = $('workdate');
var workdate_msg = $('workdate_msg');
var enddate = $('enddate');
var enddate_msg = $('enddate_msg');
var worktime = $('worktime');
var worktime_msg = $('worktime_msg');

function ad() {
	address_msg.innerHTML = "";
	var name = address.value;
	if (name == null || name == "") {
		address_msg.innerHTML = "地址不能为空";
		address_msg.style.color = "#ff0000";
	}
}
		
function con() {
	contact_msg.innerHTML = "";
	var name = contact.value;
	var nameReg = /^(1[3|4|5|7|8|9]\d{9}$)|(^09\d{8})$/;
	if (name == null || name == "") {
		contact_msg.innerHTML = "请填写联系方式";
		contact_msg.style.color = "#ff0000";
	} else if (!nameReg.test(name)) {
		contact_msg.innerHTML = "手机联系方式不正确";
		contact_msg.style.color = "#ff0000";
	} else {
		contact_msg.innerHTML = "正确";
		contact_msg.style.color = "#00ff00";
	}
}

function ti() {
	worktime_msg.innerHTML = "";
	var name = worktime.value;
	var nameReg = /^(((0[8-9])|(1[0-9])|(2[0-1]))\-((09)|(1[0-9])|(2[0-1])))$/;
	if (name == null || name == "") {
		worktime_msg.innerHTML = "时间段不能为空";
		worktime_msg.style.color = "#ff0000";
	} else if (!nameReg.test(name)) {
		worktime_msg.innerHTML = "时间段不正确";
		worktime_msg.style.color = "#ff0000";
	} else {
		worktime_msg.innerHTML = "正确";
		worktime_msg.style.color = "#00ff00";
	}
}

function m() {
	if (contact_msg.innerHTML == "正确" && workdate.value != "" && enddate.value != "" && worktime_msg.innerHTML == "正确") {
		var theForm = $('theForm');		
		theForm.submit();
	} else {
		alert("表单信息不正确！");		
	}
}