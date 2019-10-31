package project.Customers.p001.d001.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.Customers.p001.d001.vo.C_P001_D002_VO;


public interface C_P001_D002_Service {
	public void check_id(String memberid, HttpServletResponse response) throws Exception;
	public void check_email(String email, HttpServletResponse response) throws Exception;
	public int join_member(C_P001_D002_VO member, HttpServletResponse response) throws Exception;
	public void send_mail(C_P001_D002_VO member) throws Exception;
	public void approval_member(C_P001_D002_VO member, HttpServletResponse response) throws Exception;
	public String create_key() throws Exception;
	public C_P001_D002_VO login(C_P001_D002_VO member, HttpServletResponse response) throws Exception;
	public void logout(HttpServletResponse response) throws Exception;
}
