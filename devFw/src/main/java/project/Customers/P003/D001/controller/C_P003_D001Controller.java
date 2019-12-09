package project.Customers.P003.D001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.ModelAndView;

public interface C_P003_D001Controller {
	public ModelAndView enrollSeller(String msg, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView sellerBasic(String redirectURL, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity insertSellerInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
