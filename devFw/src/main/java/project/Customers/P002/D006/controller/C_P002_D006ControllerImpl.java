package project.Customers.P002.D006.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("C_P002_D006Controller")
public class C_P002_D006ControllerImpl implements C_P002_D006Controller{
	private static final Logger Logger = LoggerFactory.getLogger(C_P002_D006ControllerImpl.class);
	
	@Override
	@RequestMapping(value = "/mypageQA.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mypageQnA(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("Customers/p002_d006_QNA");
		return mav;
	}
}

