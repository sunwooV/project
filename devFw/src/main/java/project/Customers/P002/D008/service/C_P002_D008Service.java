package project.Customers.P002.D008.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import project.Customers.P002.D008.vo.C_P002_D008VO;

public interface C_P002_D008Service {

	public C_P002_D008VO point_check(String memberid, HttpServletResponse response) throws Exception;
	public List<C_P002_D008VO> boardList(String memberid) throws Exception ;
	public C_P002_D008VO grade_check(String memberid, HttpServletResponse response) throws Exception;
}
