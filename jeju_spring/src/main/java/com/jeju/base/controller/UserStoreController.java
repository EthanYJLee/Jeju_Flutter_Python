package com.jeju.base.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jeju.base.service.UserStoreService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UserStoreController {
	
	@Autowired
	UserStoreService service;
	
	@RequestMapping("/storeSelect")
	public String UserStoreSelect(HttpServletRequest request, Model model) throws Exception {
		service.UserStoreSelect(request,model);
		return "result";
	}
	
	@RequestMapping("/storeAdd")
	public void UserStoreAdd(HttpServletRequest request) throws Exception {
		service.UserStoreAdd(request);
	}
	
	@RequestMapping("/storeDelete")
	public void UserStoreDelete(HttpServletRequest request) throws Exception {
		service.UserStoreDelete(request);
	}
	
	@RequestMapping("/storeUpdate")
	public void UserStoreUpdate(HttpServletRequest request) throws Exception {
		service.UserStoreUpdate(request);
	}
	
	@RequestMapping("/userSelect")
	public String UserDateSelect(HttpServletRequest request, Model model) throws Exception{
		System.out.println("userSelect");
		service.UserDateSelect(request, model);
		return "result";
	}
	
}
