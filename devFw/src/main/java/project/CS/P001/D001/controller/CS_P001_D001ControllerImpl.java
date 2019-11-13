package project.CS.P001.D001.controller;

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


@Controller("CS_P001_D001Controller")
public class CS_P001_D001ControllerImpl implements CS_P001_D001Controller{
	private static final Logger Logger = LoggerFactory.getLogger(CS_P001_D001ControllerImpl.class);
	@Autowired
	CS_P001_D001Service cs_p001_d001Service;
	@Autowired
	CS_P001_D001VO cs_p001_d001VO;

	@Override
	@RequestMapping(value = "/cs.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView cs(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("CS/p001_d001_cs");
		return mav;
	}
}
