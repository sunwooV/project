package project.Customers.P002.D014.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface C_P002_D014Controller {
	public ModelAndView MyLikeProd(String command, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
