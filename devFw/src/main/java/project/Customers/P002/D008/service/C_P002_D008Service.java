package project.Customers.P002.D008.service;

import javax.servlet.http.HttpServletResponse;

import project.Customers.P002.D008.vo.C_P002_D008VO;

public interface C_P002_D008Service {

	public C_P002_D008VO point_check(String memberid, HttpServletResponse response) throws Exception;
}
