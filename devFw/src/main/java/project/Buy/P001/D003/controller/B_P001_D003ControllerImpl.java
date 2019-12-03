package project.Buy.P001.D003.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import project.Buy.P001.D003.service.B_P001_D003Service;
import project.Buy.P001.D003.vo.B_P001_D003VO;
import project.Customers.P001.D001.vo.C_P001_D001VO;
import project.Sell.P001.D002.vo.S_P001_D002VO;

@Controller("B_P001_D003Controller")
public class B_P001_D003ControllerImpl implements B_P001_D003Controller {
	private static final Logger Logger = LoggerFactory.getLogger(B_P001_D003ControllerImpl.class);
	@Autowired
	B_P001_D003Service b_p001_d003Service;
	@Autowired
	B_P001_D003VO b_p001_d003VO;

	// 장바구니 상품 조회
	@Override
	@RequestMapping(value = "/cart.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView selectCart(@RequestParam("memberId") String memberId, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
//		Map<String, Object> searchMap = new HashMap<String, Object>(); //  Map
//		List<B_P001_D003VO> list = b_p001_d003Service.selectCart(searchMap); //List
		
		
		ModelAndView mav = new ModelAndView("Buy/p001_d003_cart"); // view
		// mav.addObject("selectCart", list); // data
		return mav;

	}

	// 장바구니 옵션 수정
	@Override
	@RequestMapping(value = "/editCart.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map<String, Object> editCart(@ModelAttribute C_P001_D001VO member, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		
		return resultMap;
	}

	// 장바구니 제품 추가
	@Override
	@RequestMapping(value = "/addCart.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map<String, Object> addCart(@ModelAttribute S_P001_D002VO product, @ModelAttribute C_P001_D001VO member,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("itf-8");

		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		return resultMap;
	}

	// 장바구니 목록 삭제
	@Override
	@RequestMapping(value = "/delCart.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map<String, Object> delCart(@ModelAttribute C_P001_D001VO member, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("itf-8");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		return resultMap;
	}

}
