package project.Buy.P001.D004.controller;

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

import project.Buy.P001.D004.service.B_P001_D004Service;
import project.Buy.P001.D004.vo.B_P001_D004VO;


@Controller("B_P001_D004Controller")
public class B_P001_D004ControllerImpl implements B_P001_D004Controller{
	private static final Logger Logger = LoggerFactory.getLogger(B_P001_D004ControllerImpl.class);
	@Autowired
	B_P001_D004Service b_p001_d004Service;
	@Autowired
	B_P001_D004VO b_p001_d004VO;

	@Override
	@RequestMapping(value = "/payInfo.do", method = { RequestMethod.GET, RequestMethod.POST })

	public ModelAndView insertPaymentInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView("Buy/payInfo");
		return mav;
	}
	
	
}
