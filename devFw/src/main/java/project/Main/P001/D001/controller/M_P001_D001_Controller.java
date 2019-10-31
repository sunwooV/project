package project.Main.P001.D001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface M_P001_D001_Controller {
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
