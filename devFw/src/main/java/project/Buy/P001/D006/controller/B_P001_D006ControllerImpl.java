package project.Buy.P001.D006.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.Buy.P001.D006.service.B_P001_D006Service;
import project.Customers.P001.D001.vo.C_P001_D001VO;


@Controller("B_P001_D006Controller")
public class B_P001_D006ControllerImpl implements B_P001_D006Controller{
	private static final Logger Logger = LoggerFactory.getLogger(B_P001_D006ControllerImpl.class);
	@Autowired
	B_P001_D006Service b_p001_d006Service;
	
	@Override
	@RequestMapping(value="/payComplete.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView paymentComplete(@ModelAttribute C_P001_D001VO member) throws DataAccessException {
		
		ModelAndView mav = new ModelAndView("Buy/p001_d006_payComplete");
		return mav;
	}



	

	
}
