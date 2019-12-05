package project.CS.P001.D003.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.CS.P001.D001.vo.PagingVO;
import project.CS.P001.D003.vo.CS_P001_D003VO;

public interface CS_P001_D003Controller {
	


	public ModelAndView privateInit(PagingVO vo, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView eventDetail(@RequestParam("private_qna_num") String private_qna_num, PagingVO vo, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,HttpServletRequest request,
		HttpServletResponse response) throws Exception;

	public void managecomment(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
