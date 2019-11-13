package project.Customers.P002.D009.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.Customers.P002.D009.vo.C_P002_D009VO;

public interface C_P002_D009Controller {
	public ModelAndView InfoInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String update(@ModelAttribute C_P002_D009VO member, HttpSession session, RedirectAttributes rttr) throws Exception;
	public String modify(@ModelAttribute C_P002_D009VO member, @RequestParam("old_pw") String old_pw, HttpSession session, HttpServletResponse response, RedirectAttributes rttr) throws Exception;
	
}
