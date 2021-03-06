package project.Customers.P007.D001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Customers.P007.D001.vo.C_P007_D001VO;



public interface C_P007_D001DAO {
	
	    public List<C_P007_D001VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	    
	    public void insertData(Map<String, String> row) throws DataAccessException;

		public void updateData(Map<String, String> row) throws DataAccessException;

		public void deleteData(Map<String, String> row) throws DataAccessException;

}
