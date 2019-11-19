package project.CS.P001.D004.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller("CS_P001_D004Controller")
public class CS_P001_D004ControllerImpl implements CS_P001_D004Controller{
	private static final Logger Logger = LoggerFactory.getLogger(CS_P001_D004ControllerImpl.class);
	

	@Override
	@RequestMapping(value = "/csWrite.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView cs(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("CS/p001_d004_csWrite");
		return mav;
	}
}
