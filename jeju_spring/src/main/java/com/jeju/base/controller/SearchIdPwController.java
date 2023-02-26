package com.jeju.base.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jeju.base.service.SearchIdPwService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class SearchIdPwController {

	@Autowired
	SearchIdPwService service;

	// Id 찾기(2023-02-22)
	@RequestMapping("/SearchId")
	public String SearchId(HttpServletRequest request, Model model) throws Exception{
		service.searchId(request, model);
		
		return "result";
	}

    // Pw 찾기(2023-02-23)
	@RequestMapping("/SearchPw")
	public String SearchPw(HttpServletRequest request, Model model) throws Exception{
		service.searchPw(request, model);
		
		return "result";
	}
	
	// Pw 가져오기(2023-02-23)
	@RequestMapping("/UpdatePw")
	public String UpdatePw(HttpServletRequest request, Model model) throws Exception{
		service.updatePw(request, model);
		
		return "result";
	}
}
