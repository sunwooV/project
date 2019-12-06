package project.Buy.P001.D003.controller;

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
	@Autowired
	C_P001_D001VO c_p001_d001VO;
	@Autowired
	S_P001_D002VO s_p001_d002VO;
	@Autowired
	private HttpSession session;

	// 장바구니 상품 조회
	@Override
	@RequestMapping(value = "/cart.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView selectCart(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String memberId =  (String)session.getAttribute("memberid");
		System.out.println(memberId);
		
		
		//검색조건을 담음
		Map<String, Object> searchMap = new HashMap<String, Object>(); //  Map
		searchMap.put("memberid", memberId);
		
		ModelAndView mav = new ModelAndView("Buy/p001_d003_cart");// view
		System.out.println("장바구니 검색조건 담기"+searchMap);
		
		//검색하고 나온 결과를 받아서 리턴!!
		List dataList = b_p001_d003Service.selectCart(searchMap); //List
		System.out.println("장바구니 리스트"+dataList);
	
		mav.addObject("dataList", dataList); // data
		System.out.println("cart"+dataList);
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
	public void addCart(@ModelAttribute S_P001_D002VO product, @ModelAttribute C_P001_D001VO member,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		String memberid = (String) session.getAttribute("memberid");
		String prodNum = (String) session.getAttribute("prod_number");
		String cartCount = (String) session.getAttribute("prod_amount");
		System.out.println("장바구니 제품 추가의 1"+memberid);
		System.out.println("장바구니 제품 추가의 제품"+prodNum);
		System.out.println("장바구니 제품 추가의 수량"+cartCount);
		
		String prod = product.getProd_number();
		System.out.println("장바구니 제품 추가의 "+ prod);
		String data = request.getParameter("insertCartInfo");
		
		System.out.println(data);
	
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("memberid", memberid);
		dataMap.put("prod_number", prod);
		
		b_p001_d003Service.insertCart(dataMap);
		
	}

	// 장바구니 목록 삭제
	@Override
	@RequestMapping(value = "/delCart.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map<String, Object> delCart(@ModelAttribute C_P001_D001VO member, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		return resultMap;
	}

}
