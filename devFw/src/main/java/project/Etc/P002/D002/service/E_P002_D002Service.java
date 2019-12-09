package project.Etc.P002.D002.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Etc.P002.D002.vo.E_P002_D002VO;

public interface E_P002_D002Service {

	public List<E_P002_D002VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	void saveData(Map<String, String[]> dataMap) throws DataAccessException;

}
