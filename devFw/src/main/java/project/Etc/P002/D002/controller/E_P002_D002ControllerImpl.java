package project.Etc.P002.D002.controller;

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

import project.Etc.P002.D002.service.E_P002_D002Service;
import project.Etc.P002.D002.vo.E_P002_D002VO;



@Controller("E_P002_D002Controller")
public class E_P002_D002ControllerImpl implements E_P002_D002Controller{
	private static final Logger logger = LoggerFactory.getLogger(E_P002_D002ControllerImpl.class);
	@Autowired
	E_P002_D002Service e_p002_d002service;
	@Autowired
	E_P002_D002VO e_p002_d002vo;
	
	//화먼 찾기
	@Override
	@RequestMapping(value = "/boardsearchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView boardsearchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("Etc/p002_d002_boardmanagement");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/boardsearchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map boardsearchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과

		// 검색조건설정
		searchMap.put("board_num", request.getParameter("board_num"));
		
		//�ㄷ데이터 조회
		List<E_P002_D002VO> data = e_p002_d002service.searchList(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}
	
	@Override 
	@RequestMapping(value = "/boardsearchList2.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String boardsearchList2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
        String str = "{\"Data\":[{\"ID\":\"그것만이 내세상\",\"PWD\":\"Keys to the Heart\",\"NAME\":\"2017\",\"EMAIL\":\"한국\",\"JOINDATE\":\"20190101\",\"NUM\":\"1\"}]}";
        //JSON 반환
        return str;
	}
	
	@Override
	@RequestMapping(value = "/boardsaveData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map boardsaveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
			e_p002_d002service.saveData(dataMap);	
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
