package project.Customers.P002.D002.controller;

import java.io.IOException;
import java.util.Enumeration;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.Customers.P002.D002.service.C_P002_D002Service;
import project.Sell.P001.D003.vo.S_P001_D003VO;

@Controller("C_P002_D002Controller")
public class C_P002_D002ControllerImpl implements C_P002_D002Controller{
	private static final Logger Logger = LoggerFactory.getLogger(C_P002_D002ControllerImpl.class);
	
	@Autowired
	C_P002_D002Service C_P002_D002Service;
	@Autowired
	private HttpSession session;
	
	@Override
	@RequestMapping(value = "/mpBuyerOrderList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mypage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> searchMap = new HashMap<String, Object>();
		String memberId = (String) session.getAttribute("memberid");
	
		System.out.println("마이페이지 "+memberId);
		
		dataMap.put("memberId", memberId);
		searchMap.put("buyer_memberid", memberId);
		System.out.println("마이페이지 "+searchMap);
		
		List myBidList = C_P002_D002Service.myBidList(dataMap);
		List myBuyerList = C_P002_D002Service.myBuyerList(searchMap);
		ModelAndView mav = new ModelAndView("Customers/p002_d002_mypageBuyerOrderList");
		
		mav.addObject("myBidList", myBidList);
		mav.addObject("myBuyerList",myBuyerList);
		return mav;
	}
	
	
}
