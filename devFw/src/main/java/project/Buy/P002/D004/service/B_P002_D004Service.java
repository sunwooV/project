package project.Buy.P002.D004.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Buy.P002.D004.vo.B_P002_D004VO;



public interface B_P002_D004Service {
	 public List<B_P002_D004VO> selectCart(Map<String, Object> searchMap) throws DataAccessException;
}
