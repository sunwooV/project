package project.Customers.P002.D007.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.Customers.P002.D007.service.C_P002_D007Service;
import project.Customers.P002.D007.vo.C_P002_D007VO;

@Controller("C_P002_D007Controller")
public class C_P002_D007ControllerImpl implements C_P002_D007Controller {
	private static final Logger Logger = LoggerFactory.getLogger(C_P002_D007ControllerImpl.class);

	@Autowired
	C_P002_D007Service c_p002_d007Service;

	@Autowired
	C_P002_D007VO c_p002_d007VO;

	@Autowired
	private HttpSession session;

	@Override
	@RequestMapping(value = "/mypagereview.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mypagereview(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		String memberId = (String) session.getAttribute("memberid");

		List reviewList = c_p002_d007Service.listreview(memberId);

		System.out.println("review" + reviewList);
		ModelAndView mav = new ModelAndView("Customers/p002_d007_review");

		mav.addObject("reviewList", reviewList);
		return mav;

	}
}
