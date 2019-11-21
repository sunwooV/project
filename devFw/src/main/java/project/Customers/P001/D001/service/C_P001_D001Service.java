package project.Customers.P001.D001.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.Customers.P001.D001.vo.C_P001_D001VO;


public interface C_P001_D001Service {
	public void check_id(String memberid, HttpServletResponse response) throws Exception;
	public void check_email(String email, HttpServletResponse response) throws Exception;
	public int join_member(C_P001_D001VO member, HttpServletResponse response) throws Exception;
	public void send_mail(C_P001_D001VO member,String div) throws Exception;
	public void approval_member(C_P001_D001VO member, HttpServletResponse response) throws Exception;
	public String create_key() throws Exception;
	public C_P001_D001VO login(C_P001_D001VO member, HttpServletResponse response) throws Exception;
	public void logout(HttpServletResponse response) throws Exception;
	public void find_pw(HttpServletResponse response, C_P001_D001VO member) throws Exception;
	public int kakao_join_member(C_P001_D001VO member, HttpServletResponse response) throws Exception;
	public void check_join(String userId, HttpServletResponse response) throws Exception;
	public void black_check(String email, HttpServletResponse response) throws Exception;
	
	public String find_id(HttpServletResponse response, C_P001_D001VO member) throws Exception;
	public void again(String email, HttpServletResponse response) throws Exception;
}
