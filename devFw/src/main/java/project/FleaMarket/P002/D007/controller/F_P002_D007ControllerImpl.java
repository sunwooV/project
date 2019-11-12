package project.FleaMarket.P002.D007.controller;

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

import project.Customers.P004.D001.controller.C_P004_D001ControllerImpl;
import project.Customers.P004.D001.service.C_P004_D001Service;
import project.Customers.P004.D001.vo.C_P004_D001VO;
import project.FleaMarket.P002.D007.dao.F_P002_D007DAO;
import project.FleaMarket.P002.D007.service.F_P002_D007Service;
import project.FleaMarket.P002.D007.vo.F_P002_D007VO;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller("F_P002_D007Controller")
public class F_P002_D007ControllerImpl implements F_P002_D007Controller {
	private static final Logger logger = LoggerFactory.getLogger(F_P002_D007ControllerImpl.class);
	@Autowired
	F_P002_D007Service d007Service;
	@Autowired
	F_P002_D007VO d007VO;

	//화먼 찾기
	@Override
	@RequestMapping(value = "/fleaSearchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView fleaSearchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("FleaMarket/p002_d007_fleaParticipantsList");
		return mav;
	}
	
	
	@Override
	@RequestMapping(value = "/fleaSearchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public Map fleaSearchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		//searchMap.put("flea_code", "flea_code");
		//System.out.println("플리코드=" + flea_code);
		
		// 검색조건설정
		searchMap.put("flea_code", request.getParameter("flea_code"));
		
		//�ㄷ데이터 조회
		List<F_P002_D007VO> data = d007Service.searchList(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
		
	}
	
	/*
	@Override
	@RequestMapping(value = "/fleaSearchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		
		System.out.println("dataMap::::::::::" + searchMap);
		
		//데이터 조회
		List<F_P002_D007VO> data = d007Service.searchList(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}		
*/
}
