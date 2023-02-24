package com.jeju.base.dto;

public class UserStoreDto {
	
	int sId;
	String sName;
	String sCategory;
	String sDong;
	String sTel;
	String sAddress;
	String user_uId;
	String user_uIdType;
	
	String uId;
	String uPassword;
	String uName;
	String uNickname;
	String uEmail;
	String uSex;
	String uBirth;
	
	public UserStoreDto(int sId, String sName, String sCategory, String sDong, String sTel, String sAddress) {
		super();
		this.sId = sId;
		this.sName = sName;
		this.sCategory = sCategory;
		this.sDong = sDong;
		this.sTel = sTel;
		this.sAddress = sAddress;

	} //생성
	

	public UserStoreDto(int sId, String sName, String sCategory, String sDong, String sTel, String sAddress,
			String user_uId, String user_uIdType) {
		super();
		this.sId = sId;
		this.sName = sName;
		this.sCategory = sCategory;
		this.sDong = sDong;
		this.sTel = sTel;
		this.sAddress = sAddress;
		this.user_uId = user_uId;
		this.user_uIdType = user_uIdType;
	}

	public UserStoreDto(String uId, String uPassword, String uName, String uNickname, String uEmail, String uSex,
			String uBirth) {
		super();
		this.uId = uId;
		this.uPassword = uPassword;
		this.uName = uName;
		this.uNickname = uNickname;
		this.uEmail = uEmail;
		this.uSex = uSex;
		this.uBirth = uBirth;
	}


	public int getsId() {
		return sId;
	}

	public void setsId(int sId) {
		this.sId = sId;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getsCategory() {
		return sCategory;
	}

	public void setsCategory(String sCategory) {
		this.sCategory = sCategory;
	}

	public String getsDong() {
		return sDong;
	}

	public void setsDong(String sDong) {
		this.sDong = sDong;
	}

	public String getsTel() {
		return sTel;
	}

	public void setsTel(String sTel) {
		this.sTel = sTel;
	}

	public String getsAddress() {
		return sAddress;
	}

	public void setsAddress(String sAddress) {
		this.sAddress = sAddress;
	}


	public String getUser_uId() {
		return user_uId;
	}


	public void setUser_uId(String user_uId) {
		this.user_uId = user_uId;
	}


	public String getUser_uIdType() {
		return user_uIdType;
	}


	public void setUser_uIdType(String user_uIdType) {
		this.user_uIdType = user_uIdType;
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
