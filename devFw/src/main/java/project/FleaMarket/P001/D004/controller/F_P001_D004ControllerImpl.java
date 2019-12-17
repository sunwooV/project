package project.FleaMarket.P001.D004.controller;

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

import project.FleaMarket.P002.D001.service.F_P002_D001Service;
import project.FleaMarket.P001.D004.service.F_P001_D004Service;
import project.FleaMarket.P001.D004.vo.F_P001_D004VO;
import project.Customers.P001.D001.service.C_P001_D001Service;

@Controller("F_P001_D004Controller")
public class F_P001_D004ControllerImpl implements F_P001_D004Controller {
	private static final Logger logger = LoggerFactory.getLogger(F_P001_D004ControllerImpl.class);
	@Autowired
	F_P001_D004Service f_p001_d004Service;
	//@Autowired
    //F_P002_D001Service f_p002_d001Service;
	@Autowired
	F_P001_D004VO d004VO;
	@Autowired
	C_P001_D001Service c_p001_d001Service;

	@Override
	@RequestMapping(value = "/fleaCreateStoreApproval.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView fleaCreateStoreApproval(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); 
		List list = f_p001_d004Service.searchList(searchMap);
		
		System.out.println("dataMap::::::::::" + list);

		ModelAndView mav = new ModelAndView("FleaMarket/p001_d004_fleaCreateStoreApproval");
		mav.addObject("searchList", list);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/fleaApprovalStatusUpdate.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity fleaApprovalStatusUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("개설승인버튼 클릭시(fleaApprovalStatusUpdate.do)!!");
		String memberid = request.getParameter("memberid");
		System.out.println("memberid:::" + memberid);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
		}
		String flea = (String)dataMap.get("memberid");	 
		System.out.println("플리 개설 승인 :::memberid =" + flea);
		
		System.out.println("===============dataMap="+dataMap);
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");		
		try {
			f_p001_d004Service.updateMember(dataMap);
			response.sendRedirect("/devFw/fleaCreateStoreApproval.do");
			System.out.println("update 완료");
					
			f_p001_d004Service.insertMember(dataMap);
			System.out.println("insert 완료");
			
			c_p001_d001Service.updateFleaMember(dataMap);
			
			
			//RequestDispatcher dispatch = request.getRequestDispatcher("FleaMarket/fleaCreateStoreApproval.do");
			//dispatch.forward(request, response);
			
		} catch (Exception e) {
			message = " <script>";
			message += " alert('에러가 발생하였습니다.');";
			message += " location.href='" + request.getContextPath() + "/devFw/fleaMystore.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}		
		return resEnt;
	}

	
	
}
