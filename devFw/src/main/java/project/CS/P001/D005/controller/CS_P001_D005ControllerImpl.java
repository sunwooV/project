package project.CS.P001.D005.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.CS.P001.D003.service.CS_P001_D003Service;
import project.CS.P001.D003.vo.CS_P001_D003VO;


@Controller("CS_P001_D005Controller")
public class CS_P001_D005ControllerImpl implements CS_P001_D005Controller{
	private static final Logger Logger = LoggerFactory.getLogger(CS_P001_D005ControllerImpl.class);
	   @Autowired
	   CS_P001_D003Service cs_p001_d003_service;

	@Override
	@RequestMapping(value = "/csWriteComplete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView csWriteComplete(HttpServletRequest request, HttpServletResponse response, @RequestParam(value="board_num", required = false) String board_num) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("board_num11111111111111111"+board_num);
		ModelAndView mav = new ModelAndView("CS/p001_d005_csWriteComplete");
		mav.addObject("board_num",board_num);
		return mav;
	}
}
