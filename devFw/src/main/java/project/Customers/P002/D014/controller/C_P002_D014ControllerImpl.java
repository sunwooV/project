package project.Customers.P002.D014.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.Customers.P002.D014.service.C_P002_D014Service;
import project.FleaMarket.P002.D001.service.F_P002_D001Service;

@Controller("C_P002_D014")
public class C_P002_D014ControllerImpl implements C_P002_D014Controller {
	@Autowired
	C_P002_D014Service C_P001_D014Service;
	@Autowired
	private HttpSession session;
	
	@Override
	@RequestMapping(value = "/mypageLikeProd.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView MyLikeProd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("memberId", (String)session.getAttribute("memberid"));	 
		
		List myLikeProd = C_P001_D014Service.myLikeProd(searchMap);
		
		System.out.println("myLikeProd ++++++ : " + myLikeProd);

		ModelAndView mav = new ModelAndView("Customers/p002_d014_mypageLikeProd");
		mav.addObject("myLikeProd", myLikeProd);

		return mav;
	}
	
}
