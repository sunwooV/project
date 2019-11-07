package project.Buy.P001.D005.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface B_P001_D005Controller {

		//
		public Map kakaopayReady();
		public ModelAndView kakaopaySuccess(HttpServletRequest request, HttpServletResponse response) throws Exception;
		public ModelAndView kakaopayFail(HttpServletRequest request, HttpServletResponse response) throws Exception;
		public ModelAndView kakaopayCancle(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
