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

import project.Customers.P002.D001.controller.C_P002_D001Controller;
import project.Customers.P002.D001.controller.C_P002_D001ControllerImpl;
import project.Customers.P002.D001.service.C_P002_D001Service;
import project.Customers.P002.D001.vo.C_P002_D001VO;
import project.FleaMarket.P002.D001.service.F_P002_D001Service;
import project.Main.P001.D001.service.M_P001_D001Service;
import project.Main.P001.D002.service.M_P001_D002Service;
import project.Main.P001.D002.vo.M_P001_D002VO;

@Controller("M_P001_D002Controller")
public class M_P001_D002ControllerImpl implements M_P001_D002Controller{
	private static final Logger Logger = LoggerFactory.getLogger(M_P001_D002ControllerImpl.class);
	@Autowired
	M_P001_D002Service m_p001_d002Service;
	@Autowired
	M_P001_D002VO m_p001_d002VO;

	@Override
	@RequestMapping(value = "/aution.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView autionList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("Main/p001_d002_kyung");
		return mav;
	}
	
}
