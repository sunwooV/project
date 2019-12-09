package project.Buy.P001.D001.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.Buy.P001.D001.service.B_P001_D001Service;
import project.Buy.P001.D001.vo.B_P001_D001VO;
import project.Customers.P001.D001.vo.C_P001_D001VO;
import project.Sell.P001.D002.vo.S_P001_D002VO;

@Controller("B_P001_D001Controller")
public class B_P001_D001ControllerImpl implements B_P001_D001Controller {
	private static final Logger Logger = LoggerFactory.getLogger(B_P001_D001ControllerImpl.class);
	@Autowired
	B_P001_D001Service b_p001_d001Service;
	@Autowired
	B_P001_D001VO b_p001_d001VO;
	@Autowired
	private HttpSession session;

	//장바구니 insert 성공 시 팝업
	@Override
	@RequestMapping(value = "/successInsertCart.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView successInsertCart(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		ModelAndView mav = new ModelAndView("Popup/b_p001_d001_addSuccessToCart");// view
	
		//검색하고 나온 결과를 받아서 리턴!!
		
		return mav;

	}

}
