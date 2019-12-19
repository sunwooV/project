package project.Customers.P002.D005.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.Customers.P001.D001.vo.C_P001_D001VO;
import project.Customers.P002.D005.service.C_P002_D005Service;
import project.Customers.P002.D005.vo.C_P002_D005VO;
import project.Sell.P001.D002.service.S_P001_D002Service;
import project.Sell.P001.D002.vo.S_P001_D002VO;


@Controller("C_P002_D005Controller")
public class C_P002_D005ControllerImpl implements C_P002_D005Controller{

		private static final Logger logger = LoggerFactory.getLogger(C_P002_D005ControllerImpl.class);
		@Autowired
		C_P002_D005Service c_p002_d005_Service;
		@Autowired
		C_P001_D001VO c_p001_d001_VO;
		@Autowired
		S_P001_D002Service s_p001_d002service;
		
		@Override
		@RequestMapping(value ="/chatInit.do", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView chatInit(@RequestParam(value="prod_number", required=false) String prod_number,HttpServletRequest request, HttpServletResponse response) throws Exception {
//			C_P001_D001VO memberInfo = (C_P001_D001VO) request.getSession().getAttribute("memberInfo");
//			String memberid = memberInfo.getMemberid();
//			System.out.println("memberId ::::::::::::::: " + memberid);
////			List<C_P001_D001VO> initList = new ArrayList<C_P001_D001VO>();
////			initList = c_p002_d005_Service.selectMemberList(memberid);	
//			Map<String, Object> searchMap = new HashMap<String, Object>();
//			searchMap.put("prod_number", prod_number);
//			List prodList = s_p001_d002service.detailProduct(searchMap);
//			List initList = c_p002_d005_Service.selectMemberList(memberid);
//		
//			
//			ModelAndView mav = new ModelAndView("Customers/p002_d005_chat");
//			mav.addObject("memberList", initList);
//			mav.addObject("prodList", prodList);
//			mav.addObject("prod_number", prod_number);
		
			
			Map<String, Object> searchMap = new HashMap<String, Object>();
			
			//메시지로 문의하기 눌렀을 경우
			if(prod_number != null) {
				ModelAndView mav = new ModelAndView("Customers/p002_d005chat2");
				searchMap.put("prod_number", prod_number);
				
				String sellerId = c_p002_d005_Service.sellerId(searchMap);
				searchMap.put("memberid", sellerId);
				List selectMember = c_p002_d005_Service.selectSeller(searchMap);
				searchMap.put("prod_number", prod_number);
				List prodList = s_p001_d002service.detailProduct(searchMap);
				System.out.println("타이틀입니다요=="+((S_P001_D002VO)prodList.get(0)).getProd_title());
				List initList = c_p002_d005_Service.selectMemberList(searchMap);
				System.out.println("sellerId는???" + sellerId);
				mav.addObject("memberList", selectMember);
				mav.addObject("prodList", prodList);
				mav.addObject("sellerId", sellerId);
			
				return mav;
			}
			
			else {
				ModelAndView mav = new ModelAndView("Customers/p002_d005_chat");
				C_P001_D001VO memberInfo = (C_P001_D001VO) request.getSession().getAttribute("memberInfo");
				String memberid = memberInfo.getMemberid();
				System.out.println("memberId ::::::::::::::: " + memberid);
			
			
				searchMap.put("memberid", memberid);
	//			List<C_P001_D001VO> initList = new ArrayList<C_P001_D001VO>();
	//			initList = c_p002_d005_Service.selectMemberList(memberid);	
				
				List initList = c_p002_d005_Service.selectMemberList(searchMap);
				
				mav.addObject("memberList", initList);
				return mav;
			}
	
			
			
		
			
		
			
		
		}
}
