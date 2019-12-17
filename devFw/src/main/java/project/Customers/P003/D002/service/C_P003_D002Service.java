package project.Customers.P003.D002.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Customers.P003.D002.vo.C_P003_D002VO;

public interface C_P003_D002Service {
	public List<C_P003_D002VO> sellerCheck(Map<String, Object> searchMap) throws DataAccessException;
	public List<C_P003_D002VO> sellerProduct(Map<String, Object> searchMap) throws DataAccessException;
}
