package project.Customers.P003.D001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("C_P003_D001Controller")
public class C_P003_D001ControllerImpl implements C_P003_D001Controller {
	
	
	@Override
	@RequestMapping(value = "/enrollSeller.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView enrollSeller(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		ModelAndView mav = new ModelAndView("Customers/p003_d001_enrollSellerForm");

		return mav;
	}
}
