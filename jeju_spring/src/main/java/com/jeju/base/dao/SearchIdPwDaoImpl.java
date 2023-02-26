package com.jeju.base.dao;

import org.apache.ibatis.session.SqlSession;


public class SearchIdPwDaoImpl implements SearchIdPwDao {
	
	SqlSession sqlSession;
	String nameSpace="com.jeju.base.dao.SearchIdPwDao";

	// 아이디 찾기(2023-02-22)
    @Override
	public int SearchId(String uName, String uEmail) throws Exception {
		return sqlSession.selectOne(nameSpace + ".SearchId");
	}

	// 비밀번호 찾기(2023-02-23)
	@Override
	public int SearchPw(String uName, String uid, String uEmail) throws Exception {
		return sqlSession.selectOne(nameSpace + ".SearchPw");
	}

	// 아이디 가져오기(2023-02-22)
	@Override
	public String FindId(String uName, String uEmail) throws Exception {
		return null;
	}

	// 비밀번호 가져오기(2023-02-23)
	@Override
	public String FindPw(String uName, String uid, String uEmail) throws Exception {
		return null;
	}
	
	// 비밀번호 수정하기(2023-02-23)
	@Override
	public int UpdatePw(String uPassword,String uid) throws Exception {
		return sqlSession.selectOne(nameSpace + ".UpdatePw");
	}

}