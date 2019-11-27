package project.Buy.P002.D001.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("B_P002_D001Controller")
public class B_P002_D001ControllerImpl implements B_P002_D001Controller {
	private static final Logger Logger = LoggerFactory.getLogger(B_P002_D001ControllerImpl.class);

	
	@Override
	@RequestMapping(value="/confirmBuy.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView confirmBuy(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("Popup/b_p002_d001_confirmBuy");
		return mav;
	}
	
	
	
}
