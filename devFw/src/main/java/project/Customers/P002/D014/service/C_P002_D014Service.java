package project.Customers.P002.D014.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Customers.P002.D014.vo.C_P002_D014VO;

public interface C_P002_D014Service {
	public List<C_P002_D014VO> myLikeProd(Map<String, Object> searchMap) throws DataAccessException;

	public void delLikeProd(Map<String, Object> searchMap) throws DataAccessException;
}
