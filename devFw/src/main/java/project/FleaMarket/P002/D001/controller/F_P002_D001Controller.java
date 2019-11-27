package project.FleaMarket.P002.D001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface F_P002_D001Controller {
	public ModelAndView fleaMystore(String flea_code, String memberid, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView editProfile(HttpServletRequest request, HttpServletResponse response) throws Exception ;
	public ModelAndView successEditProfile(HttpServletRequest request, HttpServletResponse response) throws Exception;
}