package project.FleaMarket.P002.D006.controller;

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

import project.FleaMarket.P002.D006.dao.F_P002_D006DAO;
import project.FleaMarket.P002.D006.service.F_P002_D006Service;
import project.FleaMarket.P002.D006.vo.F_P002_D006VO;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller("F_P002_D006Controller")
public class F_P002_D006ControllerImpl implements F_P002_D006Controller {
	private static final Logger logger = LoggerFactory.getLogger(F_P002_D006ControllerImpl.class);
	private static final String CURR_IMAGE_REPO_PATH = "C:/Users/bitcamp/git/project/devFw/src/main/webapp/resources/photoUpload/";
	@Autowired
	F_P002_D006Service d006Service;
	@Autowired
	F_P002_D006VO d006VO;
	
	@Override
	@RequestMapping(value = "/participantsInsert.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity participantsInsert(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
		}
		
		System.out.println("dataMap::::::::::" + dataMap);
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders(); 
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");		
		try {
			d006Service.insertMember(dataMap);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("fleaMystore.do");
			dispatch.forward(request, response);
		} catch (Exception e) {
			message = " <script>";
			message += " alert('오류가 발생하였습니다.');";
			message += " location.href='" + request.getContextPath() + "/fleaMystore.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}		
		return resEnt;
	}
	
			

}
