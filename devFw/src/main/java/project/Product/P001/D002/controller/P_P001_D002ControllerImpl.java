package project.Product.P001.D002.controller;

import java.util.ArrayList;
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

import project.FleaMarket.P002.D004.service.F_P002_D004Service;
import project.Product.P001.D002.service.P_P001_D002Service;
import project.Product.P001.D002.vo.P_P001_D002VO;

@Controller("P_P001_D002Controller")
public class P_P001_D002ControllerImpl implements P_P001_D002Controller {
	@Autowired
	P_P001_D002Service P_P001_D002Service;
	@Autowired
	F_P002_D004Service d004Service;
	
	@Override
	@RequestMapping(value = "/fleaSearchProduct.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchProduct(@RequestParam(value="flea_code", required=false) String flea_code, @RequestParam(value="searchVal", required=false) String searchVal, @RequestParam(value="command", required=false) String command, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("플리 검색!!!!");
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("flea_code", flea_code);	 
		System.out.println("flea_code =" +flea_code);
		
		searchMap.put("searchVal", searchVal);	 
		System.out.println("검색한 단어:::" + searchVal);
		
		ModelAndView mav = new ModelAndView("Product/p001_d002_fleaSearchProduct");
		List searchProduct = P_P001_D002Service.searchProduct(searchMap);
		List list = d004Service.searchList(searchMap);
		
		mav.addObject("searchList", list);
		mav.addObject("searchProduct", searchProduct);
		mav.addObject("searchVal", searchVal);
		mav.addObject("size", searchProduct.size());
		mav.addObject("flea_code", flea_code);
	
		return mav;
	}
	
}
