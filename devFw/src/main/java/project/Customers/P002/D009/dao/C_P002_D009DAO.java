package project.Customers.P002.D009.dao;



import org.springframework.transaction.annotation.Transactional;

import project.Customers.P002.D009.vo.C_P002_D009VO;

public interface C_P002_D009DAO {

	public C_P002_D009VO check(String memberid) throws Exception;
	
	// 마이페이지

	public int update(C_P002_D009VO member) throws Exception;
	
	// 비밀번호 변경

	public int modify(C_P002_D009VO member) throws Exception;

	
	public int out(C_P002_D009VO member) throws Exception;
	
 	public int out_insert(C_P002_D009VO member) throws Exception;

     public int check_pw(C_P002_D009VO member) throws Exception;
}
