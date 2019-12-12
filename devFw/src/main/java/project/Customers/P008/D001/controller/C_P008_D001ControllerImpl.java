package project.Customers.P008.D001.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.Customers.P008.D001.service.C_P008_D001Service;
import project.Customers.P008.D001.vo.C_P008_D001VO;


@Controller("C_P008_D001Controller")
public class C_P008_D001ControllerImpl implements C_P008_D001Controller{

		private static final Logger logger = LoggerFactory.getLogger(C_P008_D001ControllerImpl.class);
		@Autowired
		C_P008_D001Service c_p008_d001service;
		@Autowired
		C_P008_D001VO c_p008_d001vo;
		
		//화먼 찾기
		@Override
		@RequestMapping(value = "/gradesearchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView gradesearchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			ModelAndView mav = new ModelAndView("Customers/p008_d001_sellerGrade");
			return mav;
		}
		
		@Override
		@RequestMapping(value = "/gradesearchList.do", method = { RequestMethod.GET, RequestMethod.POST })
		@ResponseBody
		public Map gradesearchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
			Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
			
			// 검색조건설정
			searchMap.put("rank_code", request.getParameter("rank_code"));
			
			//�ㄷ데이터 조회
			List<C_P008_D001VO> data = c_p008_d001service.searchList(searchMap);
	        resultMap.put("Data", data);
	        
	        return resultMap;
		}
		
		@Override 
		@RequestMapping(value = "/gradesearchList2.do", method = { RequestMethod.GET, RequestMethod.POST })
		@ResponseBody
		public String gradesearchList2(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
	        String str = "{\"Data\":[{\"ID\":\"그것만이 내세상\",\"PWD\":\"Keys to the Heart\",\"NAME\":\"2017\",\"EMAIL\":\"한국\",\"JOINDATE\":\"20190101\",\"NUM\":\"1\"}]}";
	        //JSON 반환
	        return str;
		}
		
		@Override
		@RequestMapping(value = "/gradesaveData.do", method = { RequestMethod.GET, RequestMethod.POST })
		@ResponseBody
		public Map gradesaveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			Map<String, String[]> dataMap = new HashMap<String, String[]>(); // 저장할data
			Map<String, Object> resultMap = new HashMap<String, Object>(); // 처리결과
			
			// 저장DATA추출하기
			Enumeration enu = request.getParameterNames();
			while (enu.hasMoreElements()) {
				String name = (String) enu.nextElement();
				String[] values = request.getParameterValues(name);
				dataMap.put(name, values);
			}
			
			Map<String, String> result = new HashMap<String, String>();
			try {
				c_p008_d001service.saveData(dataMap);	
				result.put("Code","0");
				result.put("Message","저장되었습니다.");
			}catch(Exception e) {
				result.put("Code","-1");
				result.put("Message","저장에 실패했습니다.");
				e.printStackTrace();
			}
			
			resultMap.put("Result", result);         
	        return resultMap;
		}

}
