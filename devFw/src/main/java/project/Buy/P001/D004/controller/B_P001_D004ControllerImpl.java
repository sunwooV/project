package project.Buy.P001.D004.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.Buy.P001.D004.service.B_P001_D004Service;
import project.Buy.P001.D004.vo.B_P001_D004VO;
import project.Customers.P002.D009.service.C_P002_D009Service;
import project.Customers.P002.D009.vo.C_P002_D009VO;


@Controller("B_P001_D004Controller")
public class B_P001_D004ControllerImpl implements B_P001_D004Controller{
	private static final Logger Logger = LoggerFactory.getLogger(B_P001_D004ControllerImpl.class);
	@Autowired
	B_P001_D004Service b_p001_d004Service;
	@Autowired
	B_P001_D004VO b_p001_d004VO;
	@Autowired
	C_P002_D009VO c_p002_d009vo;
	@Autowired
	C_P002_D009Service c_p002_d009Service;

	@Override
	@RequestMapping(value = "/payInfo.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView insertPaymentInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		System.out.println("dkanrjak======================="+request.getParameter("ArrayToJSon"));
		ModelAndView mav = new ModelAndView("Buy/p001_d004_payInfo");
		mav.addObject("ArrayToJSon",request.getParameter("ArrayToJSon"));
		return mav;
	}

	@Override
	@RequestMapping(value="/getAddr.do")
	@ResponseBody
	public List<C_P002_D009VO> getAddr(@ModelAttribute C_P002_D009VO member, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String memberid = (String)member.getMemberid();
		List check = (List) c_p002_d009Service.check(memberid, response);
		return check;
	}

	
	
	

}
