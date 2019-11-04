package project.FleaMarket.P001.D004.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface F_P001_D004Controller {
	public ModelAndView searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	//public ModelAndView searchMod(String p_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//public ModelAndView JoinStart(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView search(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView JoinForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	//public ModelAndView Join(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity updateMember(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity insertMember(HttpServletRequest request, HttpServletResponse response) throws Exception;

}