package project.Main.P001.D002.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.Main.P001.D002.service.M_P001_D002Service;
import project.Sell.P001.D001.service.S_P001_D001Service;

@Controller("M_P001_D002Controller")
public class M_P001_D002ControllerImpl implements M_P001_D002Controller{
	private static final Logger Logger = LoggerFactory.getLogger(M_P001_D002ControllerImpl.class);
	@Autowired
	M_P001_D002Service m_p001_d002Service;
	@Autowired
	S_P001_D001Service S_P001_D001Service;

	@Override
	@RequestMapping(value = "/reusedMain.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView autionList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("Main/p001_d002_reusedMain");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		List high_category = S_P001_D001Service.high_category(searchMap);
		List middle_category = S_P001_D001Service.middle_category(searchMap);

		mav.addObject("high_category", high_category);
		mav.addObject("middle_category", middle_category);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/auctionMain.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView auctionMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("Main/p001_d002_auctionMain");
		return mav;
	}
	
}
