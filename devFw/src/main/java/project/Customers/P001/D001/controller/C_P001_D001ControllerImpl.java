package project.Customers.P001.D001.controller;

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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import project.Customers.P001.D001.service.C_P001_D001Service;
import project.Customers.P001.D001.vo.C_P001_D001VO;

//import project.Customers.p001.d001.service.C_P001_D002_Service;
//import project.Customers.p001.d001.vo.C_P001_D002_VO;



@Controller("C_P001_D001Controller")

public class C_P001_D001ControllerImpl implements C_P001_D001Controller{

	private static final Logger logger = LoggerFactory.getLogger(C_P001_D001ControllerImpl.class);
	@Autowired
	C_P001_D001Service c_p001_d001_Service;
	@Autowired
	C_P001_D001VO c_p001_d001_VO;
	
	

	
	
	@Override
	@RequestMapping(value ="/loginInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView loginInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("Customers/p001_d001_login");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/joinInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView joinInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav1 = new ModelAndView("Customers/p001_d001_join");
		return mav1;
	}
	
	@Override
	@RequestMapping(value = "/kakao_joinInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView kakao_joinInit(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		request.setCharacterEncoding("utf-8");
		session.removeAttribute("member");
		ModelAndView mav1 = new ModelAndView("Customers/p001_d001_kakaojoin");
		return mav1;
	}
	
	@Override
	@RequestMapping(value = "/findIdInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findIdInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav1 = new ModelAndView("Customers/p001_d001_findIdForm");
		return mav1;
	}
	
	
	@Override
	@RequestMapping(value = "/check_id.do", method =  { RequestMethod.GET, RequestMethod.POST })
	public void check_id(@RequestParam("memberid") String memberid, HttpServletResponse response) throws Exception{
		c_p001_d001_Service.check_id(memberid, response);
		
	}
	
	@Override
	@RequestMapping(value = "/again.do", method =  { RequestMethod.GET, RequestMethod.POST })
	public void again(@RequestParam("email") String email, HttpServletResponse response) throws Exception{
		c_p001_d001_Service.again(email, response);
		
	}
	@Override
	@RequestMapping(value = "/black_check.do", method =  { RequestMethod.GET, RequestMethod.POST })
	public void black_check(@RequestParam("email") String email, HttpServletResponse response) throws Exception{
		c_p001_d001_Service.black_check(email, response);
		
	}
	
	@Override
	@RequestMapping(value = "/check_email.do", method =  { RequestMethod.GET, RequestMethod.POST })
	public void check_email(@RequestParam("email") String email, HttpServletResponse response) throws Exception{
		c_p001_d001_Service.check_email(email, response);
	}
	
	@Override
	@RequestMapping(value = "/join_member.do", method =  { RequestMethod.GET, RequestMethod.POST })
	public String join_member(@ModelAttribute C_P001_D001VO member, RedirectAttributes rttr, HttpServletResponse response) throws Exception{
		rttr.addFlashAttribute("result", c_p001_d001_Service.join_member(member, response));
		return "redirect:/main.do";
	}
	
	@Override
	@RequestMapping(value = "/kakao_join_member.do", method =  { RequestMethod.GET, RequestMethod.POST })
	public String kakao_join_member(@ModelAttribute C_P001_D001VO member, RedirectAttributes rttr, HttpServletResponse response, HttpSession session) throws Exception{
		rttr.addFlashAttribute("result", c_p001_d001_Service.kakao_join_member(member, response));
		session.setAttribute("member", true);
		return "redirect:/main.do";
	}
	
	@Override
	@RequestMapping(value = "/approval_member.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void approval_member(@ModelAttribute C_P001_D001VO member, HttpServletResponse response) throws Exception{
		c_p001_d001_Service.approval_member(member, response);
	}
	
	@Override
	@RequestMapping(value = "/join_point.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void join_point(@ModelAttribute C_P001_D001VO member, HttpServletResponse response) throws Exception{
		c_p001_d001_Service.join_point(member, response);
		System.out.println("controller아이디=="+member.getMemberid());
	}
	
	 
		
