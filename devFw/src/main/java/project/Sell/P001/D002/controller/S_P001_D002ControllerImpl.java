package project.Sell.P001.D002.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.Sell.P001.D001.vo.S_P001_D001VO;
import project.Sell.P001.D002.vo.S_P001_D002VO;
import project.Sell.P001.D003.vo.S_P001_D003VO;
import project.Sell.P001.D008.vo.S_P001_D008VO;
import project.Customers.P002.D014.vo.C_P002_D014VO;
import project.Sell.P001.D002.service.S_P001_D002Service;
import project.Sell.P001.D003.service.S_P001_D003Service;
import project.Sell.P001.D008.service.S_P001_D008Service;
import project.Customers.P002.D014.service.C_P002_D014Service;


@Controller("S_P001_D002Controller")
public class S_P001_D002ControllerImpl implements S_P001_D002Controller {
	@Autowired
	S_P001_D002Service S_P001_D002Service;
	@Autowired
	S_P001_D003Service S_P001_D003Service;
	@Autowired
	S_P001_D008Service S_P001_D008Service;
	@Autowired
	C_P002_D014Service C_P002_D014Service;
	@Autowired
	private HttpSession session;
	
	@Override
	@RequestMapping(value = "/detail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView detailProduct(@RequestParam(value="prod_number", required=false) String prod_number, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> searchMap2 = new HashMap<String, Object>();

		String memberId = (String) session.getAttribute("memberid");
		
		searchMap.put("prod_number", prod_number);
		searchMap.put("memberId", memberId);
		
		ModelAndView mav = new ModelAndView("Sell/p001_d002_detailProduct");
		
		List list = S_P001_D002Service.detailProduct(searchMap);
		List tags = S_P001_D002Service.tagList(searchMap);

		String flea_code = ((S_P001_D002VO)list.get(0)).getFleamarket();

		if(flea_code != null) {
			searchMap.put("flea_code", flea_code);
			
			String fleaName = S_P001_D002Service.fleaName(searchMap);
			mav.addObject("fleaName", fleaName);
		}
		
		System.out.println("memberId" + memberId);
		if(memberId != null) {
			String likeProd = S_P001_D002Service.likeProd(searchMap);
			mav.addObject("likeProd", likeProd);
			System.out.println("----likeProd" + likeProd);
		}
		
				
		searchMap2.put("prod_category_code", ((S_P001_D002VO)list.get(0)).getProd_category_code());	 
		
		System.out.println("prod_category_code:::" + ((S_P001_D002VO)list.get(0)).getProd_category_code());
		
		List middle_category = S_P001_D002Service.middle_category(searchMap2);
		
		searchMap2.put("high_category", ((S_P001_D001VO)middle_category.get(0)).getHigh_category());
		List high_category = S_P001_D002Service.high_category(searchMap2);
		
		List auction_left_date = S_P001_D002Service.auction_left_date(searchMap);

		List prodQnA = S_P001_D003Service.selectQnA(searchMap); //Q&A List		
		
		
		System.out.println("tag 들 :::: " + tags);
		
		System.out.println("controller 통과");

		mav.addObject("detail", list);
		mav.addObject("tags", tags);

		mav.addObject("high_category", high_category);
		mav.addObject("middle_category", middle_category);
		mav.addObject("prodQnA", prodQnA);
	
		if(auction_left_date != null) {
			mav.addObject("auction_left_date", auction_left_date);
		}
		System.out.println("list \n " + list);
		return mav;
	}
	
	
	@Override
	@RequestMapping(value = "/detailLikeProd.do", method = { RequestMethod.POST, RequestMethod.POST })
	public void likeProd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		System.out.println("detail/likeProd.do 들어옴");
		
		Map<String, Object> dataMap = new HashMap<String, Object>(); //insert data
		Enumeration enu = request.getParameterNames();
		String result = "";

		while (enu.hasMoreElements()) { 
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
			System.out.println(dataMap);
		}
		
		String command = (String) dataMap.get("command");
		
		if(command.equals("like")) {
			S_P001_D002Service.insertLikeProd(dataMap);
			dataMap.put("heart", "up");
			S_P001_D002Service.updateHeart(dataMap);
			String heart = (String)S_P001_D002Service.heart(dataMap);
			
			result += "{";
			result += "\"heart\":\"" + heart + "\"";
			result += "}";
		} else if(command.equals("dislike")){
			S_P001_D002Service.deleteLikeProd(dataMap);
			dataMap.put("heart", "down");
			S_P001_D002Service.updateHeart(dataMap);
			String heart = (String)S_P001_D002Service.heart(dataMap);
			
			result += "{";
			result += "\"heart\":\"" + heart + "\"";
			result += "}";
		} else { //관심 상품 삭제
			S_P001_D002Service.deleteLikeProd(dataMap);
			dataMap.put("heart", "down");
			S_P001_D002Service.updateHeart(dataMap);
			
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
		}
		
		System.out.println("result" + result);
		
		try {	
			response.getWriter().print(result);
		} catch(IOException e) {
			e.printStackTrace();
		}
	}	
	
}
