package project.Customers.P008.D001.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface C_P008_D001Controller {
	public ModelAndView gradesearchInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map gradesearchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String gradesearchList2(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map gradesaveData(HttpServletRequest request, HttpServletResponse response) throws Exception;


}