		// 로그인
	    @Override
		@RequestMapping(value = "/login.do", method =  { RequestMethod.GET, RequestMethod.POST })
		public String login(@ModelAttribute C_P001_D001VO member, HttpSession session, HttpServletResponse response) throws Exception{
			member = c_p001_d001_Service.login(member, response);
			session.setAttribute("member", member);
			session.setAttribute("memberInfo", member);
			session.setAttribute("memberid", member.getMemberid());
			session.setAttribute("address", member.getAddress());
			session.setAttribute("detailAddress", member.getDetailAddress());
			session.setAttribute("extraAddress", member.getExtraAddress());
			session.setAttribute("roadAddress", member.getRoadAddress());
			session.setAttribute("jibunAddress", member.getJibunAddress());
			session.setAttribute("nickname", member.getNickname());
			session.setAttribute("birth", member.getBirth());
			session.setAttribute("email", member.getEmail());
			session.setAttribute("name", member.getName());
			session.setAttribute("phonenumber", member.getPhonenumber());
			session.setAttribute("approval_status", member.getApproval_status());
			System.out.println("와우우우우우유우"+member.getExtraAddress());
			return "redirect:/main.do";
		}
		
		// 로그아웃
	    @Override
		@RequestMapping(value = "/logout.do", method =  { RequestMethod.GET, RequestMethod.POST })
		public void logout(HttpSession session, HttpServletResponse response) throws Exception{
			session.invalidate();
//			session.removeAttribute("member");
			c_p001_d001_Service.logout(response);
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
		         sb.append("&redirect_uri=http://localhost:8090/devFw/kakaoLogin.do");
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
		   
		   @RequestMapping(value = "/kakaoLogin.do")
		   public String login(@RequestParam("code") String code, HttpSession session, HttpServletResponse response) {
		      String access_Token = getAccessToken(code);
		      HashMap<String, Object> userInfo = getUserInfo(access_Token);
		      System.out.println("login Controller카카오: " + userInfo);

		      // 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
		      if (userInfo.get("email") != null) {
		         session.setAttribute("member", true);
		         session.setAttribute("memberInfo",userInfo);
		         session.setAttribute("userId", userInfo.get("email"));
		         session.setAttribute("username", userInfo.get("nickname"));
		         session.setAttribute("access_Token", access_Token);
		      }	      
//		      String userId = (String)session.getAttribute("userId");	    
		      return "redirect:/check_join.do";
		   }
		   
	
			//비밀번호 찾는 화면
			@RequestMapping(value = "/find_pw_form.do")
			public String find_pw_form() throws Exception{
				return "Customers/p001_d001_findPwForm";
			}
			
			
			//비밀번호 찾기
			@RequestMapping(value = "/find_pw.do", method = { RequestMethod.GET, RequestMethod.POST } )
			public void find_pw(@ModelAttribute C_P001_D001VO member, HttpServletResponse response) throws Exception{
				c_p001_d001_Service.find_pw(response, member);
			}
			
			//카카오 로그인시 최초 1회만 회원 가입 하기 위헤서
			@RequestMapping(value = "/check_join.do", method =  { RequestMethod.GET, RequestMethod.POST })
			public void check_join(HttpServletResponse response, HttpSession session) throws Exception{
				String userId = (String)session.getAttribute("userId");
				c_p001_d001_Service.check_join(userId, response);
			}
			
			// 아이디 찾기
			@RequestMapping(value = "/find_id.do", method = RequestMethod.POST)
			public String find_id(@ModelAttribute C_P001_D001VO member, RedirectAttributes rttr, HttpServletResponse response, Model md, HttpSession session) throws Exception{
				md.addAttribute("memberid", c_p001_d001_Service.find_id(response, member));
				session.setAttribute("name", member.getName());
				return "Customers/p001_d001_findId";
			}

}




