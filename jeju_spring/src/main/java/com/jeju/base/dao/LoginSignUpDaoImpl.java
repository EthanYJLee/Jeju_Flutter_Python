package com.jeju.base.dao;

import org.apache.ibatis.session.SqlSession;

public class LoginSignUpDaoImpl implements LoginSignUpDao {
	
	SqlSession sqlSession;
	String nameSpace="com.jeju.base.dao.LoginSignUpDao";

	//Desc: 회원가입
	//Date: 2023-02-21
	@Override
	public void SignUp(String uId, String uIdType, String uPassword, String uName, String uNickname, String uEmail, String uSex,
			String uBirth) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(nameSpace + ".SignUp");
	}

	//Desc: ID 중복체크
	//Date: 2023-02-22
	@Override
	public int IdCheck(String uId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".IdCheck");
	}

	//Desc: 로그인
	//Date: 2023-02-22
	@Override
	public int Login(String uId, String uPassword) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".Login");
	}

	//Desc: 삭제한 사용자가 돌아왔는지 체크
	//Date: 2023-02-22
	@Override
	public int ComebackCheck(String uId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".ComebackCheck");
	}

	//Desc: 삭제한 사용자 복귀
	//Date: 2023-02-22
	@Override
	public void ComeBack(String uId, String uIdType, String uPassword, String uName, String uNickname, String uEmail,
			String uSex, String uBirth) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(nameSpace + ".ComeBack");
	}

}
