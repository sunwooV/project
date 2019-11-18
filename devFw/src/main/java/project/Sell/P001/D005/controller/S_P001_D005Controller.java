package project.Sell.P001.D005.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.ModelAndView;

public interface S_P001_D005Controller {
	public ModelAndView modifyProduct(String prod_number, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity updateProduct(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity deleteProduct(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
