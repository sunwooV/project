package project.Main.P001.D001.controller;

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

import project.FleaMarket.P002.D001.service.F_P002_D001Service;
import project.Main.P001.D001.service.M_P001_D001Service;

@Controller("M_P001_D001Controller")
public class M_P001_D001ControllerImpl implements M_P001_D001Controller {
	@Autowired
	M_P001_D001Service M_P001_D001Service;
	@Autowired
	F_P002_D001Service F_P002_D001Service;
	
	@Override
	@RequestMapping(value = "/main.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mainList(@RequestParam(value="command", required=false) String command, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("command", command);	 
		
		List newProduct = M_P001_D001Service.newProduct(searchMap);
		List bestStore = F_P002_D001Service.searchList(searchMap);

		ModelAndView mav = new ModelAndView("Main/p001_d001_main");
		mav.addObject("newProduct", newProduct);
		mav.addObject("bestStore", bestStore);
		return mav;
	}
	
}
