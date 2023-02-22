package com.jeju.base.dao;

public interface LoginSignUpDao {

	public void SignUp(String uId, String uIdType, String uPassword, String uName, String uNickname, String uEmail, String uSex, String uBirth) throws Exception;
	public int IdCheck(String uId) throws Exception;
	public int Login(String uId, String uPassword) throws Exception;
	public int ComebackCheck(String uId) throws Exception;
	public void ComeBack(String uId, String uIdType, String uPassword, String uName, String uNickname, String uEmail, String uSex, String uBirth) throws Exception;
}
