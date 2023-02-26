package com.jeju.base.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

public interface SearchIdPwService {
	public void searchId(HttpServletRequest request, Model model) throws Exception;
	public void searchPw(HttpServletRequest request, Model model) throws Exception;
	public void updatePw(HttpServletRequest request, Model model) throws Exception;
}
