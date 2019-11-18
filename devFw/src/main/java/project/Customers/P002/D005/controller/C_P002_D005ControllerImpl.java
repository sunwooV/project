package project.Customers.P002.D005.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.Customers.P001.D001.vo.C_P001_D001VO;
import project.Customers.P002.D005.service.C_P002_D005Service;


@Controller("C_P002_D005Controller")
public class C_P002_D005ControllerImpl implements C_P002_D005Controller{

		private static final Logger logger = LoggerFactory.getLogger(C_P002_D005ControllerImpl.class);
		@Autowired
		C_P002_D005Service c_p002_d005_Service;
		@Autowired
		C_P001_D001VO c_p001_d001_VO;
		
		
		@Override
		@RequestMapping(value ="/chatInit.do", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView chatInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
			C_P001_D001VO memberInfo = (C_P001_D001VO) request.getSession().getAttribute("memberInfo");
			String memberid = memberInfo.getMemberid();
			List<C_P001_D001VO> initList = new ArrayList<C_P001_D001VO>();
			initList = c_p002_d005_Service.selectMemberList(memberid);		
			ModelAndView mav = new ModelAndView("Customers/p002_d005_chat");
			mav.addObject("memberList",initList);
			
			return mav;
		
		}
}
