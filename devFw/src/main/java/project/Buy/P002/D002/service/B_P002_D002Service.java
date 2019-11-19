package project.Buy.P002.D002.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Buy.P002.D002.vo.B_P002_D002VO;

public interface B_P002_D002Service {
	 public List<B_P002_D002VO> selectCart(Map<String, Object> searchMap) throws DataAccessException;
}
