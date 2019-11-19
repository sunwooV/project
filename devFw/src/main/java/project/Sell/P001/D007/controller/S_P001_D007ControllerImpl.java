package project.Sell.P001.D007.controller;

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
import project.Sell.P001.D007.service.S_P001_D007Service;

@Controller("S_P001_D007Controller")
public class S_P001_D007ControllerImpl implements S_P001_D007Controller{
	@Autowired
	S_P001_D002Service S_P001_D002Service;
	@Autowired
	S_P001_D007Service S_P001_D007Service;
	
	@Override
	@RequestMapping(value = "/bidRecord.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView bidRecord(@RequestParam(value="prod_number", required=false) String prod_number, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("prod_number", prod_number);	 
		
		List product_info = S_P001_D002Service.detailProduct(searchMap);
		List bidRecord = S_P001_D007Service.selectBidRecord(searchMap);
		
		ModelAndView mav = new ModelAndView("Sell/p001_d007_bidRecord");
		
		mav.addObject("product_info", product_info);
		mav.addObject("bidRecord", bidRecord);
		
		return mav;
	}
}
