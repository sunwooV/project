package project.Buy.P002.D001.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface B_P002_D001Controller {

		public ModelAndView confirmBuy(HttpServletRequest request) throws IOException;
}
