package project.Customers.P002.D005.controller;

import java.sql.Date;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.inject.Provider;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import project.Customers.P001.D001.vo.C_P001_D001VO;
import project.Customers.P002.D005.service.C_P002_D005Service;
import project.Customers.P002.D005.vo.C_P002_D005FormVO;
import project.Customers.P002.D005.vo.C_P002_D005VO;


public class ChatWebSocketHandler extends TextWebSocketHandler {
	@Autowired
	Provider<C_P002_D005VO> c_p002_d005Provider;
	
	@Autowired
	Provider<C_P001_D001VO> c_p001_d001Provider;
	
	@Autowired
	Provider<C_P002_D005FormVO> formProvider;
	
	@Autowired
	C_P002_D005Service c_p002_d005service;
	
private static final Map<WebSocketSession, C_P001_D001VO> sessionList = new HashMap<WebSocketSession, C_P001_D001VO>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		Map<String, Object> map = session.getAttributes();
		C_P001_D001VO c_p001_d001vo= (C_P001_D001VO) map.get("member");
		sessionList.put(session, c_p001_d001vo);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		sessionList.remove(session);
	}
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		//message.getPayload(); 보낸 메시지
		//session.sendMessage(message);클라이언트로 메시지 전송
		//provider.get(); prototype으로 빈 가져오기
		C_P001_D001VO c_p001_d001vo = sessionList.get(session);
		ObjectMapper mapper = new ObjectMapper();
		C_P002_D005FormVO c_p002_d005FormVO = mapper.readValue(message.getPayload(), C_P002_D005FormVO.class);
		String header=c_p002_d005FormVO.getHeader();
		
		if(header.equals("chat_list")){
			showChatList(c_p002_d005FormVO,session,c_p001_d001vo,mapper);
		}else if(header.equals("send_message")) {
			sendMessage(c_p002_d005FormVO,session,c_p001_d001vo,mapper);
		}else if(header.equals("search_member")) {
			searchMember(c_p002_d005FormVO,session,c_p001_d001vo,mapper);
		}
	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		exception.printStackTrace();
	}
	
	private void showChatList(C_P002_D005FormVO C_P002_D005FormVO,WebSocketSession session,C_P001_D001VO c_p001_d001vo,ObjectMapper mapper) throws Exception {
		HashMap<String,Object> body = C_P002_D005FormVO.getBody();
		String memberid= (String) body.get("memberid");
		
		System.out.println("handler memberId :: ++++ " + memberid + ", sender :: " + c_p001_d001vo.getMemberid());

		C_P002_D005VO c_p002_d005vo = c_p002_d005Provider.get();
		c_p002_d005vo.setSender(c_p001_d001vo.getMemberid());
		c_p002_d005vo.setReceiver(memberid);
		List<C_P002_D005VO> msgResult = c_p002_d005service.selectMessageList(c_p002_d005vo);
		body.clear();
		body.put("result",msgResult);		
		
		String result=mapper.writeValueAsString(C_P002_D005FormVO);
		session.sendMessage(new TextMessage(result));
	}
	
	private void sendMessage(C_P002_D005FormVO C_P002_D005FormVO,WebSocketSession session,C_P001_D001VO c_p001_d001vo,ObjectMapper mapper) throws Exception {
		HashMap<String,Object> body = C_P002_D005FormVO.getBody();
		String receiver=(String) body.get("receiver");
		String message=(String) body.get("message");
		
		C_P002_D005VO c_p002_d005vo = c_p002_d005Provider.get();
		c_p002_d005vo.setSender(c_p001_d001vo.getMemberid());
		c_p002_d005vo.setReceiver(receiver);
		c_p002_d005vo.setContents(message);
		c_p002_d005vo.setSend_date(new Date(Calendar.getInstance().getTimeInMillis()));
		c_p002_d005service.insertMessage(c_p002_d005vo);
		
		for(Entry<WebSocketSession, C_P001_D001VO> entry : ChatWebSocketHandler.sessionList.entrySet()) {
			WebSocketSession recSession = entry.getKey();
			C_P001_D001VO recVO = entry.getValue();

			if(recVO.getMemberid().equals(receiver)) {
				c_p002_d005vo.setMe_at("false");				
				body.clear();
				body.put("result", c_p002_d005vo);
				body.put("sender_id", c_p001_d001vo.getMemberid());
				String result=mapper.writeValueAsString(C_P002_D005FormVO);
				recSession.sendMessage(new TextMessage(result));
			}
		}
		
		c_p002_d005vo.setMe_at("true");
		body.clear();
		body.put("result", c_p002_d005vo);
		String result = mapper.writeValueAsString(C_P002_D005FormVO);
		session.sendMessage(new TextMessage(result));
	}
	
	private void searchMember(C_P002_D005FormVO C_P002_D005FormVO,WebSocketSession session,C_P001_D001VO c_p001_s001VO,ObjectMapper mapper) throws Exception {
		HashMap<String,Object> body = C_P002_D005FormVO.getBody();
		String keyword= (String) body.get("keyword");
		
		Map<String,String> searchMap = new HashMap<String, String>();
		searchMap.put("keyword", keyword);
		searchMap.put("memberid", c_p001_s001VO.getMemberid());
		List<C_P001_D001VO> searchResult = c_p002_d005service.selectSearchList(searchMap); //id, nickname
		
		
		body.clear();
		body.put("result",searchResult);
		String result=mapper.writeValueAsString(C_P002_D005FormVO);
		System.out.println("result!!!!!!!!!="+result);
		session.sendMessage(new TextMessage(result));
	}

}
