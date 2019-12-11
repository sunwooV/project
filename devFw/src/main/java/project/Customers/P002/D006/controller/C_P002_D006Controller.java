package project.Customers.P002.D006.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface C_P002_D006Controller {
	
	ModelAndView mypageQnA(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void mypageDeleteqna(HttpServletRequest request, HttpServletResponse response) throws Exception;
}