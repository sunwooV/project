package project.CS.P001.D001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface CS_P001_D001Controller {

	ModelAndView cs(HttpServletRequest request, HttpServletResponse response) throws Exception;


}
