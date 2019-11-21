package project.Customers.P006.D001.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.Customers.P006.D001.vo.C_P006_D001VO;

public interface C_P006_D001Controller {
	public ModelAndView outsearchInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map outsearchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String outsearchList2(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map outsaveData(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
