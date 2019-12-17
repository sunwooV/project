package project.Customers.P003.D002.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.Customers.P003.D002.service.C_P003_D002Service;
import project.Customers.P003.D002.vo.C_P003_D002VO;
import project.Sell.P001.D005.service.S_P001_D005Service;


@Controller("C_P003_D002Controller")
public class C_P003_D002ControllerImpl implements C_P003_D002Controller {
	private static final Logger logger = LoggerFactory.getLogger(C_P003_D002ControllerImpl.class);
	@Autowired
	private HttpSession session;
	@Autowired
	C_P003_D002Service C_P003_D002Service;
	@Autowired
	S_P001_D005Service S_P001_D005Service;
	
	@Override
	@RequestMapping(value = "/sellerPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView sellerPage(@RequestParam(value="memberId", required=false) String memberId, @RequestParam(value="division", required=false) String division,  @RequestParam(value="prev", required=false) String prev, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> dataMap = new HashMap<String, Object>(); // 저장할data
		ModelAndView mav = new ModelAndView();
		
		// 저장DATA추출하기
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		if(division != null) { //delete일 경우
			String[] myProductCheck = (String[]) dataMap.get("myProductCheck");
			System.out.println("[[[[[[[[" + myProductCheck);
			
			dataMap.put("checkProduct", myProductCheck);
			S_P001_D005Service.deleteProduct(dataMap);
		}
		
		
		String loginId = (String) session.getAttribute("memberid");
		String sellerId = memberId;
		
		searchMap.put("sellerId", sellerId);
		
		List sellerCheck = C_P003_D002Service.sellerCheck(searchMap);
		List sellerProduct = C_P003_D002Service.sellerProduct(searchMap);
		
		String seller_group = ((C_P003_D002VO)sellerCheck.get(0)).getSeller_group();
		String flea_seller_group = ((C_P003_D002VO)sellerCheck.get(0)).getFlea_seller_group();
		
		if(prev == null) {
			mav = new ModelAndView("Customers/p003_d002_sellerPage");
		} else {
			mav = new ModelAndView("Customers/p002_d006_QNA");
		}
		
		mav.addObject("sellerProduct", sellerProduct);
		mav.addObject("sellerId", sellerId);
		mav.addObject("seller_group", seller_group);
		mav.addObject("flea_seller_group", flea_seller_group);
		if(loginId == null || !loginId.equals(sellerId)){
			mav.addObject("seller", "no"); //seller가 아닌 경우
		} else{
			mav.addObject("seller", "yes"); //seller인 경우
		}
		return mav;
		
	}
	
}
