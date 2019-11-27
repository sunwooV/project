package project.Customers.P008.D001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Customers.P008.D001.vo.C_P008_D001VO;

public interface C_P008_D001DAO {

	List<C_P008_D001VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	void updateData(Map<String, String> row) throws DataAccessException;

	void insertData(Map<String, String> row) throws DataAccessException;

	void deleteData(Map<String, String> row) throws DataAccessException;

}
