package project.Buy.P002.D002.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.Buy.P002.D002.service.B_P002_D002Service;
import project.Buy.P002.D002.vo.B_P002_D002VO;

@Controller("B_P002_D002Controller")
public class B_P002_D002ControllerImpl implements B_P002_D002Controller {
	private static final Logger Logger = LoggerFactory.getLogger(B_P002_D002ControllerImpl.class);
	@Autowired
	B_P002_D002Service b_p002_d003Service;
	@Autowired
	B_P002_D002VO b_p002_d003VO;
	
	@Override
	@RequestMapping(value="/review.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView review(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("Buy/p002_d002_reviewWrite");
		return mav;
	}

	
}
