package project.CS.P001.D002.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.CS.P001.D001.vo.PagingVO;
import project.CS.P001.D003.vo.CS_P001_D003VO;

public interface CS_P001_D002Controller {

	//public ModelAndView cs(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView cslist1(String division, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	ModelAndView cslist2(String division, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	ModelAndView cslist3(String division, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	ModelAndView cslist4(String division, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	ModelAndView cslist5(String division, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	


}
