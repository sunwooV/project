package project.Sell.P001.D006.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.Sell.P001.D002.service.S_P001_D002Service;
import project.Sell.P001.D006.service.S_P001_D006Service;

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
		
//		Map<String, Object> dataMap = new HashMap<String, Object>();
//		Enumeration enu = request.getParameterNames();
//		while (enu.hasMoreElements()) {
//			String name = (String)enu.nextElement();
//			String value = request.getParameter(name);
//			dataMap.put(name, value);
//			System.out.println(dataMap);
//		}
		
		List bidProduct = S_P001_D002Service.detailProduct(searchMap);

		ModelAndView mav = new ModelAndView("Popup/p001_d006_applyBid");
		
		mav.addObject("bidProduct", bidProduct);
		
		return mav;
	}
}
