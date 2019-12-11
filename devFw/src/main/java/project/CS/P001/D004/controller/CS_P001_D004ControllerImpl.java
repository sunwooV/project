package project.CS.P001.D004.controller;

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
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.CS.P001.D003.service.CS_P001_D003Service;
import project.CS.P001.D003.vo.CS_P001_D003VO;
import project.CS.P001.D004.service.CS_P001_D004Service;
import project.CS.P001.D004.service.CS_P001_D004ServiceImpl;
import project.CS.P001.D004.vo.CS_P001_D004VO;




@Controller("CS_P001_D004Controller")
public class CS_P001_D004ControllerImpl implements CS_P001_D004Controller{
	private static final Logger Logger = LoggerFactory.getLogger(CS_P001_D004ControllerImpl.class);
	
	@Autowired
	CS_P001_D004Service c_p001_d001service;
	
	@Autowired
	CS_P001_D003Service cs_p001_d003_service;
	
	@Autowired
	private HttpSession session;

	@Override
	@RequestMapping(value = "/csWrite.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView cs(@RequestParam("board_num") String board_num,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		Map<String, Object> dataMap = new HashMap();
		dataMap.put("board_num", board_num);
	
		List<CS_P001_D003VO> board = cs_p001_d003_service.selectboard(dataMap);
		ModelAndView mav = new ModelAndView("CS/p001_d004_csWrite");
		mav.addObject("boardlist",board);
		return mav;
	}
	
	// 게시판 글 작성
		@RequestMapping(value="/insertboard.do", method = { RequestMethod.GET, RequestMethod.POST })
		public String insertboard(@ModelAttribute CS_P001_D004VO board,@RequestParam(value="board_num", required = false) String board_num, Model model) throws Exception{
			c_p001_d001service.insertboard(board);
			String result = "redirect:/csWriteComplete.do?board_num="+board_num;
			return result;
		}
		
		// 게시판 글 작성
		@RequestMapping(value="/deleteboard.do", method = { RequestMethod.GET, RequestMethod.POST })
		public String deleteboard(@ModelAttribute CS_P001_D004VO board,@RequestParam(value="board_num", required = false) String board_num, Model model) throws Exception{
			c_p001_d001service.deleteboard(board);
			String result = "redirect:/privateInit.do?board_num="+board_num;
			return result;
		}
		
		@Override
		@RequestMapping(value = "/modifyboard.do", method = { RequestMethod.GET, RequestMethod.POST })
		@ResponseBody
		public ModelAndView modifyboard(@ModelAttribute CS_P001_D004VO board, @RequestParam(value="private_qna_num", required = false) int private_qna_num, @RequestParam(value="board_num", required = false) String board_num, HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			ModelAndView mav = new ModelAndView("CS/p001_d004_csWrite");
			mav.addObject("boardinfo", board);
			return mav;
		}

//		@Override
//		@RequestMapping(value = "/updateboard.do", method = { RequestMethod.POST, RequestMethod.POST })
//		@ResponseBody
//		public ResponseEntity updateboard(HttpServletRequest request, HttpServletResponse response) throws Exception {
//			request.setCharacterEncoding("utf-8");
//			System.out.println("update 들어옴");
//			Map<String, Object> dataMap = new HashMap<String, Object>();
//			Enumeration enu = request.getParameterNames();
//			while (enu.hasMoreElements()) {
//				String name = (String)enu.nextElement();
//				String value = request.getParameter(name);
//				dataMap.put(name, value);
//				System.out.println(dataMap);
//			}
//			
//			String prod_number = (String)dataMap.get("prod_number"); 
//			String message;
//			ResponseEntity resEnt = null;
//			HttpHeaders responseHeaders = new HttpHeaders(); // 헤더변경 시 사용
//			responseHeaders.add("Content-Type", "text/html; charset=utf-8");		
//			try {
//				S_P001_D005Service.updateProduct(dataMap);
//				S_P001_D005Service.updateTag(dataMap);
//				
//				response.sendRedirect("/devFw/detail.do?prod_number=" + prod_number);
////				RequestDispatcher dispatch = request.getRequestDispatcher("/Sell/P001/D001/searchList.do");
////				dispatch.forward(request, response);
//			} catch (Exception e) {
//				message = " <script>";
//				message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
//				message += " location.href='" + request.getContextPath() + "/enroll.do'; ";
//				message += " </script>";
//				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
//				e.printStackTrace();
//			}		
//			return resEnt;
//		}
	
	
	
}
