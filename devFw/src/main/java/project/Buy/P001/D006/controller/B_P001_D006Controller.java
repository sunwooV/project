package project.Buy.P001.D006.controller;

import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpRequest;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import project.Customers.P001.D001.vo.C_P001_D001VO;

public interface B_P001_D006Controller {

		//결제완료창 띄우기
		public ModelAndView paymentComplete(@ModelAttribute C_P001_D001VO member) throws DataAccessException;

}
