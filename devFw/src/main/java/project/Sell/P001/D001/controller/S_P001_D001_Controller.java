package project.Sell.P001.D001.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.ModelAndView;

public interface S_P001_D001_Controller {
	public ModelAndView searchList(String searchWord, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView high_category(String category_name, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchInsert(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity insertProduct(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView test(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
