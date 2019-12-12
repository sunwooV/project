package project.Customers.P002.D009.service;

import javax.servlet.http.HttpServletResponse;

import project.Customers.P002.D009.vo.C_P002_D009VO;

public interface C_P002_D009Service {
	
	public C_P002_D009VO update(C_P002_D009VO member,HttpServletResponse response) throws Exception;
	public C_P002_D009VO modify(C_P002_D009VO member, String old_pw, HttpServletResponse response) throws Exception;
	 public C_P002_D009VO check(String memberid,HttpServletResponse response) throws Exception;
      
	public boolean out(C_P002_D009VO member, HttpServletResponse response) throws Exception;

}
