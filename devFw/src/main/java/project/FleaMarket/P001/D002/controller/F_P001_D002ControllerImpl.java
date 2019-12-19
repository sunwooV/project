package project.FleaMarket.P001.D002.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.FleaMarket.P001.D001.service.F_P001_D001Service;
import project.FleaMarket.P001.D002.service.F_P001_D002Service;
import project.FleaMarket.P001.D002.vo.F_P001_D002VO;

@Controller("F_P001_D002Controller")
public class F_P001_D002ControllerImpl implements F_P001_D002Controller {
	private static final Logger logger = LoggerFactory.getLogger(F_P001_D002ControllerImpl.class);
	@Autowired
	F_P001_D002Service d002Service;
	@Autowired
	F_P001_D001Service d001Service;
	@Autowired
	F_P001_D002VO d002VO;
	@Autowired
	private HttpSession session;

	@Override
	@RequestMapping(value = "/fleaMain.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView fleaMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> like = new HashMap<String, Object>();
		String memberId = (String) session.getAttribute("memberid");
		searchMap.put("memberId", memberId);
		System.out.println("요기이ㅣ이");
		
		List list = d002Service.searchList(searchMap);
		System.out.println("list="+list);
		for(int i = 0; i < list.size(); i++)
		{
			System.out.println(list.get(i));
		}		
		
		ModelAndView mav = new ModelAndView("FleaMarket/p001_d002_fleaMain");
		System.out.println("memberId" + memberId);
		for(int i = 0; i < list.size(); i++)
		{
			if(memberId != null) {
				System.out.println("플리메인 - 관심스토어 뿌리기!!");
				String flea_code = ((F_P001_D002VO)list.get(i)).getFlea_code();
				System.out.println("플리메인 flea_code=" + flea_code);
				if(flea_code != null) {
					searchMap.put("flea_code", flea_code);
					String likeFlea = d002Service.likeFlea(searchMap);
					//like.put("flea_code", flea_code);
					//like.put("like", likeFlea);
					System.out.println("----likeFlea" + likeFlea);
					
					String marketCnt = d002Service.marketCnt(searchMap);
					System.out.println("----marketCnt" + marketCnt);
					
					String recruitCnt = d002Service.recruitCnt(searchMap);
					System.out.println("----recruitCnt" + recruitCnt);
					
					
					//mav.addObject("like", like);
					mav.addObject("likeFlea", likeFlea);
					mav.addObject("marketCnt", marketCnt);
					mav.addObject("recruitCnt", recruitCnt);
				}
			}
		}
		
		/*
		if(memberId != null) {
			System.out.println("확인확인!!");
			String likeFlea = d002Service.likeFlea(searchMap);
			mav.addObject("likeFlea", likeFlea);
			System.out.println("----likeFlea" + likeFlea);
		}
		*/
		mav.addObject("searchList", list);
		return mav;
	}
	
	@Scheduled(fixedRate = 500000)
	public void date_check() throws Exception {
		System.out.println("=============모집 기간 확인=============");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		System.out.println("요기이ㅣ이");
		String date_check = null;
		String flea_code = null;
	
		List list = d002Service.recruit_date_check();
		System.out.println("recruit::::list="+list);
		
		for(int i = 0; i < list.size(); i++)
		{
			flea_code = ((F_P001_D002VO)list.get(i)).getFlea_code();
			date_check = ((F_P001_D002VO)list.get(i)).getDate_check();
			System.out.println("=====date_check: "+ date_check);
			System.out.println("=====flea_code: "+ flea_code);
			
			if(Integer.parseInt(date_check) < 0) {
				dataMap.put("flea_code", flea_code);
				d002Service.updateRecruit(dataMap);
				System.out.println("updateRecruit");
			}
		}
		
	}
	
	@Override
	@RequestMapping(value = "/Likeflea.do", method = { RequestMethod.POST, RequestMethod.POST })
	public void Likeflea(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		System.out.println("detail/likeflea.do 들어옴");
		
		Map<String, Object> dataMap = new HashMap<String, Object>(); //insert data
		Enumeration enu = request.getParameterNames();
		String result = "";
		System.out.println("요기는 들어오는가1");
		while (enu.hasMoreElements()) { 
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
			System.out.println(dataMap);
		}
		String command = (String) dataMap.get("command");
		System.out.println("요기는 들어오는가/command:::" + command);
		
		if(command.equals("like")) {
			System.out.println("요기는 들어오는가");
			d002Service.insertLikeFlea(dataMap);
			dataMap.put("heart", "up");
			d002Service.updateHeart(dataMap);
			String heart = (String)d002Service.heart(dataMap);
			System.out.println("heart=" + heart);
			
			result += "{";
			result += "\"heart\":\"" + heart + "\"";
			result += "}";
		} else if(command.equals("dislike")){
			d002Service.deleteLikeFlea(dataMap);
			System.out.println("=====deleteLikeFlea=====");
			dataMap.put("heart", "down");
			d002Service.updateHeart(dataMap);
			String heart = (String)d002Service.heart(dataMap);
			
			result += "{";
			result += "\"heart\":\"" + heart + "\"";
			result += "}";
		} else { //관심 상품 삭제
			d002Service.deleteLikeFlea(dataMap);
			dataMap.put("heart", "down");
			d002Service.updateHeart(dataMap);
			/*
			List likeProd = C_P002_D014Service.myLikeProd(dataMap);
			
			result += "[";
			for(int i=0;i<likeProd.size();i++) {
				result += "{";
				result += "\"prod_number\":\"" + ((C_P002_D014VO)likeProd.get(i)).getProd_number() + "\",";
				result += "\"reused_yn\":\"" + ((C_P002_D014VO)likeProd.get(i)).getReused_yn() + "\",";
				result += "\"auction_yn\":\"" + ((C_P002_D014VO)likeProd.get(i)).getAuction_yn() + "\",";
				result += "\"flea_yn\":\"" + ((C_P002_D014VO)likeProd.get(i)).getFlea_yn() + "\",";
				result += "\"send_way\":\"" + ((C_P002_D014VO)likeProd.get(i)).getSend_way() + "\",";
				result += "\"represent_image\":\"" + ((C_P002_D014VO)likeProd.get(i)).getRepresent_image() + "\",";
				result += "\"prod_title\":\"" + ((C_P002_D014VO)likeProd.get(i)).getProd_title() + "\",";
				result += "\"prod_price\":\"" + ((C_P002_D014VO)likeProd.get(i)).getProd_price() + "\",";
				result += "\"auction_bid\":\"" + ((C_P002_D014VO)likeProd.get(i)).getAuction_bid() + "\",";
				result += "\"sale_percent\":\"" + ((C_P002_D014VO)likeProd.get(i)).getSale_percent() + "\"";
				
				result += "}";
				if(i != likeProd.size() -1) {
					result += ", ";
				}
			}
			result += "]";
			*/
		}
		
		System.out.println("result" + result);
		
		try {	
			response.getWriter().print(result);
		} catch(IOException e) {
			e.printStackTrace();
		}
	}	

	

}
