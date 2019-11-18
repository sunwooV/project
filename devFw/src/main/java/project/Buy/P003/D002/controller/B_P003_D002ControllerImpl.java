package project.Buy.P003.D002.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.Buy.P002.D003.service.B_P002_D003Service;
import project.Buy.P002.D003.vo.B_P002_D003VO;

@Controller("B_P003_D002Controller")
public class B_P003_D002ControllerImpl implements B_P003_D002Controller {
	private static final Logger Logger = LoggerFactory.getLogger(B_P003_D002ControllerImpl.class);

	
	@Override
	@RequestMapping(value="/changeProductComplete.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView changeProd(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("Buy/p003_d002_changeProdComplete");
		return mav;
	}

	
}
