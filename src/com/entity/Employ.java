package com.entity;

import com.util.VeDate;

public class Employ {
	private String employid = "E" + VeDate.getStringId();
	private String realname;
	private String sex;
	private String image;
	private String birthday;
	private String idcard;
	private String skills;
	private String jiguan;
	private String minzu;
	private String workdate;
	private String contact;
	private String memo;

	public String getEmployid() {
		return employid;
	}

	public void setEmployid(String employid) {
		this.employid = employid;
	}

	public String getRealname() {
		return this.realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirthday() {
		return this.birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getIdcard() {
		return this.idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getJiguan() {
		return this.jiguan;
	}

	public void setJiguan(String jiguan) {
		this.jiguan = jiguan;
	}

	public String getMinzu() {
		return this.minzu;
	}

	public void setMinzu(String minzu) {
		this.minzu = minzu;
	}

	public String getWorkdate() {
		return this.workdate;
	}

	public void setWorkdate(String workdate) {
		this.workdate = workdate;
	}

	public String getContact() {
		return this.contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}
}
