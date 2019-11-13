package project.Buy.P001.D005.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface B_P001_D005Controller {

		//
		public String kakaopay();
		public ModelAndView kakaopaySuccess( HttpServletResponse response) throws Exception;
		public ModelAndView kakaopayFail( HttpServletResponse response) throws Exception;
		public ModelAndView kakaopayCancel(HttpServletResponse response) throws Exception;

}
