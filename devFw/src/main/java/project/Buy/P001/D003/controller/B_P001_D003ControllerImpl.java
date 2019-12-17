package project.Buy.P001.D003.controller;

import java.io.IOException;
import java.util.Enumeration;
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
import project.Customers.P002.D014.vo.C_P002_D014VO;
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
	public ModelAndView selectCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String memberId = (String) session.getAttribute("memberid");
		System.out.println(memberId);

		// 검색조건을 담음
		Map<String, Object> searchMap = new HashMap<String, Object>(); // Map
		searchMap.put("memberid", memberId);

		ModelAndView mav = new ModelAndView("Buy/p001_d003_cart");// view
		System.out.println("장바구니 검색조건 담기" + searchMap);

		// 검색하고 나온 결과를 받아서 리턴!!
		List dataList = b_p001_d003Service.selectCart(searchMap); // List
		System.out.println("장바구니 리스트" + dataList);

		mav.addObject("dataList", dataList); // data
		System.out.println("cart" + dataList);
		return mav;

	}

	// 장바구니 옵션 수정
	@Override
	@RequestMapping(value = "/editCart.do", method = { RequestMethod.GET, RequestMethod.POST })

	public void editCart(@ModelAttribute S_P001_D002VO product, @ModelAttribute C_P001_D001VO member,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
			System.out.println(dataMap);
			
		}
		
		String command = (String) dataMap.get("command");
		
		if(command != null) {
			b_p001_d003Service.updateCart(dataMap);
		} else {
			
			String memberId = (String) session.getAttribute("memberid");
			String prod = product.getProd_number();
			String prodCnt = request.getParameter("");

			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("memberid", memberId);
			resultMap.put("prod_number", prod);
			resultMap.put("cart_count", prodCnt);

			b_p001_d003Service.updateCart(resultMap);
		}		

	}

	// 장바구니 제품 추가
	@Override
	@RequestMapping(value = "/addCart.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void addCart(@ModelAttribute S_P001_D002VO product, @ModelAttribute C_P001_D001VO member,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("장바구니 제품 추가 들어옴");
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
			System.out.println(dataMap);
		}
		
		String command = request.getParameter("command");
		
		if(command !=null) {
		
		}else {
		String memberid = (String) session.getAttribute("memberid");
		String prod = product.getProd_number();
		String prodCnt = product.getProd_amount();
		String realPrice = product.getReal_prod_price();

		System.out.println(realPrice);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("memberid", memberid);
		resultMap.put("prod_number", prod);
		resultMap.put("cart_count", prodCnt);
		resultMap.put("real_prod_price", realPrice);

		b_p001_d003Service.insertCart(resultMap);
		}

	}

	// 장바구니 목록 삭제
	@Override
	@RequestMapping(value = "/delCart.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public void delCart(@ModelAttribute S_P001_D002VO product, @ModelAttribute C_P001_D001VO member,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String memberId = (String) session.getAttribute("memberid");
		String[]prod = request.getParameterValues("delProd[]");
		System.out.println(prod);
		
		for(int i = 0; i<prod.length; i++) {
			
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("memberid", memberId);
		resultMap.put("prod_number", prod[i]);

		b_p001_d003Service.deleteCart(resultMap);
		}
	}

	@Override
	@RequestMapping(value = "/checkCartList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void checkEqlProd(@ModelAttribute S_P001_D002VO product, HttpServletRequest request,
			HttpServletResponse response) {

		System.out.println("장바구니 제품 체크 들어옴");
		String memberId = (String) session.getAttribute("memberid");
		String prod = product.getProd_number();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("memberid", memberId);
		resultMap.put("prod_number", prod);
		int result2 = b_p001_d003Service.checkEqlProd(resultMap);

		String result = "";

		result += "{";
		result += "\"data\":\"" + result2 + "\"";

		result += "}";

		System.out.println("result" + result);

		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
