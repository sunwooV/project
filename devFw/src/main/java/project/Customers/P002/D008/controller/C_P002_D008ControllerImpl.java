package project.Customers.P002.D008.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.Customers.P002.D008.service.C_P002_D008Service;
import project.Customers.P002.D008.vo.C_P002_D008VO;


@Controller("C_P002_D008Controller")
public class C_P002_D008ControllerImpl implements C_P002_D008Controller {
	
	   private static final Logger logger = LoggerFactory.getLogger(C_P002_D008ControllerImpl.class);
	   @Autowired
	   C_P002_D008Service c_p002_d008_Service;
	   @Autowired
	   C_P002_D008VO c_p002_d008_VO;
	   
	   @Override
	   @RequestMapping(value ="/memberPoint.do", method = { RequestMethod.GET, RequestMethod.POST })
	   public ModelAndView memberPoint(HttpServletRequest request, HttpServletResponse response) throws Exception {
	      request.setCharacterEncoding("utf-8");
	      ModelAndView mav = new ModelAndView("Customers/p002_d008_point");
	      return mav;
	   }

}
