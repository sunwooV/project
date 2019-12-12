package project.Customers.P002.D005.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import project.Customers.P002.D005.vo.C_P002_D005VO;

public interface C_P002_D005Controller {
	public ModelAndView chatInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
}