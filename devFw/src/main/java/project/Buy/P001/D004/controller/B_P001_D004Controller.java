package project.Buy.P001.D004.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import project.Customers.P002.D009.vo.C_P002_D009VO;

public interface B_P001_D004Controller {

		
		public ModelAndView insertPaymentInfo(HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception;
		public List<C_P002_D009VO> getAddr(@ModelAttribute C_P002_D009VO member,  HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception;
}
