package project.FleaMarket.P001.D001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface F_P001_D001Controller {
	
	public ModelAndView fleaCreateStoreType(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView fleaCreateStoreForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity fleaCreateStoreInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception;

}