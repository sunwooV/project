package project.Customers.P003.D002.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface C_P003_D002Controller {
	public ModelAndView sellerPage(String memberId, String division, String prev, HttpServletRequest request, HttpServletResponse response) throws Exception;

}
