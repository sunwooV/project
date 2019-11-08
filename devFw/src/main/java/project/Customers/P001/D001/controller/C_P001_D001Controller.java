package project.Customers.P001.D001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.Customers.P001.D001.vo.C_P001_D001VO;

public interface C_P001_D001Controller {
	public ModelAndView loginInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView joinInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView kakao_joinInit(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception;
	public void check_id(@RequestParam("memberid") String memberid, HttpServletResponse response) throws Exception;
	public void check_email(@RequestParam("email") String email, HttpServletResponse response) throws Exception;
	public String join_member(@ModelAttribute C_P001_D001VO member, RedirectAttributes rttr, HttpServletResponse response) throws Exception;
	public void approval_member(@ModelAttribute C_P001_D001VO member, HttpServletResponse response) throws Exception;
	public String login(@ModelAttribute C_P001_D001VO member, HttpSession session, HttpServletResponse response) throws Exception;
	public void logout(HttpSession session, HttpServletResponse response) throws Exception;
	public String kakao_join_member(@ModelAttribute C_P001_D001VO member, RedirectAttributes rttr, HttpServletResponse response, HttpSession session) throws Exception;
	public void check_join(HttpServletResponse response, HttpSession session) throws Exception;
}
