package project.Sell.P001.D005.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.Sell.P001.D001.service.S_P001_D001Service;
import project.Sell.P001.D002.service.S_P001_D002Service;
import project.Sell.P001.D005.service.S_P001_D005Service;

@Controller("S_P001_D005Controller")
public class S_P001_D005ControllerImpl implements S_P001_D005Controller {
	@Autowired
	S_P001_D005Service S_P001_D005Service;
	@Autowired
	S_P001_D002Service S_P001_D002Service;
	@Autowired
	S_P001_D001Service S_P001_D001Service;
	
	@Override
	@RequestMapping(value = "/modifyProduct.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView modifyProduct(@RequestParam(value="prod_number", required=false) String prod_number, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("prod_number", prod_number);	 
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
			System.out.println(dataMap);
		}
		
		String selectHigh = (String)dataMap.get("high_category");
		String selectMiddle = (String)dataMap.get("middle_category");
		
		List high_category = S_P001_D001Service.middle_category(searchMap);
		List middle_category = S_P001_D001Service.middle_category(searchMap);
		
		List modifyProd = S_P001_D002Service.detailProduct(searchMap);
		
		List tagList = S_P001_D002Service.tagList(searchMap);

		ModelAndView mav = new ModelAndView("Sell/p001_d001_enroll");
		mav.addObject("command", "modify");
		
		mav.addObject("modifyProd", modifyProd);
		mav.addObject("high_category", high_category);
		mav.addObject("middle_category", middle_category);
		
		mav.addObject("selectHigh", selectHigh);
		mav.addObject("selectMiddle", selectMiddle);
		mav.addObject("tagList", tagList);
		
		return mav;
	}

	@Override
	@RequestMapping(value = "/updateProduct.do", method = { RequestMethod.POST, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity updateProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("update 들어옴");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
			System.out.println(dataMap);
		}
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders(); // 헤더변경 시 사용
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");		
		try {
			S_P001_D005Service.updateProduct(dataMap);
			S_P001_D005Service.updateTag(dataMap);
			
			response.sendRedirect("/devFw/main.do");
//			RequestDispatcher dispatch = request.getRequestDispatcher("/Sell/P001/D001/searchList.do");
//			dispatch.forward(request, response);
		} catch (Exception e) {
			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='" + request.getContextPath() + "/enroll.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}		
		return resEnt;
	}
	
	@Override
	@RequestMapping(value = "/deleteProduct.do", method = { RequestMethod.POST, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity deleteProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("update 들어옴");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
			System.out.println(dataMap);
		}
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders(); // 헤더변경 시 사용
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");		
		try {
			S_P001_D005Service.deleteProduct(dataMap);
			
			response.sendRedirect("/devFw/main.do");
//			RequestDispatcher dispatch = request.getRequestDispatcher("/Sell/P001/D001/searchList.do");
//			dispatch.forward(request, response);
		} catch (Exception e) {
			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='" + request.getRequestURI();
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}		
		return resEnt;
	}
	
	
}
