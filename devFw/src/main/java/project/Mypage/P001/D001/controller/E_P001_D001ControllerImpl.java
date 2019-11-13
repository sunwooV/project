package project.Mypage.P001.D001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.CS.P001.D001.service.CS_P001_D001Service;
import project.CS.P001.D001.vo.CS_P001_D001VO;
import project.Mypage.P001.D001.service.E_P001_D001Service;
import project.Mypage.P001.D001.vo.E_P001_D001VO;


@Controller("E_P001_D001Controller")
public class E_P001_D001ControllerImpl implements E_P001_D001Controller{
	private static final Logger Logger = LoggerFactory.getLogger(E_P001_D001ControllerImpl.class);
	@Autowired
	E_P001_D001Service e_p001_d001Service;
	@Autowired
	E_P001_D001VO e_p001_d001VO;

	@Override
	@RequestMapping(value = "/mypage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView e(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("Mypage/Mypage");
		return mav;
	}
}
