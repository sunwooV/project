package project.Etc.P001.D001.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.CS.P001.D001.controller.CS_P001_D001Controller;
import project.CS.P001.D001.controller.CS_P001_D001ControllerImpl;
import project.CS.P001.D001.service.CS_P001_D001Service;
import project.CS.P001.D001.vo.CS_P001_D001VO;
import project.Etc.P001.D001.service.E_P001_D001Service;
import project.Etc.P001.D001.vo.E_P001_D001VO;
import project.FleaMarket.P001.D001.service.F_P001_D001Service;
import project.FleaMarket.P001.D001.vo.F_P001_D001VO;

@Controller("E_P001_D001Controller")
public class E_P001_D001ControllerImpl implements E_P001_D001Controller{
	private static final Logger Logger = LoggerFactory.getLogger(E_P001_D001ControllerImpl.class);
	@Autowired
	E_P001_D001Service e_p001_d001Service;
	@Autowired
	E_P001_D001VO e_p001_d001VO;

	@Override
	@RequestMapping(value = "/detail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("Etc/p001_d001_detail");
		return mav;
	}
}

