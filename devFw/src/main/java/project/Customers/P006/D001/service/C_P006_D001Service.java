package project.Customers.P006.D001.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Customers.P006.D001.vo.C_P006_D001VO;

public interface C_P006_D001Service {
	public List<C_P006_D001VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException;


}
