package project.Product.P001.D001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface P_P001_D001Controller {
	public ModelAndView searchProduct(@RequestParam(value="searchVal", required=false) String searchVal, @RequestParam(value="command", required=false) String command,HttpServletRequest request, HttpServletResponse response) throws Exception;
} 
