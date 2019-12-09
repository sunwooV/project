package project.Main.P001.D002.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.Main.P001.D002.service.M_P001_D002Service;
import project.Sell.P001.D001.service.S_P001_D001Service;
import project.Product.P001.D001.service.P_P001_D001Service;

@Controller("M_P001_D002Controller")
public class M_P001_D002ControllerImpl implements M_P001_D002Controller{
	private static final Logger Logger = LoggerFactory.getLogger(M_P001_D002ControllerImpl.class);
	@Autowired
	M_P001_D002Service M_P001_D002Service;
	@Autowired
	S_P001_D001Service S_P001_D001Service;
	@Autowired
	P_P001_D001Service P_P001_D001Service;

	@Override
	@RequestMapping(value = "/eachMain.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView eachMain(@RequestParam(value="command", required=false) String command, @RequestParam(value="category", required=false) String category, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		List prodList=null;
		ModelAndView mav = new ModelAndView("Main/p001_d002_eachMain");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		List high_category = S_P001_D001Service.high_category(searchMap);
		List middle_category = S_P001_D001Service.middle_category(searchMap);
		
		if(command.equals("reused")) {
			if(category != null) { //reusedMain에서 category를 선택했을 경우
				String[] words = category.split(",");
				System.out.println(words);
				mav.addObject("highCategoryName", words[0]);
				mav.addObject("middleCategoryName", words[1]);
				mav.addObject("category", words[2]);
				searchMap.put("category", words[2]);
				prodList = M_P001_D002Service.reusedList(searchMap);
			} else {
				prodList = M_P001_D002Service.reusedList(searchMap);
			}
			mav.addObject("command", "reused");
			mav.addObject("high_category", high_category);
			mav.addObject("middle_category", middle_category);
			mav.addObject("prodList", prodList);
		}
		else if(command.equals("auction")) {
			if(category != null) { //reusedMain에서 category를 선택했을 경우
				String[] words = category.split(",");
				System.out.println(words);
				mav.addObject("highCategoryName", words[0]);
				mav.addObject("middleCategoryName", words[1]);
				mav.addObject("category", words[2]);
				searchMap.put("category", words[2]);
				prodList = M_P001_D002Service.auctionList(searchMap);
			} else {
				prodList = M_P001_D002Service.auctionList(searchMap);
			}
			mav.addObject("command", "auction");
			mav.addObject("high_category", high_category);
			mav.addObject("middle_category", middle_category);
			mav.addObject("prodList", prodList);
		}

		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/eachsearchProduct.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView eachsearchProduct(@RequestParam(value="searchVal", required=false) String searchVal, @RequestParam(value="division", required=false) String division,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		Map<String, Object> searchMap = new HashMap<String, Object>();

		String send_way = "";
		String cc = "";
		
		searchMap.put("searchVal", searchVal);	 
		
		ModelAndView mav = new ModelAndView("Product/p001_d001_searchProduct");
		
		//상세 검색 했을 경우
		if(division != null) {
			
			int Ccnt = 0;
			int Gcnt = 0;
			int Scnt = 0;
			
			if(division.equals("reused")) {
				cc = "중고";
			}
			if(division.equals("auction")) {
				cc = "경매";
			}
			mav.addObject("eachSearch", cc);

			String[] send_way_select =request.getParameterValues("send_way_select");
			
			searchMap.put("reused", "y");
			mav.addObject("reused", "y");
			
			if(send_way_select != null) {
				Scnt = send_way_select.length;
				
				for(int i=0;i<Scnt;i++) {
					if(i != Scnt - 1) { //마지막이 아니면
						send_way += send_way_select[i] + " ";
					}else {
						send_way += send_way_select[i];
					}
				}
				searchMap.put("send_way", send_way);
				mav.addObject("send_way", send_way);
			}
			System.out.println("searchMap 검사 :::: " + searchMap);
			
			List detailSearch = P_P001_D001Service.searchProduct(searchMap);

			mav.addObject("searchProduct", detailSearch);
			mav.addObject("searchVal", searchVal);
			mav.addObject("size", detailSearch.size());
		} else {
			System.out.println(searchVal);
			List searchProduct = P_P001_D001Service.searchProduct(searchMap);
		
			mav.addObject("searchProduct", searchProduct);

			mav.addObject("searchVal", searchVal);
			mav.addObject("size", searchProduct.size());
		}
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/auctionMain.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView auctionMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("Main/p001_d002_auctionMain");
		return mav;
	}
	
}
