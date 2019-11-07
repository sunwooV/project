package project.Buy.P001.D005.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller("B_P001_D005Controller")
public class B_P001_D005ControllerImpl implements B_P001_D005Controller{
	private static final Logger Logger = LoggerFactory.getLogger(B_P001_D005ControllerImpl.class);
//	@Autowired
//	B_P001_D005ervice b_p001_d005Service;
//	@Autowired
//	B_P001_D005VO b_p001_d005VO;

	@Override
	@RequestMapping(value = "/kakaopay.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map kakaopayReady()  {
		 Map map = new HashMap();
		 
		return map;
		
	}

	
	@Override
	@RequestMapping(value = "/kakaopaySuccess.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView kakaopaySuccess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@RequestMapping(value = "/kakaopayFail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView kakaopayFail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@RequestMapping(value = "/kakaopayCancel.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView kakaopayCancle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
}
