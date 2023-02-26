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


	


	
	
	
	
}
