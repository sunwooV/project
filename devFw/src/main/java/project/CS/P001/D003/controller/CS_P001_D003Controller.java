package project.CS.P001.D003.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.CS.P001.D001.vo.PagingVO;

public interface CS_P001_D003Controller {
	


	public ModelAndView privateInit(PagingVO vo, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView eventDetail(@RequestParam("private_qna_num") int private_qna_num,
			HttpServletRequest request,HttpServletResponse response) throws Exception;

}
