package project.CS.P001.D003.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.CS.P001.D001.vo.CS_P001_D001VO;
import project.CS.P001.D001.vo.PagingVO;
import project.CS.P001.D003.service.CS_P001_D003Service;
import project.CS.P001.D003.vo.CS_P001_D003VO;
import project.Customers.P001.D001.vo.C_P001_D001VO;



@Controller("CS_P001_D003Controller")
public class CS_P001_D003ControllerImpl implements CS_P001_D003Controller{
	
	private static final Logger logger = LoggerFactory.getLogger(CS_P001_D003ControllerImpl.class);
	
	   @Autowired
	   private HttpSession session;
	   @Autowired
	   CS_P001_D003VO cs_p001_d003_vo;
	   @Autowired
	   CS_P001_D003Service cs_p001_d003_service;
	   
	   
	   @Override
		@RequestMapping(value = "/privateInit.do", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView privateInit(PagingVO vo, @RequestParam(value = "nowPage", required = false) String nowPage,
				@RequestParam(value = "cntPerPage", required = false) String cntPerPage, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			
			int total = cs_p001_d003_service.countBoard();
			System.out.println("33333333333333333333333333333333333333333" + total);
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) {
				cntPerPage = "5";
			}

			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

			List privatelist = cs_p001_d003_service.privatelist(vo);

			System.out.println("공지사항리스트" + privatelist);

			ModelAndView mav = new ModelAndView("CS/p001_d003_privateQnA");
			mav.addObject("Paging", vo);
			mav.addObject("list", privatelist);
			 mav.addObject("listSize", privatelist.size());
		
			return mav;

		}




		@Override
		@RequestMapping(value = "/privatdetail.do", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView eventDetail(@RequestParam("private_qna_num") int private_qna_num, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			Map<String, Object> dataMap = new HashMap();
		
			dataMap.put("private_qna_num", private_qna_num);
			List<Map<String, Object>> private_detail = cs_p001_d003_service.selectBoardDetail(dataMap);
			
			System.out.println("고객번호111111111111111111111111111111111111" + private_detail);
			ModelAndView mav = new ModelAndView("CS/p001_d003_privateDetail");
			mav.addObject("private_detail", private_detail.get(0));
			return mav;/* 공지사항 리스트 */
		}	
  }


