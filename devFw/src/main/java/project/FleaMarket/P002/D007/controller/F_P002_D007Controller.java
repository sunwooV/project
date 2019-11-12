package project.FleaMarket.P002.D007.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface F_P002_D007Controller {
	public ModelAndView fleaSearchInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map fleaSearchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	}