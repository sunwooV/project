package project.Customers.P002.D008.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.Customers.P001.D001.service.C_P001_D001Service;
import project.Customers.P001.D001.vo.C_P001_D001VO;
import project.Customers.P002.D008.service.C_P002_D008Service;
import project.Customers.P002.D008.vo.C_P002_D008VO;
import project.Sell.P001.D001.service.S_P001_D001Service;


@Controller("C_P002_D008Controller")
public class C_P002_D008ControllerImpl implements C_P002_D008Controller {
	
	   private static final Logger logger = LoggerFactory.getLogger(C_P002_D008ControllerImpl.class);
	   @Autowired
	   private HttpSession session;
	   @Autowired
	   C_P002_D008Service c_p002_d008_Service;
	   @Autowired
	   C_P002_D008VO c_p002_d008_VO;
	   
	   @Autowired
	   S_P001_D001Service s_p001_d001_Service;
	   
	   @Override
	   @RequestMapping(value ="/memberPoint.do", method = { RequestMethod.GET, RequestMethod.POST })
	   public ModelAndView memberPoint(@ModelAttribute C_P002_D008VO point, HttpServletRequest request, HttpServletResponse response) throws Exception {
	      request.setCharacterEncoding("utf-8");
	      String memberid = (String)session.getAttribute("memberid");
	      System.out.println(memberid);
	       point=c_p002_d008_Service.point_check(memberid,response);
	       
	       C_P002_D008VO grade = (C_P002_D008VO)c_p002_d008_Service.grade_check(memberid, response);
	       
	       List<C_P002_D008VO> list = c_p002_d008_Service.boardList(memberid);
	       Map<String, Object> searchMap = new HashMap<String, Object>();
	       searchMap.put("memberId", memberid);
	       String checkSeller = s_p001_d001_Service.checkSeller(searchMap);
           System.out.println("checkSeller="+checkSeller);
		   System.out.println("아이디입니다아아아아아앙"+list);
	      ModelAndView mav = new ModelAndView("Customers/p002_d008_point");
	      
	      mav.addObject("grade", grade);
	      mav.addObject("point", point);
	      mav.addObject("list", list);
	      mav.addObject("listSize", list.size());
	      mav.addObject("checkSeller",checkSeller);
	      return mav;
	   }
	   
//	   @Override
//		@RequestMapping(value = "/point_check.do", method =  { RequestMethod.GET, RequestMethod.POST })
//		public void point_check(@ModelAttribute C_P002_D008VO point, HttpServletResponse response,HttpSession session) throws Exception{
//		       String memberid = (String)session.getAttribute("memberid");
//		       System.out.println(memberid);
//		       point=c_p002_d008_Service.point_check(memberid, response);
//		      
//			   session.setAttribute("point", point);
//			   System.out.println("아이디입니다아아아아아앙"+point.getUseable_point());
//		}
}
