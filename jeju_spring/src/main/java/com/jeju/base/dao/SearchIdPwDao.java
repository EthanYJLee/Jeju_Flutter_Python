package com.jeju.base.dao;



public interface SearchIdPwDao {

	public int SearchId(String uName, String uEmail) throws Exception;
	public String FindId(String uName, String uEmail) throws Exception;
	public int SearchPw(String uName, String uid, String uEmail) throws Exception;
	public String FindPw(String uName, String uid, String uEmail) throws Exception;
	public int UpdatePw(String uPassword, String uid) throws Exception;
}