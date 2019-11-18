package project.Sell.P001.D006.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface S_P001_D006Controller {
	public ModelAndView bidProduct(String prod_number, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
