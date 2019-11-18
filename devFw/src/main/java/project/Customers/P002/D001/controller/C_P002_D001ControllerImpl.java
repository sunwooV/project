package project.Customers.P002.D001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.Customers.P002.D001.service.C_P002_D001Service;
import project.Customers.P002.D001.vo.C_P002_D001VO;


@Controller("C_P002_D001Controller")
public class C_P002_D001ControllerImpl implements C_P002_D001Controller{
	private static final Logger Logger = LoggerFactory.getLogger(C_P002_D001ControllerImpl.class);
	@Autowired
	C_P002_D001Service c_p002_d001Service;
	@Autowired
	C_P002_D001VO c_p002_d001VO;

	@Override
	@RequestMapping(value = "/mypage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mypage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("Customers/p002_d001_mypage");
		return mav;
	}
}
