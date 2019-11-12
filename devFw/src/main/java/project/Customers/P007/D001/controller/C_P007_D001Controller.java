package project.Customers.P007.D001.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface C_P007_D001Controller {
	public ModelAndView pointsearchInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map pointsearchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String pointsearchList2(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map pointsaveData(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
