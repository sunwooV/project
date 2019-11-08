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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.Sell.P001.D001.vo.S_P001_D001VO;
import project.Sell.P001.D002.service.S_P001_D002Service;

@Controller("S_P001_D002Controller")
public class S_P001_D002ControllerImpl implements S_P001_D002Controller {
	@Autowired
	S_P001_D002Service S_P001_D002Service;
	
	
	@Override
	@RequestMapping(value = "/detail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView detailProduct(@RequestParam(value="prod_number", required=false) String prod_number, @RequestParam(value="prod_category_code", required=false) String prod_category_code,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> searchMap2 = new HashMap<String, Object>();

		searchMap.put("prod_number", prod_number);	 
		searchMap2.put("prod_category_code", prod_category_code);	 
		
		List list = S_P001_D002Service.detailProduct(searchMap);
		List middle_category = S_P001_D002Service.middle_category(searchMap2);
		
		searchMap2.put("high_category", ((S_P001_D001VO)middle_category.get(0)).getHigh_category());
		List high_category = S_P001_D002Service.high_category(searchMap2);
		
		List auction_left_date = S_P001_D002Service.auction_left_date(searchMap);
		System.out.println(auction_left_date);
		
		ModelAndView mav = new ModelAndView("Sell/p001_d002_detailProduct");
		mav.addObject("detail", list);
		mav.addObject("high_category", high_category);
		mav.addObject("middle_category", middle_category);
		if(auction_left_date != null) {
			mav.addObject("auction_left_date", auction_left_date);
		}
		System.out.println("list \n " + list);
		return mav;
	}
	
}
