package project.Etc.P002.D002.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Etc.P002.D002.vo.E_P002_D002VO;

public interface E_P002_D002DAO {
	public List<E_P002_D002VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void insertData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;

}
