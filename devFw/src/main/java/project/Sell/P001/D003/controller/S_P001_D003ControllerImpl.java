package project.Sell.P001.D003.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import project.Sell.P001.D003.service.S_P001_D003Service;
import project.Sell.P001.D003.vo.S_P001_D003VO;


@Controller("S_P001_D003Controller")
public class S_P001_D003ControllerImpl implements S_P001_D003Controller {
	@Autowired
	S_P001_D003Service S_P001_D003Service;
	
	
	@Override
	@RequestMapping(value = "/detailQna.do", method = { RequestMethod.POST, RequestMethod.POST })
	public void manageQnA(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); //select data
		List prodQnA = null;
		String result = "";
		
		Map<String, Object> dataMap = new HashMap<String, Object>(); //insert data
		Enumeration enu = request.getParameterNames();
		//parameter로 넘어온 값들을 dataMap이라는 Map에 저장한다.
		while (enu.hasMoreElements()) { 
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
			System.out.println(dataMap);
		}
		
		String prod_number = (String)dataMap.get("prod_number");
		String command = (String) dataMap.get("command");
		
		searchMap.put("prod_number", prod_number);
		
		if(command.equals("insert")) { //질문사항 등록일 경우
			S_P001_D003Service.insertQnA(dataMap);
		} else { //질문사항 삭제일 경우
			S_P001_D003Service.deleteQnA(dataMap);
		}
		
		searchMap.put("start", 1);
		searchMap.put("end", 10);
		prodQnA = S_P001_D003Service.selectQnA(searchMap);
		System.out.println(prodQnA);
		
		result += "[";
		for(int i=0;i<prodQnA.size();i++) {
			result += "{";
			result += "\"prod_number\":\"" + ((S_P001_D003VO)prodQnA.get(i)).getProd_number() + "\",";
			result += "\"qna_number\":\"" + ((S_P001_D003VO)prodQnA.get(i)).getQna_number() + "\",";
			result += "\"qna_content\":\"" + ((S_P001_D003VO)prodQnA.get(i)).getQna_content() + "\",";
			result += "\"qna_date\":\"" + ((S_P001_D003VO)prodQnA.get(i)).getQna_date() + "\",";
			result += "\"memberId\":\"" + ((S_P001_D003VO)prodQnA.get(i)).getMemberId() + "\",";
			result += "\"secretMember\":\"" + ((S_P001_D003VO)prodQnA.get(i)).getSecretMember() + "\",";
			result += "\"answer_yn\":\"" + ((S_P001_D003VO)prodQnA.get(i)).getAnswer_yn() + "\",";
			result += "\"answer_date\":\"" + ((S_P001_D003VO)prodQnA.get(i)).getAnswer_date() + "\",";
			result += "\"answer_content\":\"" + ((S_P001_D003VO)prodQnA.get(i)).getAnswer_content() + "\",";
			result += "\"secret_yn\":\"" + ((S_P001_D003VO)prodQnA.get(i)).getSecret_yn() + "\"";
			
			result += "}";
			if(i != prodQnA.size() -1) {
				result += ", ";
			}
		}
		result += "]";
		System.out.println("result ::::: " + result);
		//String personJson = "[{\"id\":\""+"0" +"\",\"name\":\""+"dd" +"\",\"password\":\""+"bb" +"\",\"email\":\""+"pp"+"\"}, {\"id\":\""+"123" +"\",\"name\":\""+"dd" +"\",\"password\":\""+"bb" +"\",\"email\":\""+"pp"+"\"}]";
		//System.out.println(personJson);
		
		try {	
			response.getWriter().print(result);
		} catch(IOException e) {
			e.printStackTrace();
		}

	}	
	
	@Override
	@RequestMapping(value = "/detailAnswer.do", method = { RequestMethod.POST, RequestMethod.POST })
	public void manageAnswer(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); //select data
		List QnAanswer = null;
		String result = "";
		
		Map<String, Object> dataMap = new HashMap<String, Object>(); //insert data
		Enumeration enu = request.getParameterNames();
		//parameter로 넘어온 값들을 dataMap이라는 Map에 저장한다.
		while (enu.hasMoreElements()) { 
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			dataMap.put(name, value);
			System.out.println(dataMap);
		}
		
		String prod_number = (String)dataMap.get("prod_number");
		String qna_number = (String)dataMap.get("qna_number");
		String command = (String) dataMap.get("command");
		
		searchMap.put("prod_number", prod_number);
		searchMap.put("qna_number", qna_number);
		
		if(command.equals("insert")) { //답변 등록일 경우
			S_P001_D003Service.insertAnswer(dataMap);	
		}else { //답변 삭제일 경우
			System.out.println("prod_number" + prod_number + ", qna_number:" + qna_number);
			S_P001_D003Service.deleteAnswer(dataMap);
		}
		
		QnAanswer = S_P001_D003Service.selectAnswer(searchMap);
		
		
		
		result += "{";
		result += "\"answer_content\":\"" + ((S_P001_D003VO)QnAanswer.get(0)).getAnswer_content() + "\",";
		result += "\"answer_date\":\"" + ((S_P001_D003VO)QnAanswer.get(0)).getAnswer_date() + "\",";
		result += "\"qna_number\":\"" + ((S_P001_D003VO)QnAanswer.get(0)).getQna_number() + "\"";
		result += "}";
		
		System.out.println("result ::::: " + result);
		
		try {	
			response.getWriter().print(result);
		} catch(IOException e) {
			e.printStackTrace();
		}

	}	
	
}
