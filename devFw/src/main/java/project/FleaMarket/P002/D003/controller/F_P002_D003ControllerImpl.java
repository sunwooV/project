package project.FleaMarket.P002.D003.controller;

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
import project.FleaMarket.P002.D003.dao.F_P002_D003DAO;
import project.FleaMarket.P002.D003.service.F_P002_D003Service;
import project.FleaMarket.P002.D003.vo.F_P002_D003VO;

@Controller("F_P002_D003Controller")
public class F_P002_D003ControllerImpl implements F_P002_D003Controller {
	private static final Logger logger = LoggerFactory.getLogger(F_P002_D003ControllerImpl.class);
	@Autowired
	F_P002_D003Service d003Service;
	@Autowired
	F_P002_D001Service d001Service;
	@Autowired
	F_P002_D003VO d003VO;
	
	
	@Override
	@RequestMapping(value = "/fleaStory.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView fleaStory(@RequestParam(value="p_id", required=false) String p_id, @RequestParam(value="flea_code", required=false) String flea_code, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("p_id", p_id);	 
		System.out.println("p_id확인 =" + p_id);
		searchMap.put("flea_code", flea_code);	 
		System.out.println("flea_code =" +flea_code);
		
		List storylist = d003Service.searchList(searchMap);
		List list = d001Service.searchList(searchMap);
		
		for(int i = 0; i < storylist.size(); i++)
		{
			System.out.println(storylist.get(i));
		}
		for(int i = 0; i < list.size(); i++)
		{
			System.out.println("ddd"+ list.get(i));
		}
		
		ModelAndView mav = new ModelAndView("FleaMarket/p002_d003_fleaStory");
		mav.addObject("storyList", storylist);
		mav.addObject("searchList", list);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/insertStory.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void insertStory(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) { 
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			searchMap.put(name, value);
			System.out.println("스토리 ajax 데이터:::::"+searchMap);
		}
		
		String command = (String)searchMap.get("command");
		
		
//		List list = d003Service.searchList(searchMap);
//		
//		for(int i = 0; i < list.size(); i++)
//		{
//			System.out.println(list.get(i));
//		}
//		
//		ModelAndView mav = new ModelAndView("FleaMarket/p002_d003_fleaStory");
//		mav.addObject("searchList", list);
//		return mav;
	}

}
