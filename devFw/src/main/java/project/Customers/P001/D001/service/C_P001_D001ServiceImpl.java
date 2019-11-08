package project.Customers.P001.D001.service;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.Customers.P001.D001.dao.C_P001_D001DAO;
import project.Customers.P001.D001.vo.C_P001_D001VO;


@Service("C_P001_D001Service")
@Transactional(propagation = Propagation.REQUIRED)
public class C_P001_D001ServiceImpl implements C_P001_D001Service {
	
	@Inject
	private C_P001_D001DAO c_p001_d001_DAO;

	@Override
	public void check_id(String memberid, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(c_p001_d001_DAO.check_id(memberid));
		out.close();
				
		
	}

	@Override
	public void check_email(String email, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(c_p001_d001_DAO.check_email(email));
		out.close();
	}
	//
	@Override
	public void check_join(String userId, HttpServletResponse response) throws Exception{
		PrintWriter out = response.getWriter();
		 if((c_p001_d001_DAO.check_join(userId)) == null) {
			 System.out.println("2222222222222222222222222222222222222222222222222222222");
			 out.println("<script>");
				out.println("location.href='http://localhost:8090/devFw/kakao_joinInit.do';");
				out.println("</script>");
				out.close();
		 }else {
			 out.println("<script>");
				out.println("location.href='http://localhost:8090/devFw/main.do';");
				out.println("</script>");
				out.close();
		 }
	}
	
