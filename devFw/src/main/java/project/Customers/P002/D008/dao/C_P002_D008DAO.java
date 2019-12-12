package project.Customers.P002.D008.dao;

import java.util.List;

import project.Customers.P002.D008.vo.C_P002_D008VO;

public interface C_P002_D008DAO {
	public C_P002_D008VO point_check(String memberid) throws Exception;
	
	public List<C_P002_D008VO> boardList(String memberid) throws Exception;

	public C_P002_D008VO grade_check(String memberid) throws Exception;

}
