package project.Buy.P001.D005.controller;

import java.util.ArrayList;
import java.util.Enumeration;
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

import com.fasterxml.jackson.databind.ObjectMapper;

import project.Buy.P001.D005.service.B_P001_D005Service;
import project.Buy.P001.D005.vo.B_P001_D005VO;


@Controller("B_P001_D005Controller")
public class B_P001_D005ControllerImpl implements B_P001_D005Controller{
	private static final Logger Logger = LoggerFactory.getLogger(B_P001_D005ControllerImpl.class);
	@Autowired
	B_P001_D005Service b_p001_d005Service;

	@Autowired
	B_P001_D005VO b_p001_d005vo;

	@Override
	@RequestMapping(value = "/kakaopay.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String kakaopay()  {
		Logger.debug("REST API Start");
		
		Map searchMap = new HashMap();
		//return b_p001_d005Service.kakaopayReady(searchMap);	 	
		return null;
	}
	
	//order에 넣기
	@Override
	@RequestMapping(value = "/insertOrders.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void insertOrders(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
			System.out.println(dataMap);
		}
		b_p001_d005Service.insertOrders(dataMap);

	}

	@Override
	@RequestMapping(value = "/insertDest.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void insertDest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
			System.out.println(dataMap);
		}
		b_p001_d005Service.insertDest(dataMap);
		
	}
	@Override
	@RequestMapping(value = "/insertOrderitems.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void insertOrderitems(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ObjectMapper mapper = new ObjectMapper();
		String ddd = request.getParameter("prod_number");
		String order = request.getParameter("order_number");
		System.out.println(ddd);
		System.out.println("dPdflsdjflkdfjsdjflsdjfsdkljslda");
		ArrayList list = mapper.readValue(ddd, ArrayList.class);
	
		List<B_P001_D005VO> list2 = new ArrayList<B_P001_D005VO>();
		for(int i=0;i<list.size();i++) {
			B_P001_D005VO vo = new B_P001_D005VO();
			String num = (String) list.get(i);
			vo.setProd_number(num);
			vo.setOrder_number(order);
			System.out.println("@@@@@@@@@num"+num);
			list2.add(vo);
		}
		Map<String, Object> dataMap = new HashMap<String, Object>();

		b_p001_d005Service.insertOrderitems(list2);
		
	}
	
	
}
