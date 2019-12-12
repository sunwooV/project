package project.CS.P001.D001.controller;

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

import project.CS.P001.D001.vo.PagingVO;
import project.CS.P001.D003.service.CS_P001_D003Service;
import project.CS.P001.D003.vo.CS_P001_D003VO;
import project.CS.P001.D004.vo.CS_P001_D004VO;
import project.CS.P001.D001.service.CS_P001_D001Service;
import project.CS.P001.D001.vo.CS_P001_D001VO;

@Controller("CS_P001_D001Controller")
public class CS_P001_D001ControllerImpl implements CS_P001_D001Controller {
	private static final Logger Logger = LoggerFactory.getLogger(CS_P001_D001ControllerImpl.class);

	@Autowired
	CS_P001_D001Service cs_p001_d001Service;
	@Autowired
	CS_P001_D003Service cs_p001_d003_service;

	@Autowired
	CS_P001_D001VO cs_p001_d001VO;

//	@Override
//	@RequestMapping(value = "/cs.do", method = { RequestMethod.GET, RequestMethod.POST })
//	public ModelAndView cs(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		request.setCharacterEncoding("utf-8");
//		
//
//		
//		ModelAndView mav = new ModelAndView("CS/p001_d001_cs");
//		return mav;
//	}

	@Override
	@RequestMapping(value = "/cs.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView cs(PagingVO vo, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, @RequestParam(value="board_num", required = false) String board_num,HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String division = request.getParameter("division");
		System.out.println("666666666666666666666666666666666666666666" + division);
		int total = cs_p001_d001Service.countBoard();
		System.out.println("33333333333333333333333333333333333333333" + total);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		
		Map<String, Object> dataMap = new HashMap();
		dataMap.put("board_num", board_num);

		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<CS_P001_D003VO> boardlist = cs_p001_d003_service.selectboard(dataMap);

		
		
		
		
		List eventList = cs_p001_d001Service.listEvent(vo);
		List deliveryList = cs_p001_d001Service.listDelivery();
		List refundList = cs_p001_d001Service.listRefund();
		List topList = cs_p001_d001Service.listTop();
		List couList = cs_p001_d001Service.listCou();
		List ordList = cs_p001_d001Service.listOrd();
		System.out.println("공지사항리스트" + eventList);
		System.out.println("배송문의리스트" + deliveryList);
		System.out.println("교환환불리스트" + ((CS_P001_D001VO) refundList.get(0)).getContents());
		System.out.println("자주묻는질문" + ((CS_P001_D001VO) topList.get(0)).getContents());
		System.out.println("이벤트/할인쿠폰" + ((CS_P001_D001VO) couList.get(0)).getContents());
		System.out.println("주문결제" + ((CS_P001_D001VO) ordList.get(0)).getContents());
		ModelAndView mav = new ModelAndView("CS/p001_d001_cs");
		mav.addObject("Paging", vo);
		mav.addObject("eventList", eventList);
		mav.addObject("deliveryList", deliveryList);
		mav.addObject("refundList", refundList);
		mav.addObject("topList", topList);
		mav.addObject("couList", couList);
		mav.addObject("ordList", ordList);
		mav.addObject("boardlist", boardlist);
		return mav;

	}

	@Override
	@RequestMapping(value = "/csnotice.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView eventDetail(@RequestParam(value="no_number", required=false) String no_number, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		List noticeList = cs_p001_d001Service.listNotice();

		System.out.println("공지사항리스트" + ((CS_P001_D001VO) noticeList.get(0)).getNo_title());

		ModelAndView mav = new ModelAndView("CS/p001_d001_cs2");
		mav.addObject("noticeList", noticeList);
		return mav;
	}
}
