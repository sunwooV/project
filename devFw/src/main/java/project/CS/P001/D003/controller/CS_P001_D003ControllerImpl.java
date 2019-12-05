package project.CS.P001.D003.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
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

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.CS.P001.D001.vo.PagingVO;
import project.CS.P001.D003.service.CS_P001_D003Service;
import project.CS.P001.D003.vo.CS_P001_D003VO;




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
		public ModelAndView eventDetail(@RequestParam("private_qna_num") String private_qna_num, PagingVO vo, @RequestParam(value = "nowPage", required = false) String nowPage,
				@RequestParam(value = "cntPerPage", required = false) String cntPerPage,HttpServletRequest request,
			HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			
			Map<String, Object> dataMap = new HashMap();
			String memberid = (String) session.getAttribute("memberid");

			dataMap.put("private_qna_num", private_qna_num);
			dataMap.put("memberid", memberid);
			List<Map<String, Object>> private_detail = cs_p001_d003_service.selectBoardDetail(dataMap);
			List<CS_P001_D003VO> prodQnA = cs_p001_d003_service.selectcomment(dataMap);
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
	
			
			System.out.println("고객번호111111111111111111111111111111111111" + private_detail);
			ModelAndView mav = new ModelAndView("CS/p001_d003_privateDetail");
			mav.addObject("private_detail", private_detail.get(0));
			mav.addObject("list", privatelist);
			mav.addObject("prodQnA", prodQnA);
			mav.addObject("prodQnASize", prodQnA.size());
			return mav;/* 공지사항 리스트 */
		}	
		
		@Override
		@RequestMapping(value = "/detailcomment.do", method = { RequestMethod.POST, RequestMethod.POST })
		public void managecomment(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			Map<String, Object> searchMap = new HashMap<String, Object>(); //select data
		
			String result = "";
			
			Map<String, Object> dataMap = new HashMap<String, Object>(); //insert data
			Enumeration enu = request.getParameterNames();
			//parameter로 넘어온 값들을 dataMap이라는 Map에 저장한다.
			while (enu.hasMoreElements()) { 
				String name = (String)enu.nextElement();
				String value = request.getParameter(name);
				dataMap.put(name, value);
				System.out.println(dataMap);
			}
			
			String private_qna_num = (String)dataMap.get("private_qna_num");
			String command = (String) dataMap.get("command");
			searchMap.put("private_qna_num", private_qna_num);
			
		
			if(command.equals("insert")) { //질문사항 등록일 경우
				cs_p001_d003_service.insertcomment(dataMap);
			} else { //질문사항 삭제일 경우
				cs_p001_d003_service.deletecomment(dataMap);
			}
			List prodQnA = cs_p001_d003_service.selectcomment(searchMap);
			
			
			System.out.println("prodQNA :::: " + prodQnA);
			
			result += "[";
			for(int i=0;i<prodQnA.size();i++) {
				result += "{";
				result += "\"private_qna_num\":\"" + ((CS_P001_D003VO)prodQnA.get(i)).getPrivate_qna_num() + "\",";
				result += "\"answer_num\":\"" + ((CS_P001_D003VO)prodQnA.get(i)).getAnswer_num() + "\",";
				result += "\"private_answer_content\":\"" + ((CS_P001_D003VO)prodQnA.get(i)).getPrivate_answer_content() + "\",";
				result += "\"private_answer_date\":\"" + ((CS_P001_D003VO)prodQnA.get(i)).getPrivate_answer_date() + "\",";
				result += "\"private_answer_memberid\":\"" + ((CS_P001_D003VO)prodQnA.get(i)).getPrivate_answer_memberid() + "\",";
				result += "\"private_answer_yn\":\"" + ((CS_P001_D003VO)prodQnA.get(i)).getPrivate_answer_yn()+ "\"";
		
				
				
				result += "}";
				if(i != prodQnA.size() -1) {
					result += ", ";
				}
			}
			result += "]";
			System.out.println("result ::::: " + result);
			//String personJson = "[{\"id\":\""+"0" +"\",\"name\":\""+"dd" +"\",\"password\":\""+"bb" +"\",\"email\":\""+"pp"+"\"}, {\"id\":\""+"123" +"\",\"name\":\""+"dd" +"\",\"password\":\""+"bb" +"\",\"email\":\""+"pp"+"\"}]";
			//System.out.println(personJson);
			session.setAttribute("prodQnA", prodQnA);
			
			try {	
				response.getWriter().print(result);
			} catch(IOException e) {
				e.printStackTrace();
			}
			

		}

	
		
		
  }