	@Override
	public int kakao_join_member(C_P001_D001VO member, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
	  if (c_p001_d001_DAO.check_email(member.getEmail()) == 1) {
			out.println("<script>");
			out.println("alert('동일한 이메일이 있습니다. 일반회원으로 로그인 해주세요');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		}
	  else {
			c_p001_d001_DAO.kakao_join_member(member);
			return 1;
		}
	}

	@Override
	public int join_member(C_P001_D001VO member, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (c_p001_d001_DAO.check_id(member.getMemberid()) == 1) {
			out.println("<script>");
			out.println("alert('동일한 아이디가 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else if (c_p001_d001_DAO.check_email(member.getEmail()) == 1) {
			out.println("<script>");
			out.println("alert('동일한 이메일이 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		}else {
			member.setApproval_key(create_key());
			c_p001_d001_DAO.join_member(member);
			//인증메일 발송
			send_mail(member,"join");
			out.println("<script>");
			out.println("alert('이메일인증해주세요.');");
			out.println("location.href='http://localhost:8090/devFw/main.do';");
			out.println("</script>");
			out.close();
			return 1;
		}
	}
	//렌덤키 발생
	@Override
	public String create_key() throws Exception {
		String key = "";
		Random rd = new Random();

		for (int i = 0; i < 8; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}
	
	// 이메일 발송
		@Override
		public void send_mail(C_P001_D001VO member,String div) throws Exception {
			// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";
			String hostSMTPid = "wpsl76";
			String hostSMTPpwd = "sdetrycherry852!";

			// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "wpsl76@naver.com";
			String fromName = "Spring Homepage";
			String subject = "";
			String msg = "";

			// 회원가입 메일 내용
			if(div.equals("join")) {
			subject = "Spring Homepage 회원가입 인증 메일입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += member.getMemberid() + "님 회원가입을 환영합니다.</h3>";
			msg += "<div style='font-size: 130%'>";
			msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
			msg += "<form method='post' action='http://localhost:8090/devFw/approval_member.do'>";
			msg += "<input type='hidden' name='email' value='" + member.getEmail() + "'>";
			msg += "<input type='hidden' name='approval_key' value='" + member.getApproval_key() + "'>";
			msg += "<input type='submit' value='인증'></form><br/></div>";
		    }else if(div.equals("find_pw")) {
				subject = "금도끼 은도끼 비밀번호 입니다.";
				msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
				msg += "<h3 style='color: blue;'>";
				msg += member.getMemberid() + "님의 비밀번호 입니다.</h3>";
				msg += "<p>비밀번호 : ";
				msg += member.getPw()+ "</p>";
				msg += "<div style='font-size: 130%'>";
				msg += "하단의  버튼 클릭 시 홈페이지로 돌아갑니다.</div><br/>";
				msg += "<form method='post' action='http://localhost:8090/devFw/main.do'>";
				msg += "<input type='hidden' name='email' value='" + member.getEmail() + "'>";
				msg += "<input type='button'>";
				msg += "<input type='submit' value='로그인하기'></form><br/></div>";
			}
	
			// 받는 사람 E-Mail 주소
			String mail = member.getEmail();
			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(587);

				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg(msg);
				email.send();
			} catch (Exception e) {
				System.out.println("메일발송 실패 : " + e);
			}
		}
		
		
		
		// 회원 인증
		@Override
		public void approval_member(C_P001_D001VO member, HttpServletResponse response) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			if (c_p001_d001_DAO.approval_member(member) == 0) { // 이메일 인증에 실패하였을 경우
				out.println("<script>");
				out.println("alert('잘못된 접근입니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
			} else { // 이메일 인증을 성공하였을 경우
				out.println("<script>");
				out.println("alert('인증이 완료되었습니다. 로그인해주세요.');");
				out.println("location.href='http://localhost:8090/devFw/main.do';");
				out.println("</script>");
				out.close();
			}
		}
		
		// 로그인
		@Override
		public C_P001_D001VO login(C_P001_D001VO member, HttpServletResponse response) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			// 등록된 아이디가 없으면
			if(c_p001_d001_DAO.check_id(member.getMemberid()) == 0) {
				out.println("<script>");
				out.println("alert('등록된 아이디가 없습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			} else {
				String pw = member.getPw();
				member = c_p001_d001_DAO.login(member.getMemberid());
				// 비밀번호가 다를 경우
				if(!member.getPw().equals(pw)) {
					out.println("<script>");
					out.println("alert('비밀번호가 다릅니다.');");
					out.println("history.go(-1);");
					out.println("</script>");
					out.close();
					return null;
				// 이메일 인증을 하지 않은 경우
				}else if(!member.getApproval_status().equals("true")) {
					out.println("<script>");
					out.println("alert('이메일 인증 후 로그인 하세요.');");
					out.println("history.go(-1);");
					out.println("</script>");
					out.close();
					return null;
	            // 로그인 일자 업데이트 및 회원정보 리턴			
				}else {
					c_p001_d001_DAO.update_log(member.getMemberid());
					return member;
				}
			}
		}
		
		// 로그아웃
		@Override
		public void logout(HttpServletResponse response) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			response.sendRedirect("/devFw/main.do");
		}
		
		// 비밀번호 찾기
		@Override
		public void find_pw(HttpServletResponse response, C_P001_D001VO member) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			// 아이디가 없으면
			if(c_p001_d001_DAO.check_id(member.getMemberid()) == 0) {
				out.println("<script>");
				out.println("alert('등록된 아이디가 없습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
			}
			// 가입에 사용한 이메일이 아니면
			else if(!member.getEmail().equals(c_p001_d001_DAO.login(member.getMemberid()).getEmail())) {
				out.println("<script>");
				out.println("alert('등록된 이메일이 없습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
			}else {
		
				// 비밀번호 변경 메일 발송
				String pw="";
				for (int i = 0; i < 12; i++) {
					pw += (char) ((Math.random() * 26) + 97);
				}
				member.setPw(pw);
				// 비밀번호 변경
				c_p001_d001_DAO.update_pw(member);
				send_mail(member,"find_pw");
				
				out.println("<script>");
				out.println("alert('이메일로 비민번호를 보냈습니다.');");
				out.println("location.href='http://localhost:8090/devFw/main.do';");
				out.println("</script>");
				out.close();
			}
		}                                                                                                                                                                                                                                    
}




