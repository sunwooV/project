package project.Buy.P001.D005.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface B_P001_D005Controller {

		//결제정보 입력
		public ModelAndView kakaopayReady(String code,HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception;
		public ModelAndView kakaopaySuccess(HttpServletRequest request, HttpServletResponse response) throws Exception;
		public ModelAndView kakaopayFail(HttpServletRequest request, HttpServletResponse response) throws Exception;
		public ModelAndView kakaopayCancle(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
