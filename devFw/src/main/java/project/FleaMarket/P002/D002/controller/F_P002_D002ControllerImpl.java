package project.FleaMarket.P002.D002.controller;

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
import project.FleaMarket.P002.D002.dao.F_P002_D002DAO;
import project.FleaMarket.P002.D002.service.F_P002_D002Service;
import project.FleaMarket.P002.D002.vo.F_P002_D002VO;

@Controller("F_P002_D002Controller")
public class F_P002_D002ControllerImpl implements F_P002_D002Controller {
	private static final Logger logger = LoggerFactory.getLogger(F_P002_D002ControllerImpl.class);
	@Autowired
	F_P002_D002Service d002Service;
	@Autowired
	F_P002_D001Service d001Service;
	@Autowired
	F_P002_D002VO d002VO;
	
	@Override
	@RequestMapping(value = "/fleaReview.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView fleaReview(@RequestParam(value="p_id", required=false) String p_id, @RequestParam(value="flea_code", required=false) String flea_code, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		System.out.println("eeeeeeeee");
		searchMap.put("p_id", p_id);	 
		System.out.println("p_id=" + p_id);
		
		searchMap.put("flea_code", flea_code);	 
		System.out.println("flea_code =" +flea_code);
		
		List reviewList = d002Service.reviewList(searchMap);
		List list = d001Service.searchList(searchMap);
		
		for(int i = 0; i < reviewList.size(); i++)
		{
			System.out.println(reviewList.get(i));
		}
		System.out.println("ddddd");
		for(int i = 0; i < list.size(); i++)
		{
			System.out.println("ddd"+ list.get(i));
		}
		
		
		ModelAndView mav = new ModelAndView("FleaMarket/p002_d002_fleaReview");
		mav.addObject("reviewList", reviewList);
		mav.addObject("searchList", list);
		
		System.out.println("확인필요!!!!");
		return mav;
	}

}
