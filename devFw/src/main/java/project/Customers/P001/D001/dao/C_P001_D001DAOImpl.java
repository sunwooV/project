package project.Customers.P001.D001.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import project.Customers.P001.D001.vo.C_P001_D001VO;
import project.Customers.P002.D009.vo.C_P002_D009VO;



@Repository("C_P001_D001DAO")
public class C_P001_D001DAOImpl implements C_P001_D001DAO {
	
	@Autowired
	SqlSession sqlsession = null;
	
	// 아이디 중복 검사
	@Transactional
	public int check_id(String memberid) throws Exception{
		return sqlsession.selectOne("Customers.join.check_id", memberid);
	}
	//이메일중복검사
	@Transactional
	public int check_email(String email) throws Exception{
		return sqlsession.selectOne("Customers.join.check_email", email);
	}
	
	@Transactional
	public int black_check(String email) throws Exception{
		return sqlsession.selectOne("Customers.join.black_check", email);
	}

	@Transactional
	public String check_join(String userId) throws Exception{
		System.out.println("33333333333333333333333333333333333333333333"+userId);
		return sqlsession.selectOne("Customers.join.check_join", userId);
	}
	
	// 회원가입
	@Transactional
	public int join_member(C_P001_D001VO member) throws Exception{
		return sqlsession.insert("Customers.join.join_member", member);
	}
	
	@Transactional
	public int kakao_join_member(C_P001_D001VO member) throws Exception{
		return sqlsession.insert("Customers.join.kakao_join_member", member);
	}
	
	// 이메일 인증
		@Transactional
		public int approval_member(C_P001_D001VO member) throws Exception{
		
			return sqlsession.update("Customers.join.approval_member", member);
		}
		
		// 로그인 검사
		@Transactional
		public C_P001_D001VO login(String memberid) throws Exception{
			return sqlsession.selectOne("Customers.join.login", memberid);
		}
		
		// 로그인 접속일자 변경
		@Transactional
		public int update_log(String memberid) throws Exception{
			return sqlsession.update("Customers.join.update_log", memberid);
		}
		
		// 비밀번호 변경
		@Transactional
		public int update_pw(C_P001_D001VO member) throws Exception{
			return sqlsession.update("Customers.join.update_pw", member);
		}
		
		// 아이디 찾기
		@Transactional
		public String find_id(C_P001_D001VO member) throws Exception{
			return sqlsession.selectOne("Customers.join.find_id", member);
		}
		
		
		  @Transactional
	     	public int again(String email) throws Exception{
	     		return sqlsession.delete("Customers.join.again", email);
	     	}
		
	}


