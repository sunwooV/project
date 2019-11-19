package project.Buy.P002.D003.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Buy.P002.D003.vo.B_P002_D003VO;



public interface B_P002_D003Service {
	 public List<B_P002_D003VO> selectCart(Map<String, Object> searchMap) throws DataAccessException;
}
