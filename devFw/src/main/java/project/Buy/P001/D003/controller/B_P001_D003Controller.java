package project.Buy.P001.D003.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import project.Customers.P001.D001.vo.C_P001_D001VO;
import project.Sell.P001.D002.vo.S_P001_D002VO;

public interface B_P001_D003Controller {

		//장바구니 상품 조회
		public ModelAndView selectCart(HttpServletRequest request, HttpServletResponse response) throws Exception;
		//장바구니 상품의 옵션 수정
		public void editCart(@ModelAttribute S_P001_D002VO product,@ModelAttribute C_P001_D001VO member,HttpServletRequest request, HttpServletResponse response) throws Exception;
		//장바구니 상품추가
		public void addCart(@ModelAttribute S_P001_D002VO product,@ModelAttribute C_P001_D001VO member,HttpServletRequest request, HttpServletResponse response) throws Exception;
		//장바구니 상품삭제
		public void delCart(@ModelAttribute S_P001_D002VO product, @ModelAttribute C_P001_D001VO member,HttpServletRequest request, HttpServletResponse response) throws Exception;
		//장바구니 동일 상품 체크
		public void checkEqlProd(@ModelAttribute S_P001_D002VO product,HttpServletRequest request, HttpServletResponse response);
		
		
}
