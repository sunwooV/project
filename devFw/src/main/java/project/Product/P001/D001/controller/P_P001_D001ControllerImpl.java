package project.Product.P001.D001.controller;

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

import project.Product.P001.D001.service.P_P001_D001Service;

@Controller("P_P001_D001Controller")
public class P_P001_D001ControllerImpl implements P_P001_D001Controller {
	@Autowired
	P_P001_D001Service P_P001_D001Service;
	
	@Override
	@RequestMapping(value = "/searchProduct.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchProduct(@RequestParam(value="searchVal", required=false) String searchVal, @RequestParam(value="command", required=false) String command,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("searchVal", searchVal);	 
		ModelAndView mav = new ModelAndView("Product/p001_d001_searchProduct");
		if(command != null) {
			
			String[] category_select = request.getParameterValues("category_select");
			String[] group_select = request.getParameterValues("group_select");
			String[] send_way_select =request.getParameterValues("send_way_select");
			
			System.out.println(category_select.length + ", " + group_select.length + ", " + send_way_select.length);
			
//			HashMap<Object,Object> hm = new HashMap<Object, Object>();
//			
//			@SuppressWarnings("unchecked")
//			Enumeration<String> names = request.getParameterNames();
//			
//			while(names.hasMoreElements())
//			{
//				String retName = names.nextElement().toString();
//				Object obj = request.getParameter(retName);
//				Object objs [] = request.getParameterValues(retName);
//				
//				if(objs != null && objs.length > 1)
//				{
//					hm.put(retName, objs);
//				}else{
//					hm.put(retName, obj);
//				}
//				
//			}
//			
//			System.out.println((hm.get("category_select")));
			
		} else {
		System.out.println(searchVal);
		List searchProduct = P_P001_D001Service.searchProduct(searchMap);
		List searchHighCategory = P_P001_D001Service.searchHighCategory(searchMap);
		
		//searchMap.put("high_category", searchHighCategory);
		List searchMiddleCategory = P_P001_D001Service.searchMiddleCategory(searchMap);
		
		System.out.println("slslslslslsl" + searchMiddleCategory);
		
		
		
		
		mav.addObject("searchProduct", searchProduct);
		mav.addObject("searchHighCategory", searchHighCategory);
		mav.addObject("searchMiddleCategory", searchMiddleCategory);
		mav.addObject("searchVal", searchVal);
		mav.addObject("size", searchProduct.size());
		
		}
		return mav;
	}
	
}
