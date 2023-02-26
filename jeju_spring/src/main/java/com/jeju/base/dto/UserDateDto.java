package com.jeju.base.dto;

public class UserDateDto {
	String uId;
	String uPassword;
	String uName;
	String uNickname;
	String uEmail;
	String uSex;
	String uBirth;
	public UserDateDto(String uPassword, String uName, String uNickname, String uEmail, String uSex, String uBirth) {
		super();
		this.uPassword = uPassword;
		this.uName = uName;
		this.uNickname = uNickname;
		this.uEmail = uEmail;
		this.uSex = uSex;
		this.uBirth = uBirth;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuPassword() {
		return uPassword;
	}
	public void setuPassword(String uPassword) {
		this.uPassword = uPassword;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuNickname() {
		return uNickname;
	}
	public void setuNickname(String uNickname) {
		this.uNickname = uNickname;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	public String getuSex() {
		return uSex;
	}
	public void setuSex(String uSex) {
		this.uSex = uSex;
	}
	public String getuBirth() {
		return uBirth;
	}
	public void setuBirth(String uBirth) {
		this.uBirth = uBirth;
	}
	
	
}
