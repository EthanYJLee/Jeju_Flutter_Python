package com.jeju.base.service;



import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jeju.base.dao.UserStoreDao;
import com.jeju.base.dto.UserDateDto;
import com.jeju.base.dto.UserStoreDto;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class UserStoreServiceImpl implements UserStoreService{
	
	@Autowired
	UserStoreDao dao;

	@Override
	public void UserStoreSelect(HttpServletRequest request, Model model) throws Exception {
		// TODO Auto-generated method stub
		
		String uId  = request.getParameter("uId");
		
		JSONObject jsonList = new JSONObject();
	    JSONArray itemList = new JSONArray();
	    
	    List<UserStoreDto> dtos = dao.UserStoreSelect(uId);
	    
	    for(int i =0; i<dtos.size(); i++) {
	    	JSONObject tempJson = new JSONObject();
	    	tempJson.put("sId", dtos.get(i).getsId());
	    	tempJson.put("sName", dtos.get(i).getsName());
	    	tempJson.put("sCategory", dtos.get(i).getsCategory());
	    	tempJson.put("sDong", dtos.get(i).getsDong());
	    	tempJson.put("sTel", dtos.get(i).getsTel());
	    	tempJson.put("sAddress", dtos.get(i).getsAddress());
	    	
	    	itemList.add(tempJson);
	    }
        jsonList.put("results",itemList);
        model.addAttribute("result", jsonList.toJSONString());

	   
	}

	@Override
	public void UserStoreAdd(HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		String sName = request.getParameter("sName");
		String sCategory = request.getParameter("sCategory");
		String sDong = request.getParameter("sDong");
		String sTel = request.getParameter("sTel");
		String sAddress = request.getParameter("sAddress");
		String user_uId = request.getParameter("user_uId");
		String user_uIdType = request.getParameter("user_uIdType");
		
		
		dao.UserStoreAdd(sName, sCategory, sDong, sTel, sAddress, user_uId, user_uIdType);
	}

	@Override
	public void UserStoreDelete(HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		int sId = Integer.parseInt(request.getParameter("sId"));
		System.out.println("sId" + sId);
		
		dao.UserStoreDelete(sId);
	}
	//유저 가게 Select

	@Override
	public void UserStoreUpdate(HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		String sName = request.getParameter("sName");
		String sCategory = request.getParameter("sCategory");
		String sDong = request.getParameter("sDong");
		String sTel = request.getParameter("sTel");
		String sAddress = request.getParameter("sAddress");
		int sId = Integer.parseInt(request.getParameter("sId"));

		dao.UserStoreUpdate(sName, sCategory, sDong, sTel, sAddress, sId);
	}

	@Override
	public void UserDateSelect(HttpServletRequest request, Model model) throws Exception {
		// TODO Auto-generated method stub
         String uId  = request.getParameter("uId");
         System.out.println("UserDataSelect :" + uId );
		
		JSONObject jsonList = new JSONObject();
	    JSONArray itemList = new JSONArray();
	    
	    List<UserDateDto> dtos = dao.UserDateSelect(uId);
	    
	    System.out.println("UserDataSelect End:" + uId );
	    for(int i =0; i<dtos.size(); i++) {
	    	JSONObject tempJson = new JSONObject();
	    	tempJson.put("uPassword", dtos.get(i).getuPassword());
	    	tempJson.put("uName", dtos.get(i).getuName());
	    	tempJson.put("uNickname", dtos.get(i).getuNickname());
	    	tempJson.put("uEmail", dtos.get(i).getuEmail());
	    	tempJson.put("uSex", dtos.get(i).getuSex());
	    	tempJson.put("uBirth", dtos.get(i).getuBirth());
	    	
	    	itemList.add(tempJson);
	    }
        jsonList.put("results",itemList);
        model.addAttribute("result", jsonList.toJSONString());

	}

	
	

}
