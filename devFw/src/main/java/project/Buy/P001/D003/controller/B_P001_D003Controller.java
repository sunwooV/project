package project.Buy.P001.D003.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public interface B_P001_D003Controller {

		//장바구니 조회
		public ModelAndView selectCart(HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception;
		//장바구니 수정 
		public ModelAndView editCart(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception;
		//장바구니 추가
		public ModelAndView addCart(HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception;
		//장바구니 삭제
		public ModelAndView delCart(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
