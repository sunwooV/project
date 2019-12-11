package project.Customers.P002.D006.controller;

import java.io.IOException;
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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.CS.P001.D001.service.CS_P001_D001Service;
import project.CS.P001.D001.vo.CS_P001_D001VO;
import project.Customers.P002.D006.service.C_P002_D006Service;
import project.Customers.P002.D006.vo.C_P002_D006VO;
import project.Customers.P002.D014.vo.C_P002_D014VO;

@Controller("C_P002_D006Controller")
public class C_P002_D006ControllerImpl implements C_P002_D006Controller {
	private static final Logger Logger = LoggerFactory.getLogger(C_P002_D006ControllerImpl.class);

	@Autowired
	C_P002_D006Service c_p002_d006Service;


	@Autowired
	private HttpSession session;

	@Override
	@RequestMapping(value = "/mypageQnA.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mypageQnA(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		String memberId = (String) session.getAttribute("memberid");

		List qnaList = c_p002_d006Service.listQna(memberId);

		System.out.println("QNA" + qnaList);
		ModelAndView mav = new ModelAndView("Customers/p002_d006_QNA");

		mav.addObject("qnaList", qnaList);
		return mav;

	}
	
	@Override
	@RequestMapping(value = "/mypageDeleteqna.do", method = { RequestMethod.POST, RequestMethod.POST })
	public void mypageDeleteqna(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		Map<String, Object> dataMap = new HashMap<String, Object>(); //insert data
		Enumeration enu = request.getParameterNames();
		String result = "";
		
		while (enu.hasMoreElements()) { 
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
			System.out.println(dataMap);
		}
		
		c_p002_d006Service.deleteQna(dataMap);
		
		String memberId = (String) session.getAttribute("memberid");

		List qnaList = c_p002_d006Service.listQna(memberId);
		
		result += "[";
		for(int i=0;i<qnaList.size();i++) {
			result += "{";
			result += "\"memberId\":\"" + memberId + "\",";
			result += "\"prod_number\":\"" + ((C_P002_D006VO)qnaList.get(i)).getProd_number() + "\",";
			result += "\"qna_number\":\"" + ((C_P002_D006VO)qnaList.get(i)).getQna_number() + "\",";
			result += "\"qna_date\":\"" + ((C_P002_D006VO)qnaList.get(i)).getQna_date() + "\",";
			result += "\"answer_date\":\"" + ((C_P002_D006VO)qnaList.get(i)).getAnswer_date() + "\",";
			result += "\"secret_yn\":\"" + ((C_P002_D006VO)qnaList.get(i)).getSecret_yn() + "\",";
			result += "\"represent_image\":\"" + ((C_P002_D006VO)qnaList.get(i)).getRepresent_image() + "\",";
			result += "\"answer_yn\":\"" + ((C_P002_D006VO)qnaList.get(i)).getAnswer_yn() + "\",";
			result += "\"qna_content\":\"" + ((C_P002_D006VO)qnaList.get(i)).getQna_content() + "\",";
			result += "\"answer_content\":\"" + ((C_P002_D006VO)qnaList.get(i)).getAnswer_content() + "\"";
			
			result += "}";
			if(i != qnaList.size() -1) {
				result += ", ";
			}
		}
		result += "]";

		
		System.out.println("result" + result);
		
		try {	
			response.getWriter().print(result);
		} catch(IOException e) {
			e.printStackTrace();
		}
	}	
}
