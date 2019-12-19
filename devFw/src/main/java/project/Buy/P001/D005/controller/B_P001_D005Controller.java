package project.Buy.P001.D005.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.ModelAndView;

public interface B_P001_D005Controller {

		//
		public String kakaopay();

		//insertOrder
		public void insertOrders(HttpServletRequest request, HttpServletResponse response) throws Exception;
		public void insertDest(HttpServletRequest request, HttpServletResponse response) throws Exception;

		public void insertOrderitems(HttpServletRequest request, HttpServletResponse response) throws Exception;
		

}
