package project.Sell.P001.D006.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import project.Sell.P001.D002.service.S_P001_D002Service;
import project.Sell.P001.D006.service.S_P001_D006Service;

import project.Sell.P001.D002.vo.S_P001_D002VO;
import project.Sell.P001.D006.vo.S_P001_D006VO;

@Controller("S_P001_D006Controller")
public class S_P001_D006ControllerImpl implements S_P001_D006Controller {
	@Autowired
	S_P001_D002Service S_P001_D002Service;
	@Autowired
	S_P001_D006Service S_P001_D006Service;
	
	@Override
	@RequestMapping(value = "/bidProduct.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView bidProduct(@RequestParam(value="prod_number", required=false) String prod_number, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("prod_number", prod_number);	 
		
		List bidProduct = S_P001_D002Service.detailProduct(searchMap);
		
		ModelAndView mav = new ModelAndView("Popup/p001_d006_applyBid");
		
//		S_P001_D006VO bid_vo = new S_P001_D006VO();
//		bid_vo.setProd_number(((S_P001_D002VO)bidProduct.get(0)).getProd_number());
//		session.setAttribute("bid_vo", bid_vo);
		
		mav.addObject("bidProduct", bidProduct);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/insertBid.do", method = { RequestMethod.POST, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity insertBid(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> dataMap = new HashMap<String, Object>(); //받아온 파라미터 값들 넣을 map
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
			S_P001_D006Service.insertBid(dataMap);
			S_P001_D006Service.updateProduct(dataMap);
			
			response.sendRedirect("/devFw/successBid.do");

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
	
	@Override
	@RequestMapping(value = "/successBid.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView successBid(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		//List bidProduct = S_P001_D002Service.detailProduct(searchMap);
		
		ModelAndView mav = new ModelAndView("Popup/p001_d006_successBid");
		
		//mav.addObject("bidProduct", bidProduct);
		
		return mav;
	}
}
