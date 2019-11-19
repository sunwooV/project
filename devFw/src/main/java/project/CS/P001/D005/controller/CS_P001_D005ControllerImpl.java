package project.CS.P001.D005.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller("CS_P001_D005Controller")
public class CS_P001_D005ControllerImpl implements CS_P001_D005Controller{
	private static final Logger Logger = LoggerFactory.getLogger(CS_P001_D005ControllerImpl.class);
	

	@Override
	@RequestMapping(value = "/csWriteComplete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView csWriteComplete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("CS/p001_d005_csWriteComplete");
		return mav;
	}
}
