package project.Customers.p001.d001.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import project.Customers.p001.d001.service.C_P001_D002_Service;
import project.Customers.p001.d001.vo.C_P001_D002_VO;

//import project.Customers.p001.d001.service.C_P001_D002_Service;
//import project.Customers.p001.d001.vo.C_P001_D002_VO;



@Controller("C_P001_D002_Controller")

public class C_P001_D002_ControllerImpl implements C_P001_D002_Controller{

	private static final Logger logger = LoggerFactory.getLogger(C_P001_D002_ControllerImpl.class);
	@Autowired
	C_P001_D002_Service c_p001_d002_Service;
	@Autowired
	C_P001_D002_VO c_p001_d002_VO;
	
	
	@Override
	@RequestMapping(value ="/Customers/p001/d001/main.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("main/main");
		return mav;
	}
	
	
	@Override
	@RequestMapping(value ="/Customers/p001/d001/loginInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView loginInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/C_P001_D002");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/Customers/p001/d001/joinInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView joinInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav2 = new ModelAndView("hm/C_P001_D001");
		return mav2;
	}
	
	@RequestMapping(value = "/Customers/p001/d001/check_id.do", method =  { RequestMethod.GET, RequestMethod.POST })
	public void check_id(@RequestParam("memberid") String memberid, HttpServletResponse response) throws Exception{
		System.out.println("안녕안녕안녕앙ㄴ녕아ㅏ아아아아아아아아아앙");
		c_p001_d002_Service.check_id(memberid, response);
		
	}
	
	@RequestMapping(value = "/Customers/p001/d001/check_email.do", method =  { RequestMethod.GET, RequestMethod.POST })
	public void check_email(@RequestParam("email") String email, HttpServletResponse response) throws Exception{
		c_p001_d002_Service.check_email(email, response);
	}
	
	@RequestMapping(value = "/Customers/p001/d001/join_member.do", method =  { RequestMethod.GET, RequestMethod.POST })
	public String join_member(@ModelAttribute C_P001_D002_VO member, RedirectAttributes rttr, HttpServletResponse response) throws Exception{
		rttr.addFlashAttribute("result", c_p001_d002_Service.join_member(member, response));
		return "main/main";
	}
	
	@RequestMapping(value = "/Customers/p001/d001/approval_member.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void approval_member(@ModelAttribute C_P001_D002_VO member, HttpServletResponse response) throws Exception{
		c_p001_d002_Service.approval_member(member, response);
	}
	
	 
		
		// 로그인
		@RequestMapping(value = "/Customers/p001/d001/login.do", method =  { RequestMethod.GET, RequestMethod.POST })
		public String login(@ModelAttribute C_P001_D002_VO member, HttpSession session, HttpServletResponse response) throws Exception{
			member = c_p001_d002_Service.login(member, response);
			session.setAttribute("member", member);
			return "main/main";
		}
		
		// 로그아웃
		@RequestMapping(value = "/Customers/p001/d001/logout.do", method =  { RequestMethod.GET, RequestMethod.POST })
		public void logout(HttpSession session, HttpServletResponse response) throws Exception{
			session.invalidate();
//			session.removeAttribute("member");
			c_p001_d002_Service.logout(response);
		}
		
		
		
		//카카오
		
		public String getAccessToken(String authorize_code) {
		      String access_Token = "";
		      String refresh_Token = "";
		      String reqURL = "https://kauth.kakao.com/oauth/token";

		      try {
		         URL url = new URL(reqURL);
		         HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		         // POST 요청을 위해 기본값이 false인 setDoOutput을 true로
		         conn.setRequestMethod("POST");
		         conn.setDoOutput(true);

		         // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
		         BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		         StringBuilder sb = new StringBuilder();
		         sb.append("grant_type=authorization_code");
		         sb.append("&client_id=6694b0d17c224582f266da703a1a0558");
		         sb.append("&redirect_uri=http://localhost:8090/devFw/Customers/p001/d001/kakaoLogin.do");
		         sb.append("&code=" + authorize_code);
		         bw.write(sb.toString());
		         bw.flush();

		         // 결과 코드가 200이라면 성공
		         int responseCode = conn.getResponseCode();
		         System.out.println("responseCode : " + responseCode);

		         // 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
		         BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		         String line = "";
		         String result = "";

		         while ((line = br.readLine()) != null) {
		            result += line;
		         }
		         System.out.println("response body : " + result);

		         // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
		         JsonParser parser = new JsonParser();
		         JsonElement element = parser.parse(result);

		         access_Token = element.getAsJsonObject().get("access_token").getAsString();
		         refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

		         System.out.println("access_token : " + access_Token);
		         System.out.println("refresh_token : " + refresh_Token);

		         br.close();
		         bw.close();
		      } catch (IOException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }

		      return access_Token;
		   }

		   public HashMap<String, Object> getUserInfo(String access_Token) {

		      // 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		      HashMap<String, Object> userInfo = new HashMap<String, Object>();
		      String reqURL = "https://kapi.kakao.com/v2/user/me";
		      try {
		         URL url = new URL(reqURL);
		         HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		         conn.setRequestMethod("POST");

		         // 요청에 필요한 Header에 포함될 내용
		         conn.setRequestProperty("Authorization", "Bearer " + access_Token);

		         int responseCode = conn.getResponseCode();
		         System.out.println("responseCode : " + responseCode);

		         BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

		         String line = "";
		         String result = "";

		         while ((line = br.readLine()) != null) {
		            result += line;
		         }
		         System.out.println("response body : " + result);

		         JsonParser parser = new JsonParser();
		         JsonElement element = parser.parse(result);

		         JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
		         JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

		         String nickname = properties.getAsJsonObject().get("nickname").getAsString();
		         String email = kakao_account.getAsJsonObject().get("email").getAsString();

		         userInfo.put("nickname", nickname);
		         userInfo.put("email", email);

		      } catch (IOException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }

		      return userInfo;
		   }
		   
		   @RequestMapping(value = "/Customers/p001/d001/kakaoLogin.do")
		   public String login(@RequestParam("code") String code, HttpSession session) {
		      String access_Token = getAccessToken(code);
		      HashMap<String, Object> userInfo = getUserInfo(access_Token);
		      System.out.println("login Controller카카오지롱: " + userInfo);

		      // 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
		      if (userInfo.get("email") != null) {
		         session.setAttribute("member", true);
		         session.setAttribute("memberInfo",userInfo);
		         session.setAttribute("userId", userInfo.get("email"));
		         session.setAttribute("access_Token", access_Token);
		      }
		      return "main/main";
		   }
		   
	
			//비밀번호 찾느 화면
			@RequestMapping(value = "/Customers/p001/d001/find_pw_form.do")
			public String find_pw_form() throws Exception{
				return "hm/find_pw_form";
			}
			
			//비밀번호 찾기
			@RequestMapping(value = "/Customers/p001/d001/find_pw.do", method = { RequestMethod.GET, RequestMethod.POST } )
			public void find_pw(@ModelAttribute C_P001_D002_VO member, HttpServletResponse response) throws Exception{
				
				System.out.println("---------------------------------비밀1: "+ member.getPw());
				c_p001_d002_Service.find_pw(response, member);
			}
		
}




