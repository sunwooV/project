package project.CS.P001.D002.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.CS.P001.D002.service.CS_P001_D002Service;
import project.CS.P001.D002.vo.CS_P001_D002VO;


@Controller("CS_P001_D002Controller")
public class CS_P001_D002ControllerImpl implements CS_P001_D002Controller {
	private static final Logger Logger = LoggerFactory.getLogger(CS_P001_D002ControllerImpl.class);

	@Autowired
	CS_P001_D002Service cs_p001_d002Service;

	@Autowired
	CS_P001_D002VO cs_p001_d002VO;


	
	@Override
	@RequestMapping(value = "/cslist1.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView cslist1(@RequestParam(value="division", required=false) String division, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		
		List faqList = cs_p001_d002Service.listFaq();

		System.out.println("자주묻는질문 상세페이지" + ((CS_P001_D002VO) faqList.get(0)).getDivision());

		ModelAndView mav = new ModelAndView("CS/p001_d002_list1");
		mav.addObject("faqList", faqList);
		return mav;
	}
	
	
	@Override
	@RequestMapping(value = "/cslist2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView cslist2(@RequestParam(value="division", required=false) String division, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		
		List refuList = cs_p001_d002Service.listRefu();

		System.out.println("교환,환불 상세페이지" + ((CS_P001_D002VO) refuList.get(0)).getDivision());

		ModelAndView mav = new ModelAndView("CS/p001_d002_list2");
		mav.addObject("refuList", refuList);
		return mav;
	}
	
	
	
	
	@Override
	@RequestMapping(value = "/cslist3.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView cslist3(@RequestParam(value="division", required=false) String division, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		
		List delivList = cs_p001_d002Service.listDeliv();

		System.out.println("배송문의 상세페이지" + ((CS_P001_D002VO) delivList.get(0)).getDivision());

		ModelAndView mav = new ModelAndView("CS/p001_d002_list3");
		mav.addObject("delivList", delivList);
		return mav;
	}
	
	
	
	
	
	
	@Override
	@RequestMapping(value = "/cslist4.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView cslist4(@RequestParam(value="division", required=false) String division, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		
		List couponList = cs_p001_d002Service.listCoupon();

		System.out.println("이벤트/할인쿠폰 상세페이지" + ((CS_P001_D002VO) couponList.get(0)).getDivision());

		ModelAndView mav = new ModelAndView("CS/p001_d002_list4");
		mav.addObject("couponList", couponList);
		return mav;
	}
	
	
	
	@Override
	@RequestMapping(value = "/cslist5.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView cslist5(@RequestParam(value="division", required=false) String division, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		
		List payList = cs_p001_d002Service.listPay();

		System.out.println("주문결제 상세페이지" + ((CS_P001_D002VO) payList.get(0)).getDivision());

		ModelAndView mav = new ModelAndView("CS/p001_d002_list5");
		mav.addObject("payList", payList);
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

