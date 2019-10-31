package project.Buy.P001.D004.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public interface B_P001_D004Controller {

		//결제정보 입력
		public ModelAndView insertPaymentInfo(HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception;
		
}
