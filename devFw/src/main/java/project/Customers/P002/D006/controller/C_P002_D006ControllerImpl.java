package project.Customers.P002.D006.controller;

import java.util.List;

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

import project.CS.P001.D001.service.CS_P001_D001Service;
import project.CS.P001.D001.vo.CS_P001_D001VO;
import project.Customers.P002.D006.service.C_P002_D006Service;
import project.Customers.P002.D006.vo.C_P002_D006VO;

@Controller("C_P002_D006Controller")
public class C_P002_D006ControllerImpl implements C_P002_D006Controller{
	private static final Logger Logger = LoggerFactory.getLogger(C_P002_D006ControllerImpl.class);
	
	
	@Autowired
	C_P002_D006Service c_p002_d006Service;

	@Autowired
	C_P002_D006VO c_p002_d006VO;
	
	@Autowired
	private HttpSession session;
	
	
	
	@Override
	@RequestMapping(value = "/mypageQA.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mypageQnA(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String memberId = (String)session.getAttribute("memberid");
		
		List qnaList = c_p002_d006Service.listQna(memberId);
		
		System.out.println("QNA" + qnaList);
		ModelAndView mav = new ModelAndView("Customers/p002_d006_QNA");

		mav.addObject("qnaList", qnaList);
		return mav;
		
		
		
		
		
		
		
	
	}
}

