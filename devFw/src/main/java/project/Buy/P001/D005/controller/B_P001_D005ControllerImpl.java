package project.Buy.P001.D005.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;


@Controller("B_P001_D005Controller")
public class B_P001_D005ControllerImpl implements B_P001_D005Controller{
	private static final Logger Logger = LoggerFactory.getLogger(B_P001_D005ControllerImpl.class);
//	@Autowired
//	B_P001_D005ervice b_p001_d005Service;
//	@Autowired
//	B_P001_D005VO b_p001_d005VO;

	@Override
	@RequestMapping(value = "/Buy/P001/D005/kakaopay.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView kakaopayReady(String code, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("Buy/kakaopay"); //view РќДо
		
		return mav;
		
	}

	
	@Override
	@RequestMapping(value = "/Buy/P001/D005/kakaopaySuccess.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView kakaopaySuccess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@RequestMapping(value = "/Buy/P001/D005/kakaopayFail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView kakaopayFail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@RequestMapping(value = "/Buy/P001/D005/kakaopayCancle.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView kakaopayCancle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
}
