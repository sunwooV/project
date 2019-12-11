package project.CS.P001.D004.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.CS.P001.D004.vo.CS_P001_D004VO;

public interface CS_P001_D004Controller {

	public ModelAndView cs(String command, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modifyboard(String private_qna_num, String board_num, HttpServletRequest request, HttpServletResponse response) throws Exception;

	//public ResponseEntity updateboard(HttpServletRequest request, HttpServletResponse response, @RequestParam(value="private_qna_num", required = false) String private_qna_num) throws Exception;
	public ResponseEntity updateboard(HttpServletRequest request, HttpServletResponse response) throws Exception;



}
