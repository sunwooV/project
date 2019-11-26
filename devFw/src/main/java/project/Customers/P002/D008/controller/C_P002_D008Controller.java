package project.Customers.P002.D008.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.Customers.P002.D008.vo.C_P002_D008VO;

public interface C_P002_D008Controller {
	public ModelAndView memberPoint(@ModelAttribute C_P002_D008VO point, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// public void point_check(@RequestParam("memberid") String memberid, HttpServletResponse response,HttpSession session) throws Exception;
	 
}
