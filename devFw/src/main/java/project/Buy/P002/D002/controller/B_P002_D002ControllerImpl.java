package project.Buy.P002.D002.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.Buy.P002.D002.service.B_P002_D002Service;
import project.Buy.P002.D002.vo.B_P002_D002VO;

@Controller("B_P002_D002Controller")
public class B_P002_D002ControllerImpl implements B_P002_D002Controller {
	private static final Logger Logger = LoggerFactory.getLogger(B_P002_D002ControllerImpl.class);
	@Autowired
	B_P002_D002Service b_p002_d002Service;
	@Autowired
	B_P002_D002VO b_p002_d002VO;
	
	//리뷰 팝업창 띄우기
	@Override
	@RequestMapping(value="/review.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView review(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("Popup/b_p002_d002_reviewWrite");
		return mav;
	}

	//쓴 리뷰 내용 DB insert
	@Override
	@RequestMapping(value="/insertReview.do", method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ResponseEntity insertReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
		}
		System.out.println("--=---=-=----------"+ dataMap);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");		
		try {
			b_p002_d002Service.insertReview(dataMap);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("/review.do");
			dispatch.forward(request, response);
		} catch (Exception e) {
			message = " <script>";
			message += " alert('오류 발생!!');";
			message += " location.href='" + request.getContextPath() + "/insertReview.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}		
		return resEnt;
	}
	
	//DB에 있는 리뷰 화면에 뿌리기


	
}
