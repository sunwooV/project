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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.CS.P001.D001.vo.PagingVO;
import project.CS.P001.D001.service.CS_P001_D001Service;
import project.CS.P001.D001.vo.CS_P001_D001VO;

@Controller("CS_P001_D001Controller")
public class CS_P001_D001ControllerImpl implements CS_P001_D001Controller {
	private static final Logger Logger = LoggerFactory.getLogger(CS_P001_D001ControllerImpl.class);

	@Autowired
	CS_P001_D001Service cs_p001_d001Service;

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
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, HttpServletRequest request,
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

		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		List eventList = cs_p001_d001Service.listEvent(vo);
		List deliveryList = cs_p001_d001Service.listDelivery();
		System.out.println("5555555555555555555555555555555555555555555555555555" + eventList);
		System.out.println("66666666666666666666666666666666666666666666666666666" + deliveryList);
		ModelAndView mav = new ModelAndView("CS/p001_d001_cs");
		mav.addObject("paging", vo);
		mav.addObject("eventList", eventList);
		mav.addObject("deliveryList", deliveryList);
		return mav;

	}

//	  
//	@Override
//	@RequestMapping(value="/event.do" ,method = {RequestMethod.GET, RequestMethod.POST})
//	public ModelAndView listEvent(PagingVO vo 
//			, @RequestParam(value="nowPage", required=false)String nowPage
//			, @RequestParam(value="cntPerPage", required=false)String cntPerPage, 
//			HttpServletRequest request, HttpServletResponse response) throws Exception {
//		String viewName = "event";
//		
//		int total = cs_p001_d001Service.countBoard();
//		System.out.println("33333333333333333333333333333333333333333"+total);
//		if (nowPage == null && cntPerPage == null) {
//			nowPage = "1";
//			cntPerPage = "5";
//		} else if (nowPage == null) {
//			nowPage = "1";
//		} else if (cntPerPage == null) { 
//			cntPerPage = "5";
//		}
//
//		
//			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
//			
//		
//		List eventList = cs_p001_d001Service.listEvent(vo);
//		System.out.println("5555555555555555555555555555555555555555555555555555"+eventList);
//		ModelAndView mav = new ModelAndView(viewName);
//		mav.addObject("paging", vo);    
//		mav.addObject("eventList", eventList);
//		return mav;
//	}

	@Override
	@RequestMapping(value = "/eventDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView eventDetail(@RequestParam("no_number") String no_number, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = "eventDetail";
		Map<String, Object> dataMap = new HashMap();
		Map<String, Object> resultMap = new HashMap();
		dataMap.put("no_number", no_number);
		List<Map<String, Object>> dataList = cs_p001_d001Service.selectBoardDetail(dataMap);
		resultMap = dataList.get(0);
		System.out.println("고객번호111111111111111111111111111111111111" + dataList);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("resultMap", resultMap);
		return mav;/* 공지사항 리스트 */
	}
	/*
	 * @Override
	 * 
	 * @RequestMapping(value = "/delivery.do", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public ModelAndView delivery(@RequestParam("division")
	 * String division, HttpServletRequest request, HttpServletResponse response)
	 * throws Exception { request.setCharacterEncoding("utf-8"); Map<String, Object>
	 * dataMap = new HashMap(); Map<String, Object> deliveryList = new HashMap();
	 * dataMap.put("division", division); List<Map<String, Object>> dataList =
	 * cs_p001_d001Service.selectAlldeliveryList(dataMap); deliveryList =
	 * dataList.get(0); System.out.println("제발배달문의" + dataList); ModelAndView mav =
	 * new ModelAndView("CS/p001_d001_cs"); mav.addObject("deliveryList",
	 * deliveryList); return mav; 배달문의 리스트 }
	 */
}
