package project.Customers.P008.D001.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Customers.P008.D001.vo.C_P008_D001VO;

public interface C_P008_D001Service {

	List<C_P008_D001VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	void saveData(Map<String, String[]> dataMap) throws DataAccessException;

}
