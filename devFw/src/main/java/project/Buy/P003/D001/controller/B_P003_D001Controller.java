package project.Buy.P003.D001.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.ModelAndView;

public interface B_P003_D001Controller {

		public ModelAndView changeProd(HttpServletRequest request) throws IOException;

		public ResponseEntity insertChangeReason(HttpServletRequest request, HttpServletResponse response) throws Exception;
		
}
