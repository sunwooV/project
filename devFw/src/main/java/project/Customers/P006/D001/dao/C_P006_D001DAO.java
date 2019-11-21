package project.Customers.P006.D001.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Customers.P006.D001.vo.C_P006_D001VO;

public interface C_P006_D001DAO {
	public List<C_P006_D001VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	public void updateData(Map<String, String> row) throws DataAccessException;
	public void deleteData(Map<String, String> row) throws DataAccessException;

	public void black_out_again(Map<String, String> row) throws DataAccessException;

	public void member_again_insert(Map<String, String> row) throws DataAccessException;

}