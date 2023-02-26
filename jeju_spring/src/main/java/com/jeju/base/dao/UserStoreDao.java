package com.jeju.base.dao;

import java.util.List;

import com.jeju.base.dto.UserDateDto;
import com.jeju.base.dto.UserStoreDto;

public interface UserStoreDao {
	public List<UserStoreDto> UserStoreSelect(String uId) throws Exception;
	public void UserStoreAdd(String sName, String sCategory,String sDong,String sTel,String sAddress,String user_uId,String user_uIdType);
	public void UserStoreDelete(int sId);
	public void UserStoreUpdate(String sName, String sCategory,String sDong,String sTel, String sAddress, int sId);
	
	public List<UserDateDto> UserDateSelect(String uId) throws Exception;
}
