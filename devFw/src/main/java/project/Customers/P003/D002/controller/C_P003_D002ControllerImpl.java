package project.Customers.P003.D002.controller;

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


@Controller("C_P003_D002Controller")
public class C_P003_D002ControllerImpl implements C_P003_D002Controller {
	private static final Logger logger = LoggerFactory.getLogger(C_P003_D002ControllerImpl.class);
	@Autowired
	private HttpSession session;
	@Autowired
	C_P003_D002Service C_P003_D002Service;
	
	@Override
	@RequestMapping(value = "/sellerPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView sellerPage(@RequestParam(value="memberId", required=false) String memberId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		String loginId = (String) session.getAttribute("memberid");
		String sellerId = memberId;
		
		searchMap.put("sellerId", sellerId);
		
		//List miuCategory = C_P003_D002Service.miuCategory(searchMap);
		List sellerProduct = C_P003_D002Service.sellerProduct(searchMap);
		
		
		ModelAndView mav = new ModelAndView("Customers/p003_d002_sellerPage");
		mav.addObject("sellerProduct", sellerProduct);
		if(loginId == null || loginId != sellerId){
			mav.addObject("seller", "no"); //seller가 아닌 경우
		} else{
			mav.addObject("seller", "yes"); //seller인 경우
		}
		return mav;
		
	}
	
//	@Override
//	@RequestMapping(value = "/sellerProductDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
//	@ResponseBody
//	public ModelAndView sellerDelete(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		request.setCharacterEncoding("utf-8");
//		Map<String, Object> searchMap = new HashMap<String, Object>();
//		
//		String loginId = (String) session.getAttribute("memberid");
//		String sellerId = memberId;
//		
//		searchMap.put("sellerId", sellerId);
//		
//		//List miuCategory = C_P003_D002Service.miuCategory(searchMap);
//		List sellerProduct = C_P003_D002Service.sellerProduct(searchMap);
//		
//		
//		ModelAndView mav = new ModelAndView("Customers/p003_d002_sellerPage");
//		mav.addObject("sellerProduct", sellerProduct);
//		if(loginId == null || loginId != sellerId){
//			mav.addObject("seller", "no"); //seller가 아닌 경우
//		} else{
//			mav.addObject("seller", "yes"); //seller인 경우
//		}
//		return mav;
//		
//	}
	
}
