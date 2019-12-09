package project.CS.P001.D004.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

	@Override
	@RequestMapping(value = "/csWrite.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView cs(@RequestParam("board_num") String board_num,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		Map<String, Object> dataMap = new HashMap();
		dataMap.put("board_num", board_num);
		List<CS_P001_D003VO> board = cs_p001_d003_service.selectboard(dataMap);
		ModelAndView mav = new ModelAndView("CS/p001_d004_csWrite");
		mav.addObject("board",board);//command이름
		return mav;
	}
	
	// 게시판 글 작성
		@RequestMapping(value="/insertboard.do", method = { RequestMethod.GET, RequestMethod.POST })
		public String insertboard(@ModelAttribute CS_P001_D004VO board,@RequestParam(value="board_num", required = false) String board_num) throws Exception{

			c_p001_d001service.insertboard(board);
			
			return "redirect:/csWriteComplete.do";
		}
	
	
	
}
