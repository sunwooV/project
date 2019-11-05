package project.Sell.P001.D002.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface S_P001_D002_Controller {
	public ModelAndView detailProduct(String prod_number, String category, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//public ModelAndView high_category(String category_name, StringHttpServletRequest request, HttpServletResponse response) throws Exception;
}
