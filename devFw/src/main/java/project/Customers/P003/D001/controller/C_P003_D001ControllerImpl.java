package project.Customers.P003.D001.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.Customers.P003.D001.service.C_P003_D001Service;
import project.Sell.P001.D001.service.S_P001_D001Service;
import project.Sell.P001.D001.controller.S_P001_D001ControllerImpl;

@Controller("C_P003_D001Controller")
public class C_P003_D001ControllerImpl implements C_P003_D001Controller {
	private static final Logger logger = LoggerFactory.getLogger(C_P003_D001ControllerImpl.class);
	@Autowired
	C_P003_D001Service C_P003_D001Service;
	@Autowired
	S_P001_D001Service S_P001_D001Service;
	@Autowired
	private HttpSession session;
	
	@Override
	@RequestMapping(value = "/enrollSeller.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView enrollSeller(@RequestParam(value="msg", required=false) String msg, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		ModelAndView mav = new ModelAndView("Customers/p003_d001_enrollSellerForm");

		if(msg != null) {
			mav.addObject("msg", msg);
		}
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/sellerBasic.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView sellerBasic(@RequestParam(value="redirectURL", required=false) String redirectURL, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		String loginChk = (String)session.getAttribute("memberid");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders(); // 헤더변경 시 사용
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");	
		if(loginChk == null) { //로그인 안되어있으면 
			System.out.println("로그인 안했음");
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:./loginInit.do");
			return mav;
		} else { //로그인 되어있으면
			searchMap.put("memberId", loginChk);
			String checkSeller = S_P001_D001Service.checkSeller(searchMap); //seller check
			if(Integer.parseInt(checkSeller) == 0) { //seller가 아니면
				ModelAndView mav = new ModelAndView("Customers/sellerBasic.do");

				return mav;
			} else { //seller면
				ModelAndView mav = new ModelAndView();
				mav.setViewName("redirect:./enrollSeller.do");
				mav.addObject("msg", "이미 판매자 등록이 완료되었습니다.");

				return mav;
			}
			
		}
		
	}
	
	@Override
	@RequestMapping(value = "/insertSellerInfo.do", method = { RequestMethod.POST, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity insertSellerInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> dataMap = new HashMap<String, Object>();

		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
			System.out.println(dataMap);
		}
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders(); // 헤더변경 시 사용
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");		
		try {
			C_P003_D001Service.changeSeller(dataMap);
			
			response.sendRedirect("/devFw/main.do");
			
//			RequestDispatcher dispatch = request.getRequestDispatcher("/Sell/P001/D001/searchList.do");
//			dispatch.forward(request, response);
		} catch (Exception e) {
			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='" + request.getContextPath() + "/sellerBasic.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}		
		return resEnt;
	}	
}
