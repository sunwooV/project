package project.FleaMarket.P001.D002.controller;

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
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.FleaMarket.P001.D002.service.F_P001_D002Service;
import project.FleaMarket.P001.D002.vo.F_P001_D002VO;

@Controller("F_P001_D002Controller")
public class F_P001_D002ControllerImpl implements F_P001_D002Controller {
	private static final Logger logger = LoggerFactory.getLogger(F_P001_D002ControllerImpl.class);
	@Autowired
	F_P001_D002Service d002Service;
	@Autowired
	F_P001_D002VO d002VO;
	@Autowired
	private HttpSession session;

	@Override
	@RequestMapping(value = "/fleaMain.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView fleaMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		String memberId = (String) session.getAttribute("memberid");
		searchMap.put("memberId", memberId);
		System.out.println("요기이ㅣ이");
		
		List list = d002Service.searchList(searchMap);
		
		System.out.println("list="+list);
		for(int i = 0; i < list.size(); i++)
		{
			System.out.println(list.get(i));
		}	
		
		ModelAndView mav = new ModelAndView("FleaMarket/p001_d002_fleaMain");
		System.out.println("memberId" + memberId);
		/*
		if(memberId != null) {
			String likeFlea = d002Service.likeFlea(searchMap);
			mav.addObject("likeFlea", likeFlea);
			System.out.println("----likeFlea" + likeFlea);
		}
		*/
		
		mav.addObject("searchList", list);
		return mav;
	}
	
	@Scheduled(fixedRate = 500000)
	public void date_check() throws Exception {
		System.out.println("=============모집 기간 확인=============");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		System.out.println("요기이ㅣ이");
		String date_check = null;
		String flea_code = null;
	
		List list = d002Service.recruit_date_check();
		System.out.println("recruit::::list="+list);
		
		for(int i = 0; i < list.size(); i++)
		{
			flea_code = ((F_P001_D002VO)list.get(i)).getFlea_code();
			date_check = ((F_P001_D002VO)list.get(i)).getDate_check();
			System.out.println("=====date_check: "+ date_check);
			System.out.println("=====flea_code: "+ flea_code);
			
			if(Integer.parseInt(date_check) < 0) {
				dataMap.put("flea_code", flea_code);
				d002Service.updateRecruit(dataMap);
				System.out.println("updateRecruit");
			}
		}
		
	}
	

	

}
