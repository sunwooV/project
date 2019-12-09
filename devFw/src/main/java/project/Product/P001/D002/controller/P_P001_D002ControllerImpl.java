package project.Product.P001.D002.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.Product.P001.D002.service.P_P001_D002Service;
import project.Product.P001.D002.vo.P_P001_D002VO;

@Controller("P_P001_D002Controller")
public class P_P001_D002ControllerImpl implements P_P001_D002Controller {
	@Autowired
	P_P001_D002Service P_P001_D002Service;
	
	@Override
	@RequestMapping(value = "/fleaSearchProduct.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchProduct(@RequestParam(value="searchVal", required=false) String searchVal, @RequestParam(value="command", required=false) String command, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("플리 검색!!!!");
		
		Map<String, Object> searchMap = new HashMap<String, Object>();

		String send_way = "";
		
		searchMap.put("searchVal", searchVal);	 
		
		ModelAndView mav = new ModelAndView("Product/p001_d002_searchProduct");
		
		//상세 검색 했을 경우
		if(command != null) {

			int Gcnt = 0;
			int Scnt = 0;
			
			String[] group_select = request.getParameterValues("group_select");
			String[] send_way_select =request.getParameterValues("send_way_select");
			
			
			if(group_select != null) {
				Gcnt = group_select.length;
				
				for(int i=0;i<Gcnt;i++) {
					if(group_select[i].equals("reused")){
						searchMap.put("reused", "y");
						mav.addObject("reused", "y");
					}
					if(group_select[i].equals("auction")) {
						searchMap.put("auction", "y");
						mav.addObject("auction", "y");
					}
					if(group_select[i].equals("flea")) {
						searchMap.put("flea", "y");
						mav.addObject("flea", "y");
					}
				}
			}
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
			
			List detailSearch = P_P001_D002Service.searchProduct(searchMap);

			mav.addObject("searchProduct", detailSearch);
			mav.addObject("searchVal", searchVal);
			mav.addObject("size", detailSearch.size());
		} else {
			System.out.println(searchVal);
			List searchProduct = P_P001_D002Service.searchProduct(searchMap);

			
			mav.addObject("searchProduct", searchProduct);

			mav.addObject("searchVal", searchVal);
			mav.addObject("size", searchProduct.size());
		}
		return mav;
	}
	
}
