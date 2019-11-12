package project.FleaMarket.P002.D007.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.FleaMarket.P002.D007.vo.F_P002_D007VO;


public interface F_P002_D007Service {
	 public List<F_P002_D007VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 public void saveData(Map<String, String[]> dataMap)  throws DataAccessException ;
}
