package project.CS.P001.D001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.CS.P001.D001.vo.PagingVO;

public interface CS_P001_D001Controller {

	//public ModelAndView cs(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView eventDetail(@RequestParam("NO_NUMBER") String no_number, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView cs(PagingVO vo,@RequestParam("nowPage") String nowPage,  @RequestParam(value="cntPerPage") String cntPerPage, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	/*
	 * public ModelAndView delivery(String division, HttpServletRequest request,
	 * HttpServletResponse response) throws Exception;
	 */
}
