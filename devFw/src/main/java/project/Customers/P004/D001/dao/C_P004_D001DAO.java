package project.Customers.P004.D001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Customers.P004.D001.vo.C_P004_D001VO;



public interface C_P004_D001DAO {
	 public List<C_P004_D001VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

		public void updateData(Map<String, String> row) throws DataAccessException;

		public void deleteData(Map<String, String> row) throws DataAccessException;
		
		public void black_out(Map<String, String> row) throws DataAccessException;
	
		public void black_insert(Map<String, String> row) throws DataAccessException;
		 

}
