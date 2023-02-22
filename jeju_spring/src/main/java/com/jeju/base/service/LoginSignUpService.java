package com.jeju.base.service;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

@Service
public interface LoginSignUpService {

	public void SignUp(HttpServletRequest request) throws Exception;
	public void IdCheck(HttpServletRequest request, Model model) throws Exception;
	public void Login(HttpServletRequest request, Model model) throws Exception;
	public void NaverCheck(HttpServletRequest request, Model model) throws Exception;
}
