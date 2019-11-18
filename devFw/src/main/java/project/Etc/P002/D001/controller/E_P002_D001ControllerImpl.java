package project.Etc.P002.D001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("E_P002_D001Controller")
public class E_P002_D001ControllerImpl implements E_P002_D001Controller{
	private static final Logger Logger = LoggerFactory.getLogger(E_P002_D001ControllerImpl.class);
	
	@Override
	@RequestMapping(value = "/admin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView admin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("Etc/p002_d001_admin");
		return mav;
	}
}

