package project.Buy.P001.D003.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.Buy.P001.D003.service.B_P001_D003Service;
import project.Buy.P001.D003.vo.B_P001_D003VO;


@Controller("B_P001_D003Controller")
public class B_P001_D003ControllerImpl implements B_P001_D003Controller{
	private static final Logger Logger = LoggerFactory.getLogger(B_P001_D003ControllerImpl.class);
	@Autowired
	B_P001_D003Service b_p001_d003Service;
	@Autowired
	B_P001_D003VO b_p001_d003VO;

	//장바구니 조회
	@Override
	@RequestMapping(value = "/cart.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView selectCart(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
//		System.out.println("buy P001 D003 ControlleImpl당");
//		//session으로 아이디 받아오기 
//		String userId = (String) session.getAttribute("userId");
//		Map<String, Object> searchMap = new HashMap<String, Object>(); //  Map
//		List<B_P001_D003VO> list = b_p001_d003Service.selectCart(searchMap); //List
		ModelAndView mav = new ModelAndView("Buy/p001_d003_cart"); //view
		//mav.addObject("selectCart", list); // data
		return mav;
	}
	
	//장바구니 옵션 수정
	@Override
	@RequestMapping(value = "/editCart.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView editCart(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView("Buy/p001_d003_cart"); 
		return mav;
	}
	//장바구니 제품 추가
	@Override
	@RequestMapping(value = "/addCart.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addCart(HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView("Buy/p001_d003_cart"); 
		return mav;
	}
	//장바구니 목록 삭제
	@Override
	@RequestMapping(value = "/delCart.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView delCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return null;
	}
	
}
