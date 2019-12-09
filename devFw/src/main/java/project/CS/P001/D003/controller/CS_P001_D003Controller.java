package project.CS.P001.D003.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.CS.P001.D001.vo.PagingVO;
import project.CS.P001.D003.vo.CS_P001_D003VO;

public interface CS_P001_D003Controller {
	


	
	public ModelAndView eventDetail(String private_qna_num, PagingVO vo, String board_num, String nowPage,
			String cntPerPage,HttpServletRequest request,
		HttpServletResponse response) throws Exception;

	public void managecomment(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView privateInit(PagingVO vo, String nowPage, String cntPerPage, String board_num, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
