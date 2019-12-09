package project.CS.P001.D001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.CS.P001.D001.vo.PagingVO;
import project.CS.P001.D003.vo.CS_P001_D003VO;

public interface CS_P001_D001Controller {

	//public ModelAndView cs(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView eventDetail(String no_number, HttpServletRequest request,
			HttpServletResponse response) throws Exception;





	ModelAndView cs(PagingVO vo, String nowPage, String cntPerPage, String board_num, HttpServletRequest request,
			HttpServletResponse response) throws Exception;



	/*
	 * public ModelAndView delivery(String division, HttpServletRequest request,
	 * HttpServletResponse response) throws Exception;
	 */
}
