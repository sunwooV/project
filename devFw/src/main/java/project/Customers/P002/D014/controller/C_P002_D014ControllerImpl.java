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
import project.Sell.P001.D002.service.S_P001_D002Service;

@Controller("C_P002_D014")
public class C_P002_D014ControllerImpl implements C_P002_D014Controller {
	@Autowired
	S_P001_D002Service S_P001_D002Service;
	@Autowired
	C_P002_D014Service C_P001_D014Service;
	@Autowired
	private HttpSession session;
	
	@Override
	@RequestMapping(value = "/mypageLikeProd.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView MyLikeProd(@RequestParam(value="command", required=false) String command, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		searchMap.put("memberId", (String)session.getAttribute("memberid"));	 
		
		ModelAndView mav = new ModelAndView("Customers/p002_d014_mypageLikeProd");
		
		if(command != null) {
			System.out.println("command " + command);
			
			String[] prod_number = request.getParameterValues("checkProd");
			dataMap.put("memberId", (String)session.getAttribute("memberid"));
			dataMap.put("checkProd", prod_number);
			
			System.out.println("dataMap입니다용ㅇ용용ㅇ용 " + dataMap);
			S_P001_D002Service.deleteLikeProd(dataMap);
			dataMap.put("heart", "down");
			S_P001_D002Service.updateHeart(dataMap);
			
		}
		List myLikeProd = C_P001_D014Service.myLikeProd(searchMap);
		
		System.out.println("myLikeProd ++++++ : " + myLikeProd);
		
		mav.addObject("myLikeProd", myLikeProd);
		mav.addObject("size", myLikeProd.size());

		return mav;
	}
	
}
