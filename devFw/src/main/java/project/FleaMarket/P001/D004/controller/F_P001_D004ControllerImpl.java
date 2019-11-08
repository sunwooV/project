package project.FleaMarket.P001.D004.controller;

import java.io.File;
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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.FleaMarket.P001.D003.service.F_P001_D003Service;
import project.FleaMarket.P001.D004.service.F_P001_D004Service;
import project.FleaMarket.P001.D004.vo.F_P001_D004VO;

@Controller("F_P001_D004Controller")
public class F_P001_D004ControllerImpl implements F_P001_D004Controller {
	private static final Logger logger = LoggerFactory.getLogger(F_P001_D004ControllerImpl.class);
	@Autowired
	F_P001_D004Service d004Service;
	@Autowired
	F_P001_D003Service d003Service;
	@Autowired
	F_P001_D004VO d004VO;
/*
	@Override
	@RequestMapping(value = "/FleaMarket/P001/D004/search.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView search(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/p001_d004_search");
		return mav;
	}
*/
	/*
	@Override
	@RequestMapping(value = "/hm/p0001/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); 
		
		List list = d004Service.searchList(searchMap);

		ModelAndView mav = new ModelAndView("hm/p0001_search");
		mav.addObject("searchList", list);
		return mav;
	}*/
	
	@Override
	@RequestMapping(value = "/FleaMarket/P001/D004/approval.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView search(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); 
		List list = d004Service.searchList(searchMap);
		
		
		System.out.println("dataMap::::::::::" + list);

		ModelAndView mav = new ModelAndView("hm/F_P001_D004_approval");
		mav.addObject("searchList", list);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/FleaMarket/P001/D004/JoinForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView JoinForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		/*
		String command = request.getParameter("command");
		if(command != null && command.equals("insertMember"))
		{
			
		}
		*/
		ModelAndView mav = new ModelAndView("hm/JoinForm");
		return mav;
	}

	@Override
	public ModelAndView searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResponseEntity insertMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	/*
	@Override
	@RequestMapping(value = "/FleaMarket/P001/D004/Join.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity insertMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
		}
		
		System.out.println("dataMap::::::::::" + dataMap);
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders(); // ������� �� ���
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");		
		try {
			d004Service.insertMember(dataMap);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("/FleaMarket/P001/D004/JoinStart.do");
			dispatch.forward(request, response);
		} catch (Exception e) {
			message = " <script>";
			message += " alert('������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���');";
			message += " location.href='" + request.getContextPath() + "/FleaMarket/P001/D004/JoinStart.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}		
		return resEnt;
	}
	*/
	/*
	@Override
	@RequestMapping(value = "/FleaMarket/P001/D001/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchList(@RequestParam(value="p_id", required=false) String p_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("p_id", p_id);	 
		System.out.println("p_id�� =" + p_id);
		
		List list = d001Service.searchList(searchMap);
		
		System.out.println("list ������ Ȯ��");
		for(int i = 0; i < list.size(); i++)
		{
			System.out.println(list.get(i));
		}
		
		ModelAndView mav = new ModelAndView("hm/JoinForm");
		mav.addObject("searchList", list);
		return mav;
	}
	*/
	/*
	@RequestMapping(value = "/FleaMarket/P001/D004/searchMod.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchMod(@RequestParam(value="p_mod_id", required=false) String p_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("p_id", p_id);	 
		
		List list = d004Service.searchMod(searchMap);
		if(!list.isEmpty()) {
			d004VO = (F_P001_D004VO)list.get(0);
		}
		
		ModelAndView mav = new ModelAndView("hm/F_P001_D004_approval");
		mav.addObject("p0001VO", d004VO);
		mav.addObject("command", "modSearch");
		return mav;
	}
	*/
	/*
	@Override
	public ModelAndView searchInsert(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("searchInsert Ȯ��");
		return null;
	}
	*/

	
	@Override
	@RequestMapping(value = "/FleaMarket/P001/D004/updateMember.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity updateMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		System.out.println("개설승인버튼 클릭시(updateMember.do)!!");
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
		}
		
		System.out.println("dataMap::::::::::" + dataMap);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");		
		try {
			d004Service.updateMember(dataMap);
			
			List list = d004Service.searchList(dataMap);
			System.out.println("list="+list);
			for(int i = 0; i < list.size(); i++)
			{
				System.out.println(list.get(i));
			}
	/*
			Map<String, Object> searchMap = new HashMap<String, Object>();
			Enumeration enu_insert = request.getParameterNames();
			while (enu_insert.hasMoreElements()) {
				String name = (String) enu_insert.nextElement();
				String value = request.getParameter(name);
				searchMap.put(name, value);
			}
			
			System.out.println("searchMap::::::::::" + searchMap);
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");		
			try {
				d004Service.insertMember(dataMap);
				
				//RequestDispatcher dispatch = request.getRequestDispatcher("/FleaMarket/P001/D003/JoinStart.do");
				//dispatch.forward(request, response);
			} catch (Exception e) {
				message = " <script>";
				message += " alert('������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���');";
				message += " location.href='" + request.getContextPath() + "/FleaMarket/P001/D003/JoinStart.do'; ";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
				e.printStackTrace();
			}		
			
	*/		
			
			//d003Service.insertMember(dataMap);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("/FleaMarket/P001/D004/approval.do");
			dispatch.forward(request, response);
			
		} catch (Exception e) {
			message = " <script>";
			message += " alert('에러가 발생하였습니다.');";
			message += " location.href='" + request.getContextPath() + "/hm/d001/searchInit.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}		
		return resEnt;
	}
	
	/*
	@Override
	@RequestMapping(value = "/FleaMarket/P001/D001/Join.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity insertMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
		}
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders(); // ������� �� ���
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");		
		try {
			d001Service.insertMember(dataMap);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("/hm/p0001/searchList.do");
			dispatch.forward(request, response);
		} catch (Exception e) {
			message = " <script>";
			message += " alert('������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���');";
			message += " location.href='" + request.getContextPath() + "/FleaMarket/P001/D001/JoinStart.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}		
		return resEnt;
	}
	*/	
	
}
