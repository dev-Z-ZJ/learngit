package com.entity;

import com.util.VeDate;

public class Allot {
	private String allotid = "A" + VeDate.getStringId();
	private String ordersid;
	private String employid;
	private String addtime;
	private String status;
	private String ordercode;
	private String realname;

	public String getAllotid() {
		return allotid;
	}

	public void setAllotid(String allotid) {
		this.allotid = allotid;
	}

	public String getOrdersid() {
		return this.ordersid;
	}

	public void setOrdersid(String ordersid) {
		this.ordersid = ordersid;
	}

	public String getEmployid() {
		return this.employid;
	}

	public void setEmployid(String employid) {
		this.employid = employid;
	}

	public String getAddtime() {
		return this.addtime;
	}

	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOrdercode() {
		return this.ordercode;
	}

	public void setOrdercode(String ordercode) {
		this.ordercode = ordercode;
	}

	public String getRealname() {
		return this.realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}
}
