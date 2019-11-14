package project.FleaMarket.P003.D001.controller;

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

import project.FleaMarket.P003.D001.dao.F_P003_D001DAO;
import project.FleaMarket.P003.D001.service.F_P003_D001Service;
import project.FleaMarket.P003.D001.vo.F_P003_D001VO;

@Controller("F_P003_D001Controller")
public class F_P003_D001ControllerImpl implements F_P003_D001Controller {
	private static final Logger logger = LoggerFactory.getLogger(F_P003_D001ControllerImpl.class);
	@Autowired
	F_P003_D001Service d001Service;
	@Autowired
	F_P003_D001VO d001VO;
	@Autowired
	F_P003_D001DAO d001DAO;

	@Override
	@RequestMapping(value = "/fleaMap.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView fleaMap(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		List list = d001Service.searchList(searchMap);
		System.out.println("list="+list);
		for(int i = 0; i < list.size(); i++)
		{
			System.out.println(list.get(i));
		}
		
		ModelAndView mav = new ModelAndView("FleaMarket/p003_d001_fleaMap");
		mav.addObject("searchList", list);
		
		return mav;
	}


}
