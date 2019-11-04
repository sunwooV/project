package project.Sell.P001.D002.controller;

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
import org.springframework.web.servlet.ModelAndView;

import project.Sell.P001.D002.dao.S_P001_D002_DAO;

@Controller("S_P001_D002_Controller")
public class S_P001_D002_ControllerImpl implements S_P001_D002_Controller {
	@Autowired
	S_P001_D002_DAO S_P001_D002_Service;
	
	
	@Override
	@RequestMapping(value = "/detail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView detailProduct(@RequestParam(value="prod_number", required=false) String prod_number, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("prod_number", prod_number);	 
		
		List list = S_P001_D002_Service.detailProduct(searchMap);
		
		ModelAndView mav = new ModelAndView("sell/detailProduct");
		mav.addObject("detail", list);
		System.out.println("list c√≥∏Æ \n " + list);
		return mav;
	}
}
