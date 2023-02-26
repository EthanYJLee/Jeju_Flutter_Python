package com.jeju.base.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jeju.base.dto.UserDateDto;
import com.jeju.base.dto.UserStoreDto;

public class UserStoreDaoImpl implements UserStoreDao {
	SqlSession sqlSession;
	String nameSpace="com.jeju.base.dao.UserStoreDao";
	@Override
	public List<UserStoreDto> UserStoreSelect(String uId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".UserStoreSelect");
	}
	@Override
	public void UserStoreAdd(String sName, String sCategory, String sDong, String sTel, String sAddress,
			String user_uId, String user_uIdType) {
		sqlSession.insert(nameSpace + ".UserStoreAdd");
		// TODO Auto-generated method stub
	}
	@Override
	public void UserStoreDelete(int sId) {
		// TODO Auto-generated method stub
		sqlSession.update(nameSpace + ".UserStoreDelete");
	}
	@Override
	public void UserStoreUpdate(String sName, String sCategory, String sDong, String sTel, String sAddress,
			int sId) {
		// TODO Auto-generated method stub
		sqlSession.update(nameSpace + ".UserStoreUpdate");
	}
	@Override
	public List<UserDateDto> UserDateSelect(String uId) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Dao : UserDateSelect:" + uId);
		return sqlSession.selectList(nameSpace + ".UserDateSelect");
	}

	
	
	

	
	//유저 가게 등록
	

}
