package com.jeju.base.service;



import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

@Service
public interface UserStoreService {
	public void UserStoreSelect(HttpServletRequest request, Model model) throws Exception;
	public void UserStoreAdd(HttpServletRequest request) throws Exception;
	public void UserStoreDelete(HttpServletRequest request) throws Exception;
	public void UserStoreUpdate(HttpServletRequest request) throws Exception;
	
	public void UserDateSelect(HttpServletRequest request, Model model) throws Exception;
}
