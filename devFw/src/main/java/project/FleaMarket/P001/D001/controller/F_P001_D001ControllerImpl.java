package project.FleaMarket.P001.D001.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.Customers.P003.D001.service.C_P003_D001Service;
import project.FleaMarket.P001.D001.service.F_P001_D001Service;
import project.FleaMarket.P001.D001.vo.F_P001_D001VO;

@Controller("F_P001_D001Controller")
public class F_P001_D001ControllerImpl implements F_P001_D001Controller {
	private static final Logger logger = LoggerFactory.getLogger(F_P001_D001ControllerImpl.class);
	@Autowired
	F_P001_D001Service d001Service;
	@Autowired
	C_P003_D001Service C_P003_D001Service;
	@Autowired
	F_P001_D001VO d001VO;

	@Override
	@RequestMapping(value = "/fleaCreateStoreType.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView fleaCreateStoreType(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("FleaMarket/p001_d001_fleaCreateStoreType");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/fleaCreateStoreForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView fleaCreateStoreForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("FleaMarket/p001_d001_fleaCreateStoreForm");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/fleaCreateStoreInsert.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity fleaCreateStoreInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
		}
		
		String memberid = (String)session.getAttribute("memberid");
		System.out.println("멤버아이디는 "+ memberid);
		dataMap.put("memberid", memberid);
		dataMap.put("memberId", memberid);

		System.out.println("dataMap::::::::::" + dataMap);
		
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders(); 
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");		
		try {
			d001Service.insertMember(dataMap);
			System.out.println("::insertMember완료::");
			C_P003_D001Service.changeSeller(dataMap);
			C_P003_D001Service.fleaUpdateSeller(dataMap);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("fleaMain.do");
			dispatch.forward(request, response);
		} catch (Exception e) {
			message = " <script>";
			message += " alert('오류가 발생하였습니다.');";
			message += " location.href='" + request.getContextPath() + "/fleaMain.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}		
		return resEnt;
	}
	

}
