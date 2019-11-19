package project.Customers.P002.D009.controller;

import java.io.PrintWriter;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.Customers.P002.D009.service.C_P002_D009Service;
import project.Customers.P002.D009.vo.C_P002_D009VO;




@Controller("C_P002_D009Controller")
public class C_P002_D009ControllerImpl implements C_P002_D009Controller {
   private static final Logger logger = LoggerFactory.getLogger(C_P002_D009ControllerImpl.class);
   @Autowired
   C_P002_D009Service c_p002_d009_Service;
   @Autowired
   C_P002_D009VO c_p002_d009_VO;
   
   @Override
   @RequestMapping(value ="/InfoInit.do", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView InfoInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("utf-8");
      ModelAndView mav = new ModelAndView("Customers/p002_d009_info");
      return mav;
   }
   
   @Override
   @RequestMapping(value ="/out_pw_check.do", method = { RequestMethod.GET, RequestMethod.POST })
   public ModelAndView out_pw_check(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("utf-8");
      ModelAndView mav = new ModelAndView("Customers/p002_d009_out_pw_check");
      return mav;
   }

   @RequestMapping(value = "/update.do",  method = { RequestMethod.GET, RequestMethod.POST })
   public String update(@ModelAttribute C_P002_D009VO member, HttpSession session, RedirectAttributes rttr,HttpServletResponse response) throws Exception{
        session.setAttribute("member", c_p002_d009_Service.update(member,response));
      //rttr.addFlashAttribute("member",c_p002_d009_Service.update(member,response));
      System.out.println("12313333333333333333333333333333333333333333333333333312="+member.getNickname());
      return "redirect: ./mypage.do";
   }
   
   // 비밀번호 변경
   @RequestMapping(value = "/modify.do",  method = { RequestMethod.GET, RequestMethod.POST })
   public String modify(@ModelAttribute C_P002_D009VO member, @RequestParam("old_pw") String old_pw, HttpSession session, HttpServletResponse response, RedirectAttributes rttr) throws Exception{
      session.setAttribute("member", c_p002_d009_Service.modify(member, old_pw, response));
      return "redirect: ./InfoInit.do";
   }
   
   
   @RequestMapping(value = "/out.do", method = RequestMethod.POST)
	public String withdrawal_form(@ModelAttribute C_P002_D009VO member, HttpSession session, HttpServletResponse response) throws Exception{
		if(c_p002_d009_Service.out(member, response)) {
			session.invalidate();
		}
		return "redirect:./main.do";
	}


}