package project.test.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface testController {
	public ModelAndView test(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
