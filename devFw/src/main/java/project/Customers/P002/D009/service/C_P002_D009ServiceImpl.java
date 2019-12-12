package project.Customers.P002.D009.service;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.Customers.P001.D001.dao.C_P001_D001DAO;
import project.Customers.P002.D009.dao.C_P002_D009DAO;
import project.Customers.P002.D009.vo.C_P002_D009VO;



@Service("C_P002_D009Service")
@Transactional(propagation = Propagation.REQUIRED)
public class C_P002_D009ServiceImpl implements C_P002_D009Service{
   
   @Inject
   private C_P002_D009DAO c_p002_d009_DAO;
   
   @Override
   public C_P002_D009VO update(C_P002_D009VO member,HttpServletResponse response) throws Exception {
      c_p002_d009_DAO.update(member);
      System.out.println("12313333333333333333333333333333333333333333333333333312==========="+member.getNickname());
      System.out.println("12313333333333333333333333333333333333333333333333333312==========="+member.getMemberid());
      return c_p002_d009_DAO.check(member.getMemberid());
   }
   
   // 비밀번호 변경
   @Override
   public C_P002_D009VO modify(C_P002_D009VO member, String old_pw, HttpServletResponse response) throws Exception {
      response.setContentType("text/html;charset=utf-8");
      PrintWriter out = response.getWriter();
     
      if(!old_pw.equals(c_p002_d009_DAO.check(member.getMemberid()).getPw())) {
         out.println("<script>");
         out.println("alert('기존 비밀번호가 다릅니다.');");
         out.println("history.go(-1);");
         out.println("</script>");
         out.close();
         return null;
      }else {
         c_p002_d009_DAO.modify(member);
         out.println("<script>");
         out.println("alert('비밀번호 수정 완료.');");
         out.println("history.go(-1);");
         out.println("</script>");
         out.close();
         return c_p002_d009_DAO.check(member.getMemberid());
      }
   }
   
   
// 회원탈퇴
	@Override
	public boolean out(C_P002_D009VO member, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(c_p002_d009_DAO.check_pw(member)!= 1) {
			out.println("<script>");
			out.println("alert('회원탈퇴 실패');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return false;
		}else {
			c_p002_d009_DAO.out_insert(member);
			c_p002_d009_DAO.out(member);
			return true;
		}
	}

	@Override
	public C_P002_D009VO check(String memberid, HttpServletResponse response) throws Exception {
		return c_p002_d009_DAO.check(memberid);
	}

}