package com.jeju.base.service;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jeju.base.dao.LoginSignUpDao;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class LoginSignUpServiceImpl implements LoginSignUpService {

	@Autowired
	LoginSignUpDao dao;

	// Desc: 회원가입
	// Date: 2023-02-21
	@Override
	public void SignUp(HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub

		String uId = request.getParameter("uId");
		String uName = request.getParameter("uName");
		String uIdType = request.getParameter("uIdType");
		String uPassword = request.getParameter("uPassword");
		String uNickname = request.getParameter("uNickname");
		String uEmail = request.getParameter("uEmail");
		String uSex = request.getParameter("uSex");
		String uBirth = request.getParameter("uBirth");

		dao.SignUp(uId, uIdType, uPassword, uName, uNickname, uEmail, uSex, uBirth);

	}

	// Desc: ID 중복체크
	// Date: 2023-02-22
	@Override
	public void IdCheck(HttpServletRequest request, Model model) throws Exception {
		// TODO Auto-generated method stub

		String uId = request.getParameter("uId");
		int check = dao.IdCheck(uId);
		
		JSONObject jsonList = new JSONObject();
		JSONArray itemList = new JSONArray();
		JSONObject tempJson = new JSONObject();
		
		tempJson.put("check", check);
		itemList.add(tempJson);
		jsonList.put("results", itemList);
		model.addAttribute("result", jsonList.toJSONString());
	}
}
