package project.FleaMarket.P002.D007.controller;
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

import project.FleaMarket.P002.D007.service.F_P002_D007Service;
import project.FleaMarket.P002.D007.vo.F_P002_D007VO;


@Controller("F_P002_D007Controller")
public class F_P002_D007ControllerImpl implements F_P002_D007Controller{

	private static final Logger logger = LoggerFactory.getLogger(F_P002_D007ControllerImpl.class);
	@Autowired
	F_P002_D007Service f_p002_d007service;
	@Autowired
	F_P002_D007VO f_p002_d007vo;
	
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
	@ResponseBody
	public Map fleaSearchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		
		// 검색조건설정
		searchMap.put("flea_code", request.getParameter("flea_code"));
		
		//�ㄷ데이터 조회
		List<F_P002_D007VO> data = f_p002_d007service.searchList(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/fleaSaveData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map fleaSaveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
			f_p002_d007service.saveData(dataMap);	
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
