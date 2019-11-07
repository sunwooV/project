package project.Customers.p001.d001.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import project.Customers.p001.d001.vo.C_P001_D002_VO;



@Repository("C_P001_D002_DAO")
public class C_P001_D002_DAOImpl implements C_P001_D002_DAO {
	
	@Autowired
	SqlSession sqlsession = null;
	
	// 아이디 중복 검사
	public int check_id(String memberid) throws Exception{
		return sqlsession.selectOne("Customers.join.check_id", memberid);
	}
	//이메일중복검사
	public int check_email(String email) throws Exception{
		return sqlsession.selectOne("Customers.join.check_email", email);
	}
	public String check_join(String userId) throws Exception{
		System.out.println("33333333333333333333333333333333333333333333"+userId);
		return sqlsession.selectOne("Customers.join.check_join", userId);
	}
	
	// 회원가입
	@Transactional
	public int join_member(C_P001_D002_VO member) throws Exception{
		return sqlsession.insert("Customers.join.join_member", member);
	}
	
	@Transactional
	public int kakao_join_member(C_P001_D002_VO member) throws Exception{
		return sqlsession.insert("Customers.join.kakao_join_member", member);
	}
	
	// 이메일 인증
		@Transactional
		public int approval_member(C_P001_D002_VO member) throws Exception{
			return sqlsession.update("Customers.join.approval_member", member);
		}
		
		// 로그인 검사
		public C_P001_D002_VO login(String memberid) throws Exception{
			return sqlsession.selectOne("Customers.join.login", memberid);
		}
		
		// 로그인 접속일자 변경
		@Transactional
		public int update_log(String memberid) throws Exception{
			return sqlsession.update("Customers.join.update_log", memberid);
		}
		
		// 비밀번호 변경
		@Transactional
		public int update_pw(C_P001_D002_VO member) throws Exception{
			return sqlsession.update("Customers.join.update_pw", member);
		}
	}


