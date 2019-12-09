package project.test.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.Sell.P001.D001.controller.S_P001_D001ControllerImpl;
import project.Sell.P001.D001.service.S_P001_D001Service;
import project.Sell.P001.D001.vo.S_P001_D001VO;
import project.Sell.P001.D002.vo.S_P001_D002VO;
import project.Sell.P001.D003.service.S_P001_D003Service;

@Controller("testController")
public class testControllerImpl implements testController {
	private static final Logger logger = LoggerFactory.getLogger(testControllerImpl.class);
	@Autowired
	S_P001_D003Service S_P001_D003Service;
	
	@Override
	@RequestMapping(value = "/test.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView test(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("prodNumber", "1");
		ModelAndView mav = new ModelAndView("test/test2");
		
		List prodQnA = S_P001_D003Service.selectQnA(searchMap); //Q&A List		
		
		
		mav.addObject("prodQnA", prodQnA);
		return mav;
	}
}
