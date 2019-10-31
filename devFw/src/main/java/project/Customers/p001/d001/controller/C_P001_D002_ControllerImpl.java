package project.Customers.p001.d001.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.Customers.p001.d001.service.C_P001_D002_Service;
import project.Customers.p001.d001.vo.C_P001_D002_VO;

//import project.Customers.p001.d001.service.C_P001_D002_Service;
//import project.Customers.p001.d001.vo.C_P001_D002_VO;



@Controller("C_P001_D002_Controller")

public class C_P001_D002_ControllerImpl implements C_P001_D002_Controller{

	private static final Logger logger = LoggerFactory.getLogger(C_P001_D002_ControllerImpl.class);
	@Autowired
	C_P001_D002_Service c_p001_d002_Service;
	@Autowired
	C_P001_D002_VO c_p001_d002_VO;
	
	
	@Override
	@RequestMapping(value ="/Customers/p001/d001/main.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/main");
		return mav;
	}
	
	
	@Override
	@RequestMapping(value ="/Customers/p001/d001/loginInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView loginInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/C_P001_D002");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/Customers/p001/d001/joinInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView joinInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav2 = new ModelAndView("hm/C_P001_D001");
		return mav2;
	}
	
	@RequestMapping(value = "/Customers/p001/d001/check_id.do", method =  { RequestMethod.GET, RequestMethod.POST })
	public void check_id(@RequestParam("memberid") String memberid, HttpServletResponse response) throws Exception{
		System.out.println("안녕안녕안녕앙ㄴ녕아ㅏ아아아아아아아아아앙");
		c_p001_d002_Service.check_id(memberid, response);
		
	}
	
	@RequestMapping(value = "/Customers/p001/d001/check_email.do", method =  { RequestMethod.GET, RequestMethod.POST })
	public void check_email(@RequestParam("email") String email, HttpServletResponse response) throws Exception{
		c_p001_d002_Service.check_email(email, response);
	}
	
	@RequestMapping(value = "/Customers/p001/d001/join_member.do", method =  { RequestMethod.GET, RequestMethod.POST })
	public String join_member(@ModelAttribute C_P001_D002_VO member, RedirectAttributes rttr, HttpServletResponse response) throws Exception{
		rttr.addFlashAttribute("result", c_p001_d002_Service.join_member(member, response));
		return "hm/joinsuccess";
	}
	
	@RequestMapping(value = "/Customers/p001/d001/approval_member.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void approval_member(@ModelAttribute C_P001_D002_VO member, HttpServletResponse response) throws Exception{
		c_p001_d002_Service.approval_member(member, response);
	}
	
	 
		
		// 로그인
		@RequestMapping(value = "/Customers/p001/d001/login.do", method =  { RequestMethod.GET, RequestMethod.POST })
		public String login(@ModelAttribute C_P001_D002_VO member, HttpSession session, HttpServletResponse response) throws Exception{
			member = c_p001_d002_Service.login(member, response);
			session.setAttribute("member", member);
			return "hm/main";
		}
		
		// 로그아웃
		@RequestMapping(value = "/Customers/p001/d001/logout.do", method =  { RequestMethod.GET, RequestMethod.POST })
		public void logout(HttpSession session, HttpServletResponse response) throws Exception{
			session.invalidate();
//			session.removeAttribute("member");
			c_p001_d002_Service.logout(response);
		}
}




