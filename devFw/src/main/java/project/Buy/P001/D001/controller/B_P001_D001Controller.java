package project.Buy.P001.D001.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import project.Customers.P001.D001.vo.C_P001_D001VO;
import project.Sell.P001.D002.vo.S_P001_D002VO;

public interface B_P001_D001Controller {

		//장바구니 담겼을때 팝업뿌리기
		public ModelAndView successInsertCart(HttpServletRequest request, HttpServletResponse response) throws Exception;
		
}
