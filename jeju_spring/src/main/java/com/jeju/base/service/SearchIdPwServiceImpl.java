package com.jeju.base.service;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jeju.base.dao.SearchIdPwDao;
import com.jeju.base.dto.SearchDto;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class SearchIdPwServiceImpl implements SearchIdPwService {
	
	@Autowired
	SearchIdPwDao dao;

	// 아이디 찾기(2023-02-22)
	@Override
	public void searchId(HttpServletRequest request, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String uName = request.getParameter("uName");
		String uEmail = request.getParameter("uEmail");
		
		int check = dao.SearchId(uName, uEmail);
		
		String uid = "";
		
		if (check == 1) {
			 uid = dao.FindId(uName, uEmail);
		}
		
		System.out.println(uid);  // 테스트용
		
		JSONObject jsonList = new JSONObject();
		JSONArray itemList = new JSONArray();
		JSONObject tempJson = new JSONObject();
		
		tempJson.put("check", uid);
		itemList.add(tempJson);
		jsonList.put("results", itemList);
		
		
		model.addAttribute("result",jsonList);
	}

	// 비밀번호 찾기(2022-02-23)
	@Override
	public void searchPw(HttpServletRequest request, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String uName = request.getParameter("uName");
		String uid = request.getParameter("uid");
		String uEmail = request.getParameter("uEmail");
		
		int check2 = dao.SearchPw(uName, uid, uEmail);
		
		String uPassword = "";
		
		if (check2 == 1) {
			System.out.println("들어갔니??");
			uPassword = dao.FindPw(uName, uid, uEmail);
		}
		
		System.out.println(uPassword);  // 테스트용
		
		JSONObject jsonList = new JSONObject();
		JSONArray itemList = new JSONArray();
		JSONObject tempJson = new JSONObject();
		
		tempJson.put("check2", uPassword);
		itemList.add(tempJson);
		jsonList.put("results", itemList);


		model.addAttribute("result",jsonList);		
	}

	// 비밀번호 수정하기(2023-02-23)
	@Override
	public void updatePw(HttpServletRequest request, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String uPassword = request.getParameter("uPassword");
		String uid = request.getParameter("uid");
		
		int check3 = dao.UpdatePw(uPassword,uid);
		
		System.out.println(uPassword);  // 테스트용
		
		JSONObject jsonList = new JSONObject();
		JSONArray itemList = new JSONArray();
		JSONObject tempJson = new JSONObject();
		
		tempJson.put("check3", uPassword);
		itemList.add(tempJson);
		jsonList.put("results", itemList);
		
		
		model.addAttribute("result",jsonList);		
	}

}

