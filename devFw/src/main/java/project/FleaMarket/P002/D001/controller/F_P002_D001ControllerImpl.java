package project.FleaMarket.P002.D001.controller;

import java.io.File;
import java.io.PrintWriter;
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

import project.Main.P001.D001.service.M_P001_D001Service;
import project.Sell.P001.D002.service.S_P001_D002Service;
import project.FleaMarket.P002.D001.dao.F_P002_D001DAO;
import project.FleaMarket.P002.D001.service.F_P002_D001Service;
import project.FleaMarket.P002.D001.vo.F_P002_D001VO;
import project.FleaMarket.P002.D003.service.F_P002_D003Service;

@Controller("F_P002_D001Controller")
public class F_P002_D001ControllerImpl implements F_P002_D001Controller {
	private static final Logger logger = LoggerFactory.getLogger(F_P002_D001ControllerImpl.class);
	@Autowired
	S_P001_D002Service S_P001_D002Service;
	@Autowired
	F_P002_D003Service d003Service;
	@Autowired
	F_P002_D001Service d001Service;
	@Autowired
	F_P002_D001VO d001VO;
	@Autowired
	F_P002_D001DAO d001DAO;
	
	@Override
	@RequestMapping(value = "/fleaMystore.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView fleaMystore(@RequestParam(value="flea_code", required=false) String flea_code, @RequestParam(value="memberid", required=false) String memberid, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		System.out.println("::::확인:::::");
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("flea_code", flea_code);	 
		System.out.println("flea_code =" +flea_code);
		
		searchMap.put("memberid", memberid);	 
		System.out.println("memberid =" +memberid);
		
		List list = d001Service.searchList(searchMap);
		List newProduct = S_P001_D002Service.fleaProductList(searchMap);
		List storyList = d003Service.storyList(searchMap);
		
		System.out.println("list="+list);
		for(int i = 0; i < list.size(); i++)
		{
			System.out.println(list.get(i));
		}
		System.out.println("fleaProductList="+newProduct);
		for(int i = 0; i < newProduct.size(); i++)
		{
			System.out.println(newProduct.get(i));
		}
		System.out.println("확인 필요");
		System.out.println("storyList="+storyList);
		for(int i = 0; i < storyList.size(); i++)
		{
			System.out.println(storyList.get(i));
		}
		
		
		ModelAndView mav = new ModelAndView("FleaMarket/p002_d001_fleaMystore");
		mav.addObject("newProduct", newProduct);
		mav.addObject("searchList", list);
		mav.addObject("storyList", storyList);
		mav.addObject("flea_code", flea_code);
		
		System.out.println("===마지막===");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/editProfile.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView editProfile(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
			System.out.println(dataMap);
		}
		
		
		ModelAndView mav = new ModelAndView("Popup/f_p002_d001_profileEditPopup");
		
		return mav;
	}
	
	
	@Override
	@RequestMapping(value = "/successEditProfile.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView successEditProfile(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		
		ModelAndView mav = new ModelAndView("Popup/f_p002_d001_profileEditSuccess");
		
		return mav;
	}

}
