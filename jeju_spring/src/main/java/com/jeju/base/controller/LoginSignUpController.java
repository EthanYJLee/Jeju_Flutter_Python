package com.jeju.base.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jeju.base.service.LoginSignUpService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class LoginSignUpController {

	@Autowired
	LoginSignUpService service;

	// Desc: 회원가입
	// Date: 2023-02-21
	@RequestMapping("/join")
	public void SignUp(HttpServletRequest request) throws Exception {
		service.SignUp(request);
	}

	// Desc: ID 중복체크
	// Date: 2023-02-22
	@RequestMapping("/idcheck")
	public String IDCheck(HttpServletRequest request, Model model) throws Exception{
		service.IdCheck(request, model);
		
		return "result";
	}
	
	//Desc: 로그인
	//Date: 2023-02-22
	@RequestMapping("/login")
	public String Login(HttpServletRequest request, Model model) throws Exception{
		service.Login(request, model);
		
		return "result";
	}
	
	//Desc: 네이버로 회원가입이 되어 있는지 확인
	//Date: 2023-02-22
	@RequestMapping("/navercheck")
	public String NaverCheck(HttpServletRequest request, Model model) throws Exception{
		service.NaverCheck(request, model);
		
		return "result";
	}
}
